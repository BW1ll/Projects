# ! /usr/bin/env python3

''' 
@author Brian Willis
2/27/20 - initial release
03/06/20 - updated import modules to work with main.py outside of the 
python/calledFiles direcotry, and updated documentation

part of the UpdateGroupsProjected, called from the main.py
'''

import csv
import logging

from python.calledFiles import server_commands as sc

serverName = 'REDACTED'
def createCommands(log, editedGroups, batchDir):
    '''createCommands creates the server-commands
    
    calls functions that are created form the the server-commands module 

    
    Arguments:
        log {str} -- variable for the GroupProject-{today.month}.{today.day}
        .{today.year}.log
        editedGroups {str} -- variable for the edited_grp.csv
        batchDir {str} -- variable for the batch direcotry
    
    Returns:
        str -- variable for the commands.txt containing the server-commands
    '''
    commands = f'{batchDir}commands.txt'
    # Create server commands.
    with open(editedGroups, 'r') as csvFile, open(commands, 'w+', newline='') as com:
        csv_reader = csv.DictReader(csvFile)
        for line in csv_reader:
            # passes the info form the edited_grp.csv to create the server-commands
            if 'OU' not in line['Group'] and "UNRESTRICTED" not in line['Group']:
                aPaccessGroup = sc.addPrinterAccessGroup(serverName,
                    line['Printer Group Access'], line['Group'])
                sGroupQuo = sc.setGroupQuota(
                    line['Group'], line['Schedule Amount'], line['Schedule Period'], line['Initial Balance'])
                com.write(aPaccessGroup)
                logging.debug(f'{aPaccessGroup}')
                com.write(sGroupQuo)
                logging.debug(f'{sGroupQuo}', )
            if 'OU' in line['Group']:
                reGroup = sc.removeGroup(line['Group'])
                com.write(reGroup)
                logging.debug(f'{reGroup}')
    return commands


if __name__ == "__main__":
    print('This needs to be called from the "main.py" file')
else:
    pass
