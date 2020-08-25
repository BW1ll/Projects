:: Name:        server-coommand.bat
:: Purpose:     Batch script to rename end users in PaperCut
:: Author:      brian@lunaWHN.com
:: Revision:    Jan 2020 - initial version

:: Use this batch file to send server-command.exe commnads to PaperCut
:: Remove the current commands befoe you execut on PaperCut,
:: but be carfull to leave the print and pauses commands at the end 
:: of the script.

pause
REM  Sets the directory to the correct location to run server-command.exe
CD /D C:\Program Files\PaperCut MF\server\bin\win
pause 5
echo CD /D C:\Program Files\PaperCut MF\server\bin\win
cls
print Pressing Enter will sart sending the commands.
pause
cls
:: Place server commands here:
REM server-command set-printer-groups <ServerName> <Printer> <Group>


print Fineshed running server-command.exe commands
pause
