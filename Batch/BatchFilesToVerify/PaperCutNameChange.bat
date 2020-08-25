:: Name:        PaperCutNameChange
:: Purpose:     Batch script to rename end users in PaperCut
:: Author:      brian@lunaWHN.com
:: Revision:    Jan 2020 - initial version


@echo off
color 0a
mode con:cols=100 lines=45
title PaperCut NameChange
echo PaperCut Rename User Username


REM This file must point to/run in: ..\..\PaperCut (NG/MF)\server\bin\win
CD /D C:\Program Files\PaperCut MF\server\bin\win


:OLD1
:: input old username
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
echo enter old username
set /p old=
cls
goto NEW1


:NEW1 
:: input new username
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
echo enter new username
set /p new=
cls 
goto CONFIRM


:COMMAND
:: exicutes the server commands to delete the new username and then change the old username to the new username
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
echo Please Wait
echo %date% %time% old name: %old% new name: %new% >> C:\Users\papercut\Desktop\NameChangeLog.txt 2>> C:\Users\papercut\Desktop\NameChangeErrors.txt
server-command delete-existing-user %new% >> C:\Users\papercut\Desktop\NameChangeLog.txt 2>> C:\Users\papercut\Desktop\NameChangeErrors.txt
server-command rename-user %old% %new% >> C:\Users\papercut\Desktop\NameChangeLog.txt 2>> C:\Users\papercut\Desktop\NameChangeErrors.txt
goto QUESTION


:CONFIRM
:: Confirms the old username and new username entered are correct.
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
set ans2=
echo %old% will be renamed to %new%1
echo If this is correct, press 1
echo To re-enter names, press 2
set /p ans2=
if %ans2% == 1 (
    goto COMMAND
) ELSE (
    goto OLD1
)


:QUESTION
:: Asks if there is another username to updated
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
echo Press 1 to change another username
echo Press 2 to quit
set ans=
set /p ans=
if %ans% == 1 (
    goto OLD1
) ELSE (
    goto END
)


goto OLD1


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
 