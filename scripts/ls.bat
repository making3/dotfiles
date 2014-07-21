@ECHO off

:: List folders with a forward slash at the end
FOR /f %%F IN ('dir /B /AD-S') DO echo %%F/

:: List files without the slash
dir /B /A-H-S-D 2>NUL
