import os, win32api, win32con

for file in os.listdir("./"):
    info = os.stat(file)
    attr = win32.api.GetFileAttributes(file)
    if NOT (attr & (win32con.FILE_ATTRIBUTE_SYSTEM)):
        print(file)
