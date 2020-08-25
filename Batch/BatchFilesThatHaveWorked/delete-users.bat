@echo off
color 0a
prompt Master Blaster
title Death Star Console

REM Use this batch file to send server-command.exe commnads to PaperCut
REM Remove the current commands befoe you execut on PaperCut,
REM but be carfull to leave the print and pauses commands at the end 
REM of the script.

echo Seting the directory to the correct location to run server-command.exe
print Seting the directory to the correct location to run server-command.exe
pause
CD /D C:\Program Files\PaperCut MF\server\bin\win
pause 5
echo CD /D C:\Program Files\PaperCut MF\server\bin\win
cls
echo Pressing Enter will sart sending the commands.
print Pressing Enter will sart sending the commands.
pause
cls

server-command delete-existing-user 02offtest
server-command delete-existing-user 02teachtest
server-command delete-existing-user 03media
server-command delete-existing-user 03offtest
server-command delete-existing-user 03teachtest
server-command delete-existing-user 06offtest
server-command delete-existing-user 06teachtest
server-command delete-existing-user 08teachtest
server-command delete-existing-user 13media
server-command delete-existing-user 13offtest
server-command delete-existing-user 13teachtest
server-command delete-existing-user 15offtest
server-command delete-existing-user 15teachtest
server-command delete-existing-user 17offtest
server-command delete-existing-user 17teachtest
server-command delete-existing-user 21offtest
server-command delete-existing-user 21teachtest
server-command delete-existing-user 22offtest
server-command delete-existing-user 22teachtest
server-command delete-existing-user 25offtest
server-command delete-existing-user 25teachtest
server-command delete-existing-user 28offtest
server-command delete-existing-user 28teachtest
server-command delete-existing-user 29idphoto
server-command delete-existing-user 29offtest
server-command delete-existing-user 31offtest
server-command delete-existing-user 31teachtest
server-command delete-existing-user 32teachtest
server-command delete-existing-user 36offtest
server-command delete-existing-user 37offtest
server-command delete-existing-user 37teachtest
server-command delete-existing-user 39teachtest
server-command delete-existing-user 40offtest
server-command delete-existing-user 40teachtest
server-command delete-existing-user 41sro
server-command delete-existing-user 42offtest
server-command delete-existing-user 42teachtest
server-command delete-existing-user 45offtest
server-command delete-existing-user 45teachtest
server-command delete-existing-user 47media
server-command delete-existing-user 47offtest
server-command delete-existing-user 47teachtest
server-command delete-existing-user 50offtest
server-command delete-existing-user 50teachtest
server-command delete-existing-user 52offatv
server-command delete-existing-user 52offtest
server-command delete-existing-user 52teachtest
server-command delete-existing-user 53offtest
server-command delete-existing-user 53teachtest
server-command delete-existing-user 88user
server-command delete-existing-user asi
server-command delete-existing-user dell
server-command delete-existing-user employeebenefits
server-command delete-existing-user ems
server-command delete-existing-user encoretest
server-command delete-existing-user fyi
server-command delete-existing-user hiveguest
server-command delete-existing-user media08
server-command delete-existing-user media13
server-command delete-existing-user media15
server-command delete-existing-user media17
server-command delete-existing-user media21
server-command delete-existing-user media22
server-command delete-existing-user media28
server-command delete-existing-user media29
server-command delete-existing-user media31
server-command delete-existing-user media32
server-command delete-existing-user media36
server-command delete-existing-user media37
server-command delete-existing-user media39
server-command delete-existing-user media40
server-command delete-existing-user media42
server-command delete-existing-user media50
server-command delete-existing-user parents1
server-command delete-existing-user parents2
server-command delete-existing-user parents3
server-command delete-existing-user parents4
server-command delete-existing-user parents5
server-command delete-existing-user parents6
server-command delete-existing-user purchasing
server-command delete-existing-user pfeguest
server-command delete-existing-user po
server-command delete-existing-user rgamache
server-command delete-existing-user rgamachevpp
server-command delete-existing-user userarchive
server-command delete-existing-user vault

print Fineshed running server-command.exe commands
pause 
