:: Name:        PaperCutPrinternameChange
:: Purpose:     Batch script to delete or rename printers in PaperCut
:: Author:      brian@lunaWHN.com
:: Revision:    Jan 2020 - initial version


@echo off
color 0a
mode con:cols=100 lines=45
title PaperCut NameChange
echo PaperCut Remove/Change Printers


:: This file must point to/run in: ..\..\PaperCut (NG/MF)\server\bin\win
CD /D C:\Program Files\PaperCut MF\server\bin\win
:: set the %serverName% varialbe to the name of the printer server that the printer is located
SET serverName=<ServerName>
:: set the name of %serverNameNew% to the name of the new print server.  If not changing print
:: server, use the same name as %servername%
SET serverNameNew=<ServerName>
:: Log File, change as needed
SET LOG=PrinterChangeLog.txt
:: Error file change as needed
SET ERRORLOG=PrinterChangeErrors.txt


:QUESTION1
:: Asks if this a printer name change or removal
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
echo To delete a printer press/enter 1
echo To rename a printer press/enter 2
set ans1=
set /p ans1=
if %ans1% == 1 (
    goto DELETE
) ELSE (
    if %ans1% == 2 (
    goto RENAMEPINFO
    ) ELSE (
    goto QUIT
    )
)


:DELETEIFNO
:: Enter and verify name of printer to be deleted.
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
echo Enter the name of the printer to be deleted:
set ans2=
set /p ans2=
echo Your entered %ans2%
echo If correct press/enter 1
echo If not correct press/enter 2
if %ans2% == 1 (
    goto DELETE
) ElSE (
    if %ans2% ==2 (
    goto DELETEIFNO
    ) ELSE (
    echo I'm sorry I didn't understand.  Press enter to restart
    pause >nul
    goto QUESTION1
    )
)


:DELETE
:: Deletes the printer
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
%date% %time% Pritner to be deleted: %ans2% >> %USERPROFILE%\Desktop\%LOG% 2>> %USERPROFILE%\Desktop\%ERRORLOG%
server-command delete-printer %serverName% %ans2% >> %USERPROFILE%\Desktop\%LOG% 2>> %USERPROFILE%\Desktop\%ERRORLOG%
echo If you would like to make another change press/enter 1
echo Press/enter 2 to quit.
SET ans3=
SET /p ans3=
if %ans3% == 1 (
    goto QUESTION1
) ELSE (
    goto QUIT   
)


:RENAMEPINFO
:: Enter the old and new printer namee of the printer to me changed
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
SET old=
SET new=
SET ans4=
echo Enter the old printer name:
SET /p old=
echo Enter the new printer name:
SET /p new=
echo Old printer name: %old%  New printer name: %new%
echo If this is correct press/enter 1
echo if this is incorrect press/enter 2 
SET /p ans4=
if %ans4% == 1 (
    goto RENAMEP
) ELSE (
    if %ans4% ==2 (
    goto RENAMEPINFO
    ) ELSE (
    echo I'm sorry I didn't understand.  Press enter to restart
    pause >nul
    goto QUESTION1
    )
)


:RENAMEP
:: deletes the new printer name from the system 
:: and then changes the old printer name to the new printer name
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
%date% %time% %old% will be renamed to %new%. >> %USERPROFILE%\Desktop\%LOG% 2>> %USERPROFILE%\Desktop\%ERRORLOG%
server-command delete-printer %serverName% %new% >> %USERPROFILE%\Desktop\%LOG% 2>> %USERPROFILE%\Desktop\%ERRORLOG%
server-command rename-printer %serverName% %old% %serverNameNew% %new% >> %USERPROFILE%\Desktop\%LOG% 2>> %USERPROFILE%\Desktop\%ERRORLOG%
echo If you would like to make another change press/enter 1
echo Press/enter 2 to quit.
SET ans3=
SET /p ans3=
if %ans3% == 1 (
    goto QUESTION1
) ELSE (
    goto END   
)


 :END
 :: exits the batch file.
cls
echo ++++++/+//////:-.-://+/++++ossso++/++oossssossssssssssssyyyyhhhhysys/yddmdyyyyyyyyso++ooooooooooosoo
echo ///++//++////:..-:::+ososoyhhhhyo++ossssssysssyysssssyyhhhhhhhhhhhyhoyhdddhyysssooosso+++ooooooooooo
echo ++ooooo+oo+/-..-://++oossyhhhhhso+ooosossssssyyhyysyyhyhhhddddmdddhdhddhs+oooo++++/+++oo+++osssssyss
echo ooooooo+/:..-://://::::/++syhhyyyyddddhhhhhhhhhhhysyhhyddhdmmmmdddmdddds/::-..````..--:::+ooosssyyyy
echo +++o+/:-.`-::-.``      ```.///oyhddddddhhdhdhddddhyyhhhdddmmmmmmmmmmmmh-`:.``````..``.-`.--+ssooosss
echo ++++-.```.-.``              `.:+ssyyhhdddddddddddhyhhhhhhddmmmmmmNNmmNmy:+o-`````./:`-/.-/:./ssssoos
echo /++:````...```...`         .-/ooosyhyhhhdddddddddhyyyyhhddhhddmmmmmmmmmmhydds/::--syo/:osyys//osys+y
echo +++:````.`````-++/.`   ````-/+ooossyyhhhdddddddhyysssyhddddhdddmmmmmmdmmmhhhdhoo/:/+ossyyyyyss+++o++
echo /++:`` `.```...-::----/-.`.-//++osssyyhhdddddddhyysoosyhdmmdddmmmmmmddddmmssyso/:--/oosoosoooooo+/:/
echo ooo:   `.........----:-``..--:/++osssyhhddmmddhhysooossyydmdddmmNmmmmmdddmd+::/+oysso++++++oo++oooos
echo ooo/```..............`````-.-::/++ossyyydmmddhhyyyssosyssydmddmNNNmmmmdmmmm//oysshysooooooossssoosss
echo oo+:........``.`````.``` `---//+++syyyyhdmmdhhhyyyysossssyhhhdmNNNmmmmmmmmdo+sssyhsoo+++++ooo++ooooo
echo o+/-.`..```````````````   ..-/++++oyhyhhdmmdhdhhhyssoooyso+//oymmmmmmmmmdddsoooshhso+++oo++ooooooooo
echo +/-.````````````````````  .`.:++++syssyhhhhdhhhhyys++++ss+:::++syhhddmdmhhdyossyyso+++++++++++oooooo
echo /-.```````````````````````.``.::::/++++o++oyhhyyyss+/+ooso/::::/:///++syyhmhsssyso//+++++++++oo+oooo
echo -.````````````````````````...``````...``..:+oyyyyys+:+osoos/-..` ````.-yddmhoo+o+//+ooo+oo+++ooooooo
echo .````````````    ```  `````...`           `:/osssys+-+osso+:.``    `--:hmmdo:://++oooooooo+++ooooooo
echo ``````                    `....`          `-/+oosso+:+osyo+:.-.````.-:sdmms--/++++++++++o++ooooossss
echo ` `````` ``                `...``         `.://+o+o+//+sssoo:.....--+sddds--/oooooooo+oooooooosooooo
echo ```````                     ``````  ```````--:++++++/++osysy+/++++ossdhyo-..-+ooooooooooooooosssosss
echo ````                         ```````````-.-:/oooooooooosyhddysyyyo+ssy+:---:+ossooooooooooossossssss
echo ```````                        ````````.--///osysooooosyhhdhhhhhhyhh::-:oooooooooooooossssssssssyyyy
echo `````````````                     ``.``...-::/osoo+++ooyhhhhhyydmmmo--/oooooossssssyssssssssssssssss
echo `````````````````````               ....``.:/+oooo++//+osyyhhyydmmd::/ssssssssssssssssssoosoossossss
echo `````````````````````````           `..````-://+++//:://oyhhhyhhddo::ossssssssssooooooosssssssssooos
echo ```````````````````````````          ``````.:/+++/:::--:/ohhhhhdds::/o+ooo+oooooooooo++oooooosooosos
echo ``````````````````````````````        .````.:/++/:----..-/sddhyhd/:+++oo+++ooooooooooooosoooosssssss
echo `````````````````````````````````     `..``-:/++:-......-/oshhyhmo+o+oooooooosoooooooososoosssssssss
echo `````````````````````````````````     ...`.:++:/:..```...:::+hhymyosoooooooooossssssooossssossssssss
echo `````````````````````````` ` ` ` ``   ...`.:o:.--``````...../sdhhosysooooossosssssssssssssssssssoooo
echo ```````````````````````````` ```````` `..../:-``  ```  `````:/hdysshyooosoosoosooooooooooooooooooooo
echo `````````````````````````````````````` `...:.`    ````.-.`  `+hmysodhoo++++++++++++/++++++++oooo++oo
echo `````````````````````````````````````` `....`     ``.--..````+dmhsohhooo++///+/++++++++++++++ooooooo
echo ``````````````````````````````````` ``  `...       ``` `.`` `sddys/osoo+oo//////++++++++++oo+ooooooo
echo ````````````````````````````            `...`              `/yhdys.-++++o+++:////++++ooooooooosossss
echo ``````````````````````````               `.```            `/osho++.:++oooo++++ooosooooossyyssssyysss
echo `````````           `   ``  `             ````         ```.-:/.`/oooooossoossssssssossyyssyyssoossss
echo  `               ` `````  `               ````.....`...-:++++-`.ooossooosssssssosssssssssssssssyyyyy
echo ```                 `    `        ```...--::://////+++++oo++oooooooooosooooosoooososysyyhhyyyyyyyyys
echo Good Bye!
pause 5
exit