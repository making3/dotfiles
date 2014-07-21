@echo off
:: List only folders with a forward slash at the end
for /f %%F in ('dir /B /AD-S') do @echo %%F/
