@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Path to your extensions.txt file
set "extFile=extensions.txt"

REM Check if the file exists
if not exist "!extFile!" (
    echo File not found: !extFile!
    exit /b 1
)

REM Initialize a counter
set count=0

REM Read the file and install each extension
for /F "delims=" %%i in (!extFile!) do (
    echo Installing %%i...
    code --install-extension %%i
    set /a count+=1
)

echo All !count! extensions installed successfully.
ENDLOCAL
