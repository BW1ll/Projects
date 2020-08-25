@echo off
color 0a
prompt Master Blaster
title Death Star Console

REM need to have PsExec installed on local windows computer
REM https://docs.microsoft.com/en-us/sysinternals/downloads/psexec
REM https://download.sysinternals.com/files/PSTools.zip
REM add files to the the C:\Windows\System32 folder and add
REM the location to the "Envirement Variables" see:
REM https://www.java.com/en/download/help/path.xml

GOTO :A

:A
echo Setting working dir for PaperCut....
pause
CD /D "C:\Program Files\PaperCut MF\server\bin\win"
pause 3
echo CD /D "C:\Program Files\PaperCut MF\server\bin\win"
cls
echo Ready to send commands...
echo Press enter to continue...
pause
cls

