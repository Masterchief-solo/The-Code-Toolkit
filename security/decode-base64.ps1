<#
.SYNOPSIS
    Decodes Base64 encoded strings or files.
.DESCRIPTION
    Validates and decodes Base64 content from either a string or file input.
    Includes validation checks and supports multiple encoding types.
.PARAMETER Path
    Path to file containing Base64 encoded content.
.PARAMETER InputString
    Base64 encoded string to decode.
.PARAMETER SaveToFile
    Switch to save output to a file instead of console.
.PARAMETER OutputPath
    Path for output file. Defaults to "decoded_output.txt".
.PARAMETER Encoding
    Specifies the encoding to use for decoding. Default is UTF8.
.EXAMPLE
    .\Decode-Base64.ps1 -InputString "SGVsbG8gV29ybGQ="
    Decodes the Base64 string and outputs to console.
.EXAMPLE
    .\Decode-Base64.ps1 -Path "encoded.txt" -SaveToFile
    Decodes content from file and saves to decoded_output.txt.
.EXAMPLE
    .\Decode-Base64.ps1 -InputString "SGVsbG8gV29ybGQ=" -Encoding ASCII -SaveToFile -OutputPath "result.txt"
    Decodes string using ASCII encoding and saves to specified file.
#>

[CmdletBinding(DefaultParameterSetName='InputString', SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true, ParameterSetName = 'File')]
    [ValidateScript({
        if (-not (Test-Path $_)) {
            throw "Input file does not exist: $_"
        }
        return $true
    })]
    [string]$Path,

    [Parameter(Mandatory = $true, ParameterSetName = 'InputString')]
    [string]$InputString,

    [Parameter(Mandatory = $false)]
    [switch]$SaveToFile,

    [Parameter(Mandatory = $false)]
    [ValidateScript({
        $parent = Split-Path $_ -Parent
        if ($parent -and -not (Test-Path $parent)) {
            throw "Output directory does not exist: $parent"
        }
        return $true
    })]
    [string]$OutputPath = "decoded_output.txt",

    [Parameter(Mandatory = $false)]
    [ValidateSet('UTF8', 'ASCII', 'Unicode')]
    [string]$Encoding = 'UTF8'
)

function Test-Base64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content
    )
    
    Write-Verbose "Validating Base64 content"
    
    if ([string]::IsNullOrEmpty($Content)) {
        Write-Error "Input is empty."
        return $false
    }
    
    if ($Content -notmatch '^[A-Za-z0-9+/]*={0,2}$') {
        Write-Error "Input is not in valid Base64 format."
        return $false
    }
    
    if ($Content.Length % 4 -ne 0) {
        Write-Error "Invalid Base64 length."
        return $false
    }
    
    try {
        [Convert]::FromBase64String($Content) | Out-Null
        Write-Verbose "Base64 validation successful"
        return $true
    }
    catch [FormatException] {
        Write-Error "Invalid Base64 format: $($_.Exception.Message)"
        return $false
    }
    catch {
        Write-Error "Base64 validation failed: $($_.Exception.Message)"
        return $false
    }
}

function ConvertFrom-Base64 {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content,
        
        [Parameter(Mandatory = $false)]
        [string]$Encoding = 'UTF8'
    )
    
    Write-Verbose "Decoding Base64 content using $Encoding encoding"
    
    try {
        $decodedBytes = [Convert]::FromBase64String($Content)
        $encodingType = [System.Text.Encoding]::$Encoding
        $decodedText = $encodingType.GetString($decodedBytes)
        Write-Verbose "Decoding successful"
        return $decodedText
    }
    catch [FormatException] {
        Write-Error "Decoding failed - Invalid format: $($_.Exception.Message)"
        return $null
    }
    catch [System.ArgumentException] {
        Write-Error "Decoding failed - Invalid argument: $($_.Exception.Message)"
        return $null
    }
    catch {
        Write-Error "Decoding failed: $($_.Exception.Message)"
        return $null
    }
}

# Main execution block
try {
    Write-Verbose "Parameter set in use: $($PSCmdlet.ParameterSetName)"
    
    switch ($PSCmdlet.ParameterSetName) {
        'File' {
            Write-Verbose "Reading content from file: $Path"
            $content = Get-Content -Path $Path -Raw -ErrorAction Stop
        }
        'InputString' {
            Write-Verbose "Using provided input string"
            $content = $InputString
        }
        default {
            Write-Error "Invalid parameter set. Please provide either -Path or -InputString."
            exit 1
        }
    }

    # Normalize content: Trim and remove all whitespace (helps if file input has line breaks)
    $content = $content.Trim() -replace '\s', ''

    Write-Information "Validating Base64 content..." -InformationAction Continue
    if (-not (Test-Base64 -Content $content)) {
        exit 1
    }

    Write-Information "Base64 validation successful. Decoding..." -InformationAction Continue
    $decoded = ConvertFrom-Base64 -Content $content -Encoding $Encoding

    if ($null -ne $decoded) {
        if ($SaveToFile) {
            try {
                if ($PSCmdlet.ShouldProcess($OutputPath, "Save decoded content")) {
                    $decoded | Out-File -FilePath $OutputPath -Encoding $Encoding -Force
                    Write-Information "Decoded content saved to: $OutputPath" -InformationAction Continue
                }
            }
            catch [System.IO.IOException] {
                Write-Error "Failed to write to file: $($_.Exception.Message)"
                Write-Warning "Outputting to console instead."
                Write-Output $decoded
            }
            catch [System.UnauthorizedAccessException] {
                Write-Error "Access denied to output file: $($_.Exception.Message)"
                Write-Warning "Outputting to console instead."
                Write-Output $decoded
            }
            catch {
                Write-Error "Unexpected error saving file: $($_.Exception.Message)"
                Write-Warning "Outputting to console instead."
                Write-Output $decoded
            }
        }
        else {
            Write-Information "Decoded content:" -InformationAction Continue
            Write-Output $decoded
        }
    }
}
catch {
    Write-Error "Script execution failed: $($_.Exception.Message)"
    exit 1
}
