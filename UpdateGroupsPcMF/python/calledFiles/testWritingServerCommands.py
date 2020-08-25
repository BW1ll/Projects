#! /usr/bin/env python3

import csv
import logging

from createBatch import createBatch as cb
from serverCommands import *
from serverCommands import serverName as sn

csvDir = '"PATH TO FILE"\\GroupsProject\\CSV\\'
logDir = '"PATH TO FILE"\\GroupsProject\\logs\\'
batchDir = '"PATH TO FILE"\\GroupsProject\\batch\\'
editedGroups = (f'{csvDir}edited_grp.csv')
tempEditedG = (f'{csvDir}tempEditedG.csv')

def cc():
    # Create server commands.
    pass
    with open(tempEditedG, 'r') as csvFile, open(f'{batchDir}commands.txt', 'w+', newline='') as commands:
        csv_reader = csv.DictReader(csvFile)
        for line in csv_reader:
            if 'OU' not in line['Group'] and "UNRESTRICTED" not in line['Group']:
                aPaccessGroup = addPrinterAccessGroup(sn, line['Printer Group Access'], line['Group'])
                sGroupQuo = setGroupQuota(line['Group'], line['Schedule Amount'], line['Schedule Period'], line['Initial Balance'])
                commands.write(aPaccessGroup)
                commands.write(sGroupQuo)
            if 'OU' in line['Group']:
                reGroup = removeGroup(line['Group'])
                commands.write(reGroup)

cc()
