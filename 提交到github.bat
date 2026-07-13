@echo off
chcp 65001 >nul
title SVN to GitHub Sync Tool
echo ========================================
echo       SVN to GitHub Sync Tool
echo ========================================
echo.

set GIT=C:\Users\94555\.workbuddy\vendor\PortableGit\mingw64\bin\git.exe
set SVN=C:\Program Files\TortoiseSVN\bin\svn.exe

if not exist "%GIT%" (
    echo [ERROR] git.exe not found: %GIT%
    pause
    exit /b 1
)
if not exist "%SVN%" (
    echo [ERROR] svn.exe not found: %SVN%
    pause
    exit /b 1
)

echo [1/4] SVN Commit...
"%SVN%" commit "E:\GitHub" -m "Auto-sync from local SVN" --non-interactive --trust-server-cert-failures=unknown-ca
echo.

echo [2/4] Export SVN to temp...
if exist "E:\temp\github-sync" rmdir /s /q "E:\temp\github-sync"
mkdir "E:\temp\github-sync"
"%SVN%" export "file:///E:/SVNRepo/XiaoXianGit/trunk" "E:\temp\github-sync" --force --non-interactive --trust-server-cert-failures=unknown-ca
echo.

echo [3/4] Push to GitHub...
cd /d "E:\temp\github-sync"
"%GIT%" init -b main 2>nul
"%GIT%" config user.name "qq945557455-ai"
"%GIT%" config user.email "qq945557455-ai@users.noreply.github.com"
"%GIT%" add -A
"%GIT%" commit -m "Sync from local SVN"
"%GIT%" remote remove origin 2>nul
"%GIT%" remote add origin "https://github.com/qq945557455-ai/XiaoXianGit.git"
"%GIT%" push -f origin main
echo.

echo [4/4] SVN Update...
"%SVN%" update "E:\GitHub" --non-interactive --trust-server-cert-failures=unknown-ca
echo.

echo ========================================
echo       Sync Complete!
echo   Press any key to close...
echo ========================================
pause >nul
