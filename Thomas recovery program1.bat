@echo off
:start
cls
color 1a
cls
echo welcome to thomas's recovery program!
echo 1. reset password (admin needed)
echo 2. decorrupt and disk scanning
set /p op=select optin: 
if "%op%"=="1" goto pass
if "%op%"=="2" goto wincheck

:pass
cls
:: Check admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo This must be run as Administrator!
    pause
    exit /b
)

echo Password Reset
echo ---------------------------------
echo Logged in as: %username%
set /p newpass="Enter NEW password (leave blank for no password): "

:: Set new password
net user %username% "%newpass%"

echo.
echo  Password changed for user: %username%
pause
echo Done restarting
shutdown /r /t 8

:wincheck
cls 
echo may have to press y in This
timeout 10
chkdsk C: /f /r /x
cls
echo should bealbe to chill in this part
timeout 10
sfc /scannow
echo Done! restarting
shutdown /r /t 8


