
# **PROJECT: UPDATE AD GROUPS IN PaperCut MF**

## UpdateGroupsProject, project to move users to the correct groups, based on updates to customers AD

1. Sort new groups into elementary and secondary to assign correct printer for chromebook printing.
2. Delete old OU's from PaperCut
3. Example out put file in "/UpdateGroupsPcMF/batch/".

## *SEPARATE THE GROUPS*

1. Separate the needed _GRP groups from the rest of the groups.
2. Separate the OU groups from the rest of the groups.
3. write the _GRP and the OU groups to a new, separate, files.
4. Close the original file.

- ⚠️ Sort the OU's and groups so that only the OU's related to ***TEACHER*** and ***OFFICE*** at schools are remain. ⚠️

---------

## *UPDATE THE NEW GROUP FILE*

1. Open new _GRP group file for editing
2. Edit for each header in file
3. Add new header for printer access restrictions
4. Add new header for device access restrictions
5. Add correct printer to the access header

- 👩 **HEADERS:** 👨
- 💲*INITIAL BALANCE*💲 🛑*INITIALLY RESTRICTED*🛑 📆*SCHEDULE AMOUNT*📆 📆*SCHEDULE PERIOD*📆
- 🚸 **NEW HEADERS:** 🚸
- 🖨 *PRINTER GROUP ACCESS, DEVICE GROUP ACCESS* 🖨
- ⚠️ Be sure to ***NOT*** change the ***CURRENT RESTRICTIONS*** on the restricted groups ⚠️

---------

## *DELETE UNNEEDED OU GROUPS*

1. Delete the unneeded OU groups from the OU file.

---------

## *API COMMANDS*

1. Configure API commands to update _GRP groups with new variables.
2. Configure API commands to add appropriate printer/device access.
3. Configure API to remove OU groups in OU file.

- ⚠️ Be sure that ***_GRP*** has been assigned to the appropriate ***DEVICE/PRINTER ACCESS*** ⚠️
- 🛑 ***Before*** the ***OU GROUPS*** have been ***DELETED***. 🛑
  - ❗️This could cause users to not be able to print if done incorrectly❗️
- [PaperCut MF API Reference](https://www.papercut.com/support/resources/manuals/ng-mf/common/topics/tools-web-services.html)
- [PaperCut MF SERVER-COMMAND Reference](https://www.papercut.com/support/resources/manuals/ng-mf/common/topics/tools-server-command.html)
  - 😠 The API [ARGS...] are not listed with the API reference.  Use the server-command [ARGS...]. 😠

---------
