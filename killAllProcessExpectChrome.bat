@echo off
setlocal enabledelayedexpansion
REM Windows Batch script to kill all processes except Chrome and essential system processes
REM WARNING: Use with extreme caution - this will terminate most running applications

echo WARNING: This script will kill most running processes except Chrome!
echo Press Ctrl+C within 1 seconds to cancel...
timeout /t 1 /nobreak >nul

echo.
echo Killing processes except Chrome and system processes...
echo.

REM Simple and effective approach using taskkill filters
echo Starting process cleanup...

REM Kill all processes except Chrome and essential system processes
taskkill /F /FI "IMAGENAME ne chrome.exe" /FI "IMAGENAME ne System" /FI "IMAGENAME ne Idle" /FI "IMAGENAME ne Registry" /FI "IMAGENAME ne smss.exe" /FI "IMAGENAME ne csrss.exe" /FI "IMAGENAME ne wininit.exe" /FI "IMAGENAME ne services.exe" /FI "IMAGENAME ne lsass.exe" /FI "IMAGENAME ne winlogon.exe" /FI "IMAGENAME ne explorer.exe" /FI "IMAGENAME ne dwm.exe" /FI "IMAGENAME ne svchost.exe" /FI "IMAGENAME ne conhost.exe" /FI "IMAGENAME ne RuntimeBroker.exe" /FI "IMAGENAME ne sihost.exe" /FI "IMAGENAME ne ctfmon.exe" /FI "IMAGENAME ne audiodg.exe" /FI "IMAGENAME ne spoolsv.exe" /FI "IMAGENAME ne taskhost.exe" /FI "IMAGENAME ne taskhostw.exe" /FI "IMAGENAME ne cmd.exe" /FI "IMAGENAME ne taskkill.exe" 2>nul

echo.
echo Cleanup completed using exclusion filters.
echo.

REM Also kill specific common applications that might still be running
echo Killing common applications (if running)...

REM List of common applications to kill
set apps=notepad.exe calculator.exe mspaint.exe winword.exe excel.exe powerpnt.exe outlook.exe firefox.exe msedge.exe opera.exe brave.exe discord.exe spotify.exe steam.exe vlc.exe

for %%a in (%apps%) do (
    tasklist /FI "IMAGENAME eq %%a" 2>NUL | find /I /N "%%a">NUL
    if not errorlevel 1 (
        echo Killing %%a...
        taskkill /IM "%%a" /F >nul 2>&1
    )
)

echo.
echo Process cleanup completed. Chrome should still be running.
echo.
pause
