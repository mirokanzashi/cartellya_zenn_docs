@echo off
setlocal enabledelayedexpansion
chcp 65001
set mypath=%~dp0

cd /d %mypath%
cd ..
echo %cd%

:menu

echo ========= Zenn管理ツール =========
echo.
echo 1. 新記事作成(タイトルなし)
echo 2. 新記事作成(タイトル指定)
echo 0. 終了
echo.
set /p choice=番号を入力してください (1-2)：

if "%choice%"=="1" goto new_article
if "%choice%"=="2" goto new_article
if "%choice%"=="0" goto end

echo.
echo  存在しない選択肢です。もう一度入力してください
pause
goto menu



:new_article

if "%choice%"=="2" (
    set /p title=記事のタイトルを入力してください：
) else (
    set title=""
)
cmd /k "npx zenn new:article --title %title% --type idea --emoji ✅"



pause
goto menu

:end
pause