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

rem FTP�X�N���v�g�̑��݊m�F
if not exist %FTP_SCRIPT% (
	echo Error:  FTP�X�N���v�g��������܂���
	set EXIT_CODE=1
	goto EXIT_FAILURE
)

rem �_�E�����[�h�t�H���_���쐬
if not exist %DOWNLOAD_DIR%\ (
	echo Info:   �_�E�����[�h�t�H���_���쐬���܂�
	mkdir %DOWNLOAD_DIR%
)

rem FTP�X�N���v�g�����s
ftp -i -s:%FTP_SCRIPT% > %FTP_LOG%
if %ERRORLEVEL% neq 0 (
	echo Error:  FTP�N���C�A���g���ُ�I�����܂���
	set EXIT_CODE=1
	goto EXIT_FAILURE
) else (
	echo Info:   FTP�N���C�A���g������I�����܂���
)

rem �I������
:EXIT_SUCCESS
endlocal
exit /B %EXIT_CODE%

:EXIT_FAILURE
endlocal
pause
exit /B %EXIT_CODE%
