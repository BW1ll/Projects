##! /usr/bin/env python3

import sys
import os.path
import csv
import logging
from editGroups import editGroups as edg 

def groupLists(editedGroups, log, fieldnames):
    e = []
    s = []
    eo = []
    so = []
    elem = []
    sec = []
    list = ['REDACTED', 'REDACTED', 'REDACTED', 'REDACTED', 'REDACTED']
    appendFieldnames = ['Printer Group Access', 'Device Group Access']
    print('\n Updating lists...')

    with open(editedGroups, 'r') as group:
        csv_reader = csv.DictReader(group)
        for line in csv_reader:
            if 'ELEM' in line['Group'] and 'OFFICE' not in line['Group']:
                e.append(line['Group'])
            if 'SEC' in line['Group'] and 'OFFICE' not in line['Group']:
                s.append(line['Group'])
            if 'ELEM' in line['Group'] and 'TEACHERS' not in line['Group']:
                eo.append(line['Group'])
            if 'SEC' in line['Group'] and 'TEACHERS' not in line['Group']:
                so.append(line['Group'])

    el = [i.replace('REDACTED', '') for i in e]
    se = [i.replace('REDACTED', '') for i in s]
    elo = [i.replace('REDACTED', '') for i in eo]
    seo = [i.replace('REDACTED', '') for i in so]

    for i in el:
        elem.append(i[-10:])

    for i in se:
        sec.append(i[-10:])

    for i in elo:
        elem.append(i[-8:])

    for i in seo:
        sec.append(i[-8:])

    for item in appendFieldnames:
        fieldnames.append(item)

    for item in list:
        if 'REDACTED' == item:
            sec.append(item)
        else:
            elem.append(item)

    unrestricted = 'UNRESTRICTED'
    logging.debug(fieldnames)
    logging.debug(elem)
    logging.debug(sec)
    return fieldnames, elem, sec, unrestricted


if __name__ == "__main__":
    print('This needs to be called from the "Main.py" file')
else:
        pass