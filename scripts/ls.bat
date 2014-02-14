@echo off
:: List folders with a forward slash at the end
for /f %%F in ('dir /B /AD-S') do @echo %%F/

:: List files without the slash
for /f %%F in ('dir /B /A-H-S-D') do @echo %%F
