@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
  set month=%%j
  set day=%%k
  set year=%%l
)

for /f "tokens=1-4 delims=.: " %%i in ("%time%") do (
 set hour=%%i
 set minute=%%j
)

ECHO Creating vim backup and swap folders

:: Creates main backup folder.
set mainbackup=%HOME%\.dotfiles_old
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

ECHO Backing up existing dot files.

:: Makesure HOME has the backslash at the end
:: Backup dot files
copy "%HOME%\_vimrc" "%backup%" /Y
copy "%HOME%\_gvimrc" "%backup%" /Y
copy "%HOME%\.gitconfig" "%backup%" /Y
copy "%HOME%\.gitignore" "%backup%" /Y

ECHO.
ECHO Moving new dot files

:: Overwrites existing files.
TYPE "%HOME%\.dotfiles\vimrc" | MORE /p > "%HOME%\_vimrc"
TYPE "%HOME%\.dotfiles\gvimrc" | MORE /p > "%HOME%\_gvimrc"
TYPE "%HOME%\.dotfiles\windows\gitconfig" | MORE /p > "%HOME%\.gitconfig"
TYPE "%HOME%\.dotfiles\gitignore" | MORE /p > "%HOME%\.gitignore"

ECHO.
ECHO Creating vim backup and swap folders

:: Create backup and data folders.
if not exist "%HOME%\.vim" mkdir "%HOME%\.vim"
if not exist "%HOME%\.vim\.backups" mkdir "%HOME%\.vim\.backups"
if not exist "%HOME%\.vim\.swap" mkdir "%HOME%\.vim\.swap"

ECHO Complete
