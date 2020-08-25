# ! /usr/bin/env python3

''' 
@author Brian Willis
02/27/20 - initial release
03/06/20 - updated documentation

PaperCut Server-commands converted to functions form making batch files.

'''

import datetime

serverCommand = 'server-command'
serverName = 'REDACTED'


def addPrinterAccessGroup(serverName, printer_name, group_name):
    '''
    addPrinterAccessGroup [add-printer-access-group <server_name> <printer_name> <group_name>]
    
    Adds the user group to the printer's access group list.
    
    :param printer_name: [the printer's server name]
    :type printer_name: [str]
    :param group_name: [the printer's queue name]
    :type group_name: [str]
    :parm server_name: [the name of the user group that needs to be added]
    :type: [str]

    :return: [completed server command]
    :rtype: [str]
    '''    
    aPaccessGroup = f'{serverCommand} add-printer-access-group {serverName} "{printer_name}" {group_name}\n'
    return aPaccessGroup
    


def setGroupQuota(group_name, quota_amount, period, quota_max_accum):
    '''
    setGroupQuota [set-group-quota <group_name> <quota_amount> <period> <quota_max_accum>]

    sets quta amont, limit, and time frame

    :param group_name: [the name of the group to set]
    :type group_name: [str]
    :param quota_amount: [the quota amount]
    :type quota_amount: [num/float]
    :param period: [the schedule period (i.e. DAILY, WEEKLY, MONTHLY)]
    :type period: [str]
    :param quota_max_accum: [the quota maximum accumulation amount.Set to 0.0 to have no limit]
    :type quota_max_accum: [num/float]

    :return: [completed server command]
    :rtype: [str]
    '''
    sGroupQuo = f'{serverCommand} set-group-quota {group_name} {quota_amount} {period} {quota_max_accum}\n'
    return sGroupQuo


def removeGroup(group_name):
    '''
    removeGroup [remove-group <group_name>]

    Removes the group

    :param group_name: [The name of the group to remove]
    :type group_name: [str]

    :return: [completed server command]
    :rtype: [str]
    '''
    reGroup = f'{serverCommand} remove-group {group_name}\n'
    return reGroup


def groupExists(group_name):
    '''
    groupExists [group-exists <group_name>]
    
    Test to see if a group exists
    
    :param group_name: [the group name to test]
    :type group_name: [str]

    :return: [completed server command]
    :rtype: [str]
    '''
    gExists = f'{serverCommand} group-exists {group_name}'
    return gExists


def addUserToGroup(username, group):
    '''
    addUserToGroup [add-user-to-group <username> <group>]
    
    Add a user to the specified group. It changes the group membership within \
    the application not in the OS/Network/Domain user directory.
    
    :param username: [the name of the user]
    :type username: [str]
    :param group: [the name of the group to which the user needs to be added]
    :type group: [str]
    :return: [completed server command]
    :rtype: [str]
    '''
    aUserToGroup = f'{serverCommand} add-user-to-group {username} {group}'
    return aUserToGroup


if __name__ == "__main__":
    pass
