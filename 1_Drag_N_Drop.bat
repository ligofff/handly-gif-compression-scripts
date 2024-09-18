@echo off
setlocal enabledelayedexpansion

REM Set the path to the directory containing gifsicle.exe
set gifsiclePath=%~dp0gifsicle.exe

REM Loop through each dropped file
for %%A in (%*) do (
    set inputFile=%%A
    set outputFile=%%~nA-compressed%%~xA

    REM Compress the GIF file using lossy compression with Gifsicle
    "%gifsiclePath%" -O3 --lossy=80 "!inputFile!" -o "!outputFile!"

    echo Lossy compressed %%~nxA to !outputFile!
)
