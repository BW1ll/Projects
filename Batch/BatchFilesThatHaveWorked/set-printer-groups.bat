:: Name:        set-printer-groups.bat
:: Purpose:     Batch script to rename end users in PaperCut
:: Author:      brian@lunaWHN.com
:: Revision:    Jan 2020 - initial version

echo off
:: This file must point to/run in: ..\..\PaperCut (NG/MF)\server\bin\win
CD /D C:\Program Files\PaperCut MF\server\bin\win
pause 5
echo CD /D C:\Program Files\PaperCut MF\server\bin\win

server-command set-printer-groups <ServerName> <PrinterName> <"Group1,Group 2,Gro up 3,...">
server-command set-printer-groups <ServerName> <PrinterName> <"Group1,Group 2,Gro up 3,...">
server-command set-printer-groups <ServerName> <PrinterName> <"Group1,Group 2,Gro up 3,...">
server-command set-printer-groups <ServerName> <PrinterName> <"Group1,Group 2,Gro up 3,...">

print Fineshed running server-command.exe commands
pause 