:: Name:        set-printer-property.bat
:: Purpose:     Batch script to rename end users in PaperCut
:: Author:      brian@lunaWHN.com
:: Revision:    Jan 2020 - initial version

echo off 
:: This file must point to/run in: ..\..\PaperCut (NG/MF)\server\bin\win
CD /D C:\Program Files\PaperCut MF\server\bin\win
pause 5
echo CD /D C:\Program Files\PaperCut MF\server\bin\win

pause
server-command.exe set-printer-property <ServerName> custom-field-<"1-6"> <"Example">
server-command.exe set-printer-property <ServerName> custom-field-1 <"Department">
server-command.exe set-printer-property <ServerName> custom-field-2 <"Location/Floor">
server-command.exe set-printer-property <ServerName> custom-field-3 <"Asset Number">
server-command.exe set-printer-property <ServerName> custom-field-4 <"Serial Number">
server-command.exe set-printer-property <ServerName> custom-field-5 <"Mac Address">
server-command.exe set-printer-property <ServerName> custom-field-6 <"Cost Center">

print Fineshed running server-command.exe commands
pause 