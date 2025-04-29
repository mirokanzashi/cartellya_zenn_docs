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
set /p choice=番号を入力してください (1-2,0)：

if "%choice%"=="1" goto new_article
if "%choice%"=="2" goto new_article
if "%choice%"=="0" goto end

echo.
echo  存在しない選択肢です。もう一度入力してください
pause
goto menu



:new_article
set /p slugval=ファイル名を入力してください（0-9a-z-_限定、12文字以上）：
set slugparam=
if not "%slugval%"=="" (
    set slugparam=--slug %slugval%
) 

if "%choice%"=="2" (
    set /p title=記事のタイトルを入力してください：
) else (
    set title=""
)
start cmd /c "npx zenn new:article --title %title% --type idea --emoji ✅ %slugparam%  && pause"


goto menu

:end
pause