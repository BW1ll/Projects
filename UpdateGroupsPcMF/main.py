# ! /usr/bin/env python3

'''
@author Brian Willis
2/27/20 - initial release
03/06/20 - updated import modules to work with main.py outside of the 
python/calledFiles direcotry, and updated documentation

This will use date for PaperCut NG/MF to edit Groups inside of PaperCut.

It will verify that the main .csv file is in place, update the data in that 
file and out put a batch file to be run on the PaperCut server.
'''

import datetime
import logging
import os
import os.path
import sys
import time

from python.calledFiles import checking_files as cf
from python.calledFiles import create_batch as cb
from python.calledFiles import create_commands as cc
from python.calledFiles import get_groups as gg


abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

workingDir = dname
csvDir = f'{workingDir}/CSV/'
logDir = f'{workingDir}/logs/'
batchDir = f'{workingDir}/batch/'


os.system('cls')
print('\n  ' + '=' * 47)
print(' | MDS/Papercut Software Group Manipulation Tool |')
print('  ' + '=' * 47)
time.sleep(1)


def main():
    '''main This is the main call function.  
    It will handle calling all subprocesses. 

    [extended_summary]
    '''
    # passes files to the checkFiles function
    groupsFile, editedGroups, editedGroupFile, baseBatch, log = cf.checkFiles(
        csvDir, logDir, batchDir)
    os.system('cls')
    print(f'\n File must be named: {groupsFile}!')
    print(f'\n Checking for {groupsFile} file...')
    print(f'\n Verify log located in Logs folder when complete.')
    # set logging state
    logging.basicConfig(filename=log, force=True, level=logging.DEBUG)
    logging.info('Starting log file')
    print('Logging started...')
    time.sleep(1)
    # creates the the file needed to create the batch script
    print('\n Gathering group data....')
    time.sleep(1)
    fieldnames = gg.getGroups(groupsFile, editedGroups, editedGroupFile, log)
    # creates the server-commands for the batch script
    print("\n creating server-commands...")
    time.sleep(1)
    commands = cc.createCommands(log, editedGroups, batchDir)
    # creates the the batch script to be run on the PaperCut MF server
    print('\n creating batch file...')
    time.sleep(1)
    cb.createBatch(commands, baseBatch, log, batchDir)
    print('\n batch file created')
    time.sleep(1)
    os.system('cls')
    end()


def end():
    '''end ends the program

    ending message to close the program
    '''
    print('\n  ' + '=' * 47)
    print(' | MDS/Papercut Software Group Manipulation Tool |')
    print(' |                  Job Completed                |')
    print(' |              Press Enter to exit              |')
    print('  ' + '=' * 47)
    logging.info('End job log...')
    input()


if __name__ == "__main__":

    main()
