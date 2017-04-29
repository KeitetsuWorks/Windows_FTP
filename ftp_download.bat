@echo off

rem 
rem @file        ftp_download.bat
rem @brief       Batch to Download Files from FTP Server
rem @author      Keitetsu
rem @date        2017/04/16
rem @copyright   Copyright (c) 2017 Keitetsu
rem @par         License
rem              This software is released under the MIT License.
rem 

setlocal

set EXIT_CODE=0
set FTP_SCRIPT=.\script\ftp_download.ftp
set FTP_LOG=.\ftp_download.log
set DOWNLOAD_DIR=.\download

rem FTPスクリプトの存在確認
if not exist %FTP_SCRIPT% (
	echo Error:  FTPスクリプトが見つかりません
	set EXIT_CODE=1
	goto EXIT_FAILURE
)

rem ダウンロードフォルダを作成
if not exist %DOWNLOAD_DIR%\ (
	echo Info:   ダウンロードフォルダを作成します
	mkdir %DOWNLOAD_DIR%
)

rem FTPスクリプトを実行
ftp -i -s:%FTP_SCRIPT% > %FTP_LOG%
if %ERRORLEVEL% neq 0 (
	echo Error:  FTPクライアントが異常終了しました
	set EXIT_CODE=1
	goto EXIT_FAILURE
) else (
	echo Info:   FTPクライアントが正常終了しました
)

rem 終了処理
:EXIT_SUCCESS
endlocal
exit /B %EXIT_CODE%

:EXIT_FAILURE
endlocal
pause
exit /B %EXIT_CODE%
