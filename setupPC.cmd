:: This script must be run from an elevated (Admin) cmd prompt
@echo off
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate. This script must be from an elevated cmd prompt.
    exit;
)

:: Install Chocolatey package manager (https://chocolatey.org/) if it isn't already
WHERE choco
IF %ERRORLEVEL% NEQ 0 @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install tools from chocolatey
choco install firefox -y &                     :: Mozilla Firefox
choco install git -y &                         :: Git
choco install googlechrome -y &                :: Google Chrome
choco install nodejs -y &                      :: Node.js
choco install python -y &                      :: Python 3
choco install slack -y &                       :: Slack
choco install visualstudio2017professional -y &:: Visual Studio 2017 Professional
choco install vscode -y &                      :: Visual Studio Code
choco install office365proplus -y &            :: Office 365

