@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

cls

echo    GL2020 AppList Manager
echo        Version 1.0
echo:

set APPLIST_FOLDER="AppList"
set FILE_FORMAT="txt"
set APPLIST_NAME="AppListIndex.txt"

set index=0

if not exist %APPLIST_NAME%  (
    type NUL > %APPLIST_NAME%
    echo    ERROR: PLEASE INSERT GAMES IN %APPLIST_NAME%
    echo    EXAMPLE: 72850 = The_Elder_Scrolls_V_Skyrim
    exit /B
)

if not exist %APPLIST_FOLDER% (
    mkdir %APPLIST_FOLDER%
)

for /f "tokens=1" %%x in (AppListIndex.txt) do (
    set "appIdTest=%%x"
    set "appIdTest=!appIdTest:~0,1!"

    if !appIdTest! EQU +!appIdTest! (
        set "filename=!APPLIST_FOLDER!/!index!.!FILE_FORMAT!"
        echo | set /p "id=%%x">!filename!
        set /a index+=1
    )
)

echo    Done!