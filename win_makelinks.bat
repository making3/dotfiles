@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
  set dow=%%i
  set month=%%j
  set day=%%k
  set year=%%l
)

for /f "tokens=1-4 delims=.: " %%i in ("%time%") do (
 set hour=%%i
 set minute=%%j
 set second=%%k
 set hundredth=%%l
)

ECHO Creating vim backup and swap folders

:: Creates main backup folder.
set mainbackup="%HOME%.dotfiles_old"
if not exist %mainbackup% (
    mkdir %mainbackup%
    :: Hides the backup directory
    attrib +h %mainbackup%
)

set backup="%mainbackup%\%year%%month%%day%_%hour%%minute%"

:: Creates a backup directory
if not exist %backup% (
    mkdir %backup%
)

ECHO.
ECHO Backing up existing dot files.

:: Makesure HOME has the backslash at the end
:: Backup dot files
xcopy "%HOME%_vimrc" "%backup%" /H /Y
xcopy "%HOME%_gvimrc" "%backup%" /H /Y
xcopy "%HOME%.gitconfig" "%backup%" /H /Y
xcopy "%HOME%.gitignore" "%backup%" /H /Y

ECHO.
ECHO Moving new dot files

:: Overwrites existing files.
xcopy "%HOME%.dotfiles\vimrc" "%HOME%_vimrc" /Y /H /R
xcopy "%HOME%.dotfiles\gvimrc" "%HOME%_gvimrc" /Y /H /R
xcopy "%HOME%.dotfiles\gitconfig" "%HOME%.gitconfig" /Y /H /R
xcopy "%HOME%.dotfiles\gitignore" "%HOME%.gitignore" /Y /H /R

ECHO.
ECHO Creating vim backup and swap folders

:: Create backup and data folders.
if not exist "%HOME%\.vim" mkdir "%HOME%\.vim"
if not exist "%HOME%\.vim\.backups" mkdir "%HOME%\.vim\.backups"
if not exist "%HOME%\.vim\.swap" mkdir "%HOME%\.vim\.swap"

ECHO Making dotfiles hidden

:: Hide all of the links and backups
attrib /L +H "%HOME%\_vimrc"
attrib /L +H "%HOME%\_gvimrc"
attrib /L +H "%HOME%\.gitconfig"
attrib /L +H "%HOME%\.gitignore"
attrib +H "%HOME%\.vim"

ECHO Complete
