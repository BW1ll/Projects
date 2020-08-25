# ! /usr/bin/env python3

''' 
@author Brian Willis
2/27/20 - initial release
03/06/20 - updated import modules to work with main.py outside of the 
python/calledFiles direcotry, and updated documentation

part of the UpdateGroupsProjected, called from the main.py
'''
import datetime
import logging
import os
import os.path
import sys
import time


def checkFiles(csvDir, logDir, batchDir):  # make a for loop from a list of files
    '''checkFiles validates that required csv is present and add other files

    Verifies that group_list.csv is in the CSV directory
    Creates working files that are needed if they are not present
    '''
    # group_list.csv can be downloaded from PaperCut MF on the "Groups" tab on the bottom left of web page
    groupsFile = (f'{csvDir}group_list.csv')
    # sets location for the files needed to create the final batch file
    editedGroups = (f'{csvDir}edited_grp.csv')
    editedGroupFile = (f'{csvDir}group_list.txt')
    baseBatch = (f'{batchDir}baseFile.bat')
    # open log file
    today = datetime.date.today()  # get date info
    log = (f'{logDir}GroupProject-{today.month}.{today.day}.{today.year}.log')

    print(f'Verifying need {groupsFile} is present...')
    time.sleep(1)
    neededFiles = [log, groupsFile, editedGroups, editedGroupFile, baseBatch]
    print('Creating ofther needed files...')
    time.sleep(1)
    for file in neededFiles:
        if file == groupsFile:
            try:
                d = open(f'{file}')  # check device file
                d.close()
            except:
                print(f'{file} not found.')
                time.sleep(1)
                logging.debug(f'{file}, File not found!')
                sys.exit()
        else:
            try:
                d = open(f'{file}')  # check device file
                d.close()
            except:
                print(f'{file} created.')
                logging.info(f'{file} created.')
                time.sleep(1)
                with open(f'{file}', 'w+') as oF:
                    oF.close()
                logging.debug(f'{file}, created.!')
    print('All Files cerated....')
    time.sleep(1)
    return groupsFile, editedGroups, editedGroupFile, baseBatch, log


if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
    pass
