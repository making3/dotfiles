@echo off
:: List folders with a forward slash at the end
for /f %%F in ('dir /B /AD-S') do echo %%F/

:: List files without the slash
dir /B /A-S-D 2>NUL
