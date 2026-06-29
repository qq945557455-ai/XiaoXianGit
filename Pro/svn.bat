@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set REPO_DIR=%~dp0
cd /d "%REPO_DIR%"

if "%1"=="" (
    echo 用法: svn.bat ^<命令^> [参数]
    echo.
    echo 可用命令:
    echo   checkout ^<dir^> - 从 GitHub 检出仓库到指定目录 (git clone)
    echo   up          - 从 GitHub 拉取最新更新 (git pull)
    echo   commit ^<msg^> - 提交并推送到 GitHub (git add + commit + push)
    echo   status      - 查看工作区状态 (git status)
    echo   diff        - 查看变更差异 (git diff)
    echo   add ^<file^>  - 添加文件到暂存区 (git add)
    echo   log         - 查看提交历史 (git log)
    echo.
    echo 示例:
    echo   svn.bat up
    echo   svn.bat commit "修复了一个bug"
    echo   svn.bat status
    goto :eof
)

if /i "%1"=="checkout" (
    if "%2"=="" (
        echo [SVN] 用法: svn.bat checkout ^<目标目录^>
        echo [SVN] 示例: svn.bat checkout D:\MyProject
        exit /b 1
    )
    echo [SVN] 正在从 GitHub 检出到 %2...
    git clone https://github.com/qq945557455-ai/XiaoXianGit.git "%2"
    if !errorlevel! equ 0 (echo [SVN] ✓ 已检出到 %2) else (echo [SVN] ✗ 检出失败)
    goto :eof
)

if /i "%1"=="up" (
    echo [SVN] 正在从 GitHub 拉取更新...
    git pull origin main
    if !errorlevel! equ 0 (echo [SVN] ✓ 更新完成) else (echo [SVN] ✗ 拉取失败)
    goto :eof
)

if /i "%1"=="commit" (
    if "%2"=="" (
        echo [SVN] 错误: 请提供提交信息，例如: svn.bat commit "修改内容"
        exit /b 1
    )
    echo [SVN] 正在添加所有变更...
    git add -A
    echo [SVN] 正在提交...
    git commit -m "%*"
    echo [SVN] 正在推送到 GitHub...
    git push origin main
    if !errorlevel! equ 0 (echo [SVN] ✓ 提交并推送完成) else (echo [SVN] ✗ 推送失败)
    goto :eof
)

if /i "%1"=="status" (
    git status
    goto :eof
)

if /i "%1"=="diff" (
    git diff
    goto :eof
)

if /i "%1"=="add" (
    git add %2
    echo [SVN] ✓ 已添加: %2
    goto :eof
)

if /i "%1"=="log" (
    git log --oneline --graph --all -20
    goto :eof
)

echo [SVN] 未知命令: %1
echo 可用命令: up, commit ^<msg^>, status, diff, add ^<file^>, log
exit /b 1
