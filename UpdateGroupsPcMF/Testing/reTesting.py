# ! /usr/bin/env python3

''' Trying to use regular expressions for the group sorting. '''

import re
import csv
import logging


def getGroups(groupsFile, editedGroups, log, csvDir):

    sec = []
    elem = []
    fieldnames = ['Group', 'Initial Balance', 'Initially Restricted',
                  'Schedule Amount', 'Schedule Period', 'Printer Group Access']
    with open(groupsFile, 'r', newline='') as fIn, open(editedGroups, 'w+', newline='') as fOut:
        searchLines = fIn.readlines()
        searchLines[-1]
        for line in searchLines:
            groupPattern = re.search(
                r'\d{2}(teachers|office)', line, flags=re.IGNORECASE)
            schoolPattern = re.search(r'(SEC|ELEM)', line, flags=re.IGNORECASE)
            if groupPattern:
                print(f'{line.strip()}', file=fOut)

    with open(groupsFile, 'r') as fIn, open(editedGroups, 'w+') as fOut:
        searchFile = fIn.read()
        searchLine = fIn.readline()

        pattern = re.compile(
            r'(?P<TypeSchl>(SEC|ELEM)).*(?P<Group>\d{2}(teachers|office))', flags=re.IGNORECASE)
        data = re.finditer(pattern, searchFile)
        for element in data:
            # print(element.group('TypeSchl'))
            # print(element.group('Group'))
            if element.group('TypeSchl') == 'SEC':
                sec.append(element.group('Group'))
            if element.group('TypeSchl') == 'ELEM':
                elem.append(element.group('Group'))


getGroups(groupsFile, editedGroups, log, csvDir)


if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
else:
        pass