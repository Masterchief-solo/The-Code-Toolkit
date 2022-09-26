#Use this template to begin milestone 2.  
#Use the code provided to read the files into RStudio and then add your code below each of the comment prompts that follow
#Read in Files
library(readr)
firefighter <- read_csv("~/workspace/Analysis/Firefighter.csv")
View(firefighter)

police <- read_csv("~/workspace/Analysis/Police.csv")
View(police)

#Perform Summary Analysis on Data
summary(police)
summary(firefighter)
summary(police, firefighter)

#For any 2 Data Columns, Perform Min/Max/Average Analysis for each data set and store in variable

# perform min/max/average for column Total Salary in the Police data set and store in a variable
minSalaryP <- min(police$'Total Salary')           # min total salary
maxSalaryP <- max(police$'Total Salary')           # max total salary
avgSalaryP <- mean(police$'Total Salary')          # average total salary

# perform min for column 'Total Benefits' in the Police data set and store in a variable 
minBenefitP <- min(police$'Total Benefits')        # min total benefits
maxBenefitP <- max(police$'Total Benefits')        # max total benefits
avgBenefitP <- mean(police$'Total Benefits')       # average total benefits

# perform min/max/average for column Total Salary in the Firefighter data set and store in a variable
minSalaryF <- min(firefighter$'Total Salary')      # min total salary
maxSalaryF <- max(firefighter$'Total Salary')      # max total salary
avgSalaryF <- mean(firefighter$'Total Salary')     # average total salary

# perform min/max/average for column Total Benefits in the Firefighter data set and store in a variable
minBenefitF <- min(firefighter$'Total Benefits')   # min total benefits
maxBenefitF <- max(firefighter$'Total Benefits')   # max total benefits
avgBenefitF <- mean(firefighter$'Total Benefits')  # average total benefits

# Compare Police Dataset Values
salp <- c(minSalaryP, maxSalaryP, avgSalaryP)
benp <- c(minBenefitP, maxBenefitP, avgBenefitP)
matA <- cbind(salp, benp)

policename <- matA
rownames(policename) <- c('Min','Max','Average')
colnames(policename) <- c('Total Salary','Total Benefits')
policename

# Compare Firefighter Dataset Values
salf <- c(minSalaryF, maxSalaryF, avgSalaryF)
benf <- c(minBenefitF, maxBenefitF, avgBenefitF)
matB <- cbind(salf, benf)

firename <- matB
rownames(firename) <- c('Min','Max','Average')
colnames(firename) <- c('Total Salary','Total Benefits')
firename
