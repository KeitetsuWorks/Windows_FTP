@echo off

rem 
rem @file        clean.bat
rem @brief       Batch to Delete Download Files and Log Files
rem @author      Keitetsu
rem @date        2017/04/16
rem @copyright   Copyright (c) 2017 Keitetsu
rem @par         License
rem              This software is released under the MIT License.
rem 

setlocal

set DOWNLOAD_DIR=.\download

del /Q *.log
rmdir /s /q %DOWNLOAD_DIR%

endlocal

exit
