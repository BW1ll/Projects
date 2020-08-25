# ! /usr/bin/env python3

import sys
import os.path
import csv
import logging
import shutil
from createCommands import createCommands as cc


def editGroups(editedGroups, log, fieldnames, elem, sec, unrestricted, csvDir):
    ''' Reads and modifies the data to be sent to the API '''

    print('\n Editing group data...')
    tempEditedG = f'{csvDir}tempEditedG.csv'

    print('Editing tempEditedG file..')
    with open(editedGroups, 'r') as group, open(tempEditedG, 'w', newline='') as edited:
        csv_reader = csv.DictReader(group)
        csv_writer_edited = csv.DictWriter(edited, fieldnames=fieldnames)
        csv_writer_edited.writeheader()
        for line in csv_reader:
            if unrestricted in line['Group']:
                csv_writer_edited.writerow(line)
                logging.info(f'Writing {line} to file...')
            for group in sec:
                if group in line['Group']:
                    if group == 'REDACTED':
                        line['Printer Group Access'] = 'REDACTED'
                        csv_writer_edited.writerow(line)
                        logging.info(
                            f'Only updating Print Group Access in {line}...')
                    else:
                        line['Printer Group Access'] = 'REDACTED'
                        line['Initial Balance'] = '100.0000'
                        line['Initially Restricted'] = 'N'
                        line['Schedule Period'] = 'Monthly'
                        line['Schedule Amount'] = '200.0000'
                        csv_writer_edited.writerow(line)
                        logging.info(f'Updating sec {line}...')
            for group in elem:
                if group in line['Group']:
                    if (group == 'REDACTED') or (group == 'REDACTED'):
                        line['Printer Group Access'] = 'REDACTED'
                        csv_writer_edited.writerow(line)
                        logging.info(
                            f'Only updating Print Group Access in {line}...')
                    else:
                        line['Printer Group Access'] = 'REDACTED'
                        line['Initial Balance'] = '100.0000'
                        line['Initially Restricted'] = 'N'
                        line['Schedule Period'] = 'Monthly'
                        line['Schedule Amount'] = '200.0000'
                        csv_writer_edited.writerow(line)
                        logging.info(f'Updating elem {line}...')
       
    return fieldnames, elem, sec, tempEditedG




if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
else:
    pass
