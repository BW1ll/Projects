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
import os.path
import re
import sys


def getGroups(groupsFile, editedGroups, editedGroupFile, log):
    '''getGroups takes the input csv file and outputs the data needed

    Takes the data form the group_list.csv, finds the required data
    and outputs it to a new edited_grp.csv

    Arguments:
        groupsFile {str} -- variable for the group_list.py 
        editedGroups {str} -- variable for the edited_grp.csv 
        editedGroupFile {str} -- variable for the group_list.txt
        log {str} -- variable for the GroupProject-{today.month}.{today.day}
        .{today.year}.log

    '''
    # lists needed to add the correct Pull Print printer
    sec = []
    elem = []
    fieldnames = ['Group', 'Initial Balance', 'Initially Restricted',
                  'Schedule Amount', 'Schedule Period', 'Printer Group Access']
    # Writes the headers to the group_list.txt file
    with open(groupsFile, 'r') as fIn, open(editedGroupFile, 'w', newline='') as fOut:
        print(f'Group,Initial Balance,Initially Restricted,Schedule Amount,Schedule Period,Printer Group Access', file=fOut)
    # findes the correct groups from the original file and writes to the temp file
    with open(groupsFile, 'r') as fIn, open(editedGroupFile, 'a', newline='') as fOut:
        searchLines = fIn.readlines()
        searchLines[-1]
        for line in searchLines:
            groupPattern = re.search(
                r'\d{2}(teachers|office)', line, flags=re.IGNORECASE)  # AD group pattern
            # schoolPattern = re.search(r'(SEC|ELEM)', line, flags=re.IGNORECASE)
            if groupPattern:
                # writes the line with the group pattern
                print(f'{line.strip()},', file=fOut)
    # adds the groups to the correct school type list
    with open(groupsFile, 'r') as fIn:
        searchFile = fIn.read()
        # searchLine = fIn.readline()
        # OU group pattern
        pattern = re.compile(
            r'(?P<TypeSchl>(SEC|ELEM)).*(?P<Group>\d{2}(teachers|office))', flags=re.IGNORECASE)
        data = re.finditer(pattern, searchFile)
        for element in data:
            logging.debug(element.group('TypeSchl'))
            logging.debug(element.group('Group'))
            if element.group('TypeSchl') == 'SEC':
                sec.append(element.group('Group'))
                logging.debug(sec)
            if element.group('TypeSchl') == 'ELEM':
                elem.append(element.group('Group'))
                logging.debug(elem)
    # updates the data form the temp file and writes it to the final csv file
    with open(editedGroupFile, 'r') as fIn, open(editedGroups, 'w+', newline='') as fOut:
        csv_reader = csv.DictReader(fIn)
        csv_writer_edited = csv.DictWriter(fOut, fieldnames=fieldnames)
        csv_writer_edited.writeheader()
        for line in csv_reader:
            for group in sec:
                if group in line['Group']:
                    # has different values then the rest of sec
                    if group == 'REDACTED':
                        line['Printer Group Access'] = 'REDACTED'
                        csv_writer_edited.writerow(line)
                        logging.debug(
                            f'Only updating Print Group Access in {line}...')
                    else:
                        line['Printer Group Access'] = 'REDACTED'
                        line['Initial Balance'] = '100.0000'
                        line['Initially Restricted'] = 'N'
                        line['Schedule Period'] = 'Monthly'
                        line['Schedule Amount'] = '200.0000'
                        csv_writer_edited.writerow(line)
                        logging.debug(f'Updating sec {line}...')
            for group in elem:
                if group in line['Group']:
                    # has different values thant the rest of the elem.
                    if (group == 'REDACTED') or (group == 'REDACTED'):
                        line['Printer Group Access'] = 'REDACTED'
                        csv_writer_edited.writerow(line)
                        logging.debug(
                            f'Only updating Print Group Access in {line}...')
                    else:
                        line['Printer Group Access'] = 'REDACTED'
                        line['Initial Balance'] = '100.0000'
                        line['Initially Restricted'] = 'N'
                        line['Schedule Period'] = 'Monthly'
                        line['Schedule Amount'] = '200.0000'
                        csv_writer_edited.writerow(line)
                        logging.debug(f'Updating elem {line}...')


if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
else:
    pass
