from base64 import b64decode

encoded = [
    "bWtkaXIgcHduZWQ=",
    "dG91Y2ggcHduZWQvaGFja2Vy", 
    "Y2QgcHduZWQgJiYgbHM="
]

try:
    print('\n'.join(b64decode(e).decode() for e in encoded))
except Exception as e:
    print(f'Decoding error: {e}')
