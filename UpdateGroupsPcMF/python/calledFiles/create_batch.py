# ! /usr/bin/env python3

''' 
@author Brian Willis
2/27/20 - initial release
03/06/20 - updated import modules to work with main.py outside of the 
python/calledFiles direcotry, and updated documentation

part of the UpdateGroupsProjected, called from the main.py
'''

import csv
import os
import subprocess


def createBatch(commands, baseBatch, log, batchDir):
    '''createBatch Creates the batch file to run on the PaperCut Server

    Calls the base batch template and writes the server commands to the
    batch file to run on the PaperCut server to execute the commands

    Arguments:
        commands {str} -- variable for the commands.txt
        baseBatch {str} -- variable for the  baseBatch.bat
        log {str} -- variable for the GroupProject-{today.month}.{today.day}
        .{today.year}.log
        batchDir {str} -- variable for the batch direcotry
        batchDir {str} -- variable for the 
    '''
    commandsBatch = (f'{batchDir}batchCommands.bat')
    # writes the command to the final batch file and ends the batch file
    with open(commands, 'r') as text, open(baseBatch, 'r') as bb, open(commandsBatch, 'w+', newline='') as coBat:
        for line in bb:
            coBat.write(line.upper())
        for line in text:
            coBat.write(line)
        coBat.write((
            '\n'
            'cls\n'
            'echo Done sending commands...\n'
            'echo Please verify that the commands have been exicuted correctly\n'
            'echo Press enter to exitn\n'
            'pause\n'

            'goto END\n'

            ':END'

        ).upper())
        coBat.close()


if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
else:
    pass
