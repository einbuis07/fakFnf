@echo off

:: Set paths
set HAXEPATH=C:\HaxeToolkit\haxe
set FLIXELPATH=C:\HaxeToolKit\haxe\lib\flixel\5,6,1
set SOURCEPATH=source
set ARTSPATH=art
set OUTPUTPATH=extract

:: Go to the project directory
cd /d "%~dp0"

:: Clear previous build artifacts
echo Cleaning previous build...
rd /s /q "%OUTPUTPATH%\windows"

:: Build the project
echo Building the project...
"%HAXEPATH%\haxe" -cp %SOURCEPATH% -cp %ARTSPATH% -main Game -lib flixel -cpp %OUTPUTPATH% -D windows

:: Wait for user input to close
pause
