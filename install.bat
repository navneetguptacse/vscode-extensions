@echo off
cls
title Visual Studio Code Extensions Installer

:: Check if VS Code is installed
where code >nul 2>nul
if %errorlevel% neq 0 (
    echo VS Code is not installed. Please install Visual Studio Code first.
    pause
    exit /b
)

:: Ask for confirmation before starting the installation
set /p confirm= Are you sure you want to install the extensions listed in extensions.txt? [Y/N]

if /i not "%confirm%"=="Y" (
    echo Installation cancelled.
    pause
    exit /b
)

:: Loop through each extension and install it
for /f "tokens=*" %%i in (extensions.txt) do (
    echo Installing %%i...
    code --install-extension %%i
    echo %%i installation complete.
)

:: Ensure the final message is displayed after all extensions are installed
echo All extensions installed.
echo Press any key to exit.
pause
exit /b
