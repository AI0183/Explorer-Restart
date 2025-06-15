@echo off
title Explorer Restart
COLOR CA

:: Check for Admin Privileges.
fltmc >nul 2>&1
if not %errorlevel% == 0 (
    powershell -Command "Write-Host 'Explorer Restart doesn't think it is running as an *Administrator*.
    powershell -Command "Write-Host 'Explorer Restart MUST be run with full *Administrator* rights to run correctly.' -ForegroundColor White -BackgroundColor Red" 
    powershell -Command "Write-Host 'Please Click *Yes* to the following prompt!' -ForegroundColor White -BackgroundColor Red" 
    timeout 1 > nul
    PowerShell Start -Verb RunAs '%0'
    exit /b 0
)
color CA
:: Explorer Restart.
taskkill.exe /F /IM "explorer.exe"
start explorer.exe
pause
