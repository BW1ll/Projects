//new common js code for devices.

/**
 * Brian Willis
 * 2/19/20 - First setup
 * 03/03/20 - Corrected IF statement to OR instead of and.  This should
 * fix the issue of the currentMonthlyCount not resetting at the beginning of the 
 * month.

 * Monthly Sheet limit blocked at device and copy logging.
 * 
 * Convert double sided sheet cost for copy jobs to single sided so that the Sheet
 * limit will accurate.  Block release of print jobs that will go over the group 
 * sheet limit.
 * 
 * This script needs to be applied in-conjunction with the MasterPrintScript.js
 * (to be applied to each printer queue that relates to a restricted location) and 
 * the print-script-common.js script.
 *  
 */

 /**
  * cancelDEvicePrintReleasHook cancels print release jobs that go over the 
  * MAX_SHEETS_PER_MONTH limit of the associated group.
  */
function cancelDevicePrintReleaseHook(inputs, actions, MAX_SHEETS_PER_MONTH) {
    var sped = "SpedTeachers";
    var unrestricted = "UNRESTRICTED";
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var email = inputs.user.email;S
    var pages = inputs.heldJob.totalPages;
    var copies = inputs.heldJob.copies;
    var duplex = inputs.heldJob.isDuplex;
    var document = inputs.heldJob.documentName;
    var device = inputs.device.deviceName;
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");
    var date = new Date();
    var currentMonthIndex = date.getMonth();    
    var jobSheets = (Math.ceil(Math.ceil(pages / copies) / 2) * copies);
    var overSheetCount = (jobSheets + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;
    var overSheetCountSimplex = (pages + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;

    if (currentMonthlyCount == null || monthLastSeen == null || monthLastSeen != currentMonthIndex) {
        monthLastSeen = currentMonthIndex;
        currentMonthlyCount = 0;
    }
    if (!inputs.user.isInGroup(sped) || !inputs.user.isInGroup(unrestricted)) {
        if (duplex && (jobSheets + currentMonthlyCount) > MAX_SHEETS_PER_MONTH) {S
            actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by " + overSheetCount + ".  This job cannot be released.");
            actions.utils.sendEmail(email, "Print job was Denied", "DevicePull: " + name + " Job: " + document + " Over Limit: " + overSheetCount + " Limit: "
                + MAX_SHEETS_PER_MONTH);
            actions.log.info("The release of " + document + ", by  " + name + ",  " + userName + ",   will exceed monthly paper allotment by "
                + overSheetCount + ".  This job was not released.");
        } else if (!duplex && (pages + currentMonthlyCount) > MAX_SHEETS_PER_MONTH) {
            actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by " + overSheetCountSimplex
                + ".  This job cannot be released.");
            actions.utils.sendEmail(email, "Print job was Denied", "DevicePull: " + name + " Job: " + document + " Over Limit: " + overSheetCountSimplex + " Limit: "
                + MAX_SHEETS_PER_MONTH);
            actions.log.info("The release of " + document + ", by  " + name + ",  " + userName + ",   will exceed monthly paper allotment by "
                + overSheetCount + ".  This job was not released.");
        } else if ((duplex && (jobSheets + currentMonthlyCount) <= MAX_SHEETS_PER_MONTH) || (!duplex && (pages + currentMonthlyCount) <= MAX_SHEETS_PER_MONTH)) {
            actions.log.info("User:  " + name + ",  " + userName + ",  has " + (MAX_SHEETS_PER_MONTH - (currentMonthlyCount + jobSheets))
                + " sheet/s before you reach your max limit of " + MAX_SHEETS_PER_MONTH + " sheet limit.");
            currentMonthlyCount += jobSheets;
        } else {
            actions.log.info("DevicePull: " + device + ",  Name: " + name + ",  Username: " + userName + ",  Job: " + document
                + ",  script did not run, user should be in " + sped + " or not in one of the restricted print groups.  Released on "
                + device + ".");
        }
        currentMonthlyCount = Math.ceil(currentMonthlyCount);
        inputs.utils.formatNumber(currentMonthlyCount, 0);
        actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
        actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
    }
}

 /**
  * cancelDevicePJobLogHook logs copy jobs that are produced on devices that are
  * associated to restricted groups.
  */
function cancelDeviceJobLogHook(inputs, actions, MAX_SHEETS_PER_MONTH) {
    var sped = "SpedTeachers";
    var unrestricted = "UNRESTRICTED"
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var document = inputs.job.documentName;
    var duplex = inputs.job.isDuplex;
    var sheets = inputs.job.totalSheets;
    var pages = inputs.job.totalPages;
    var copies = inputs.job.copies;
    var copy = inputs.job.isCopy;
    var device = inputs.device.deviceName;
    var correctedCost = (sheets * 0.015);
    var correctedCost2 = ((Math.ceil(Math.ceil(pages / copies) / 2) * copies) * 0.015);
    var date = new Date();
    var currentMonthIndex = date.getMonth();
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");

    if (currentMonthlyCount == null || monthLastSeen == null || monthLastSeen != currentMonthIndex) {
        monthLastSeen = currentMonthIndex;
        currentMonthlyCount = 0;
    }

    if ((!inputs.user.isInGroup(sped) || !inputs.user.isInGroup(unrestricted)) && duplex && copy) {
        actions.job.setCost(correctedCost2);
        currentMonthlyCount += sheets;
        actions.job.addComment("DeviceLogDuplex: " + document + ",  Sheets: " + sheets + ",  Pages: " + pages + ",  Copies: " + copies + ",  Limit: " + MAX_SHEETS_PER_MONTH
            + ",  Monthly Count: " + currentMonthlyCount + ",  Corrected Cost 1: " + correctedCost + ",  Corrected Cost 2: " + correctedCost2);
    } else if (!inputs.user.isInGroup(sped) && !duplex && copy) {
        currentMonthlyCount += sheets;
        actions.job.addComment("DeviceLogSimplex: " + device + " Job: " + document + ", was simplex and cost ajusted not needed for '" + userName + ",  Sheets: " + sheets
            + ",  Pages: " + pages + ",  Copies: " + copies + ",  Limit: " + MAX_SHEETS_PER_MONTH + ",  Monthly Count: " + currentMonthlyCount + ".");
    } else {
        actions.job.addComment("DevicePull: " + device + ",  Name: " + name + ",  Username: " + userName + ",  Job: " + document
            + ",  script did not apply, user should be in " + sped + " or not in one of the restricted print groups, or is not a copy job.  Released on " + device + ".");
    }
    currentMonthlyCount = Math.ceil(currentMonthlyCount);
    inputs.utils.formatNumber(currentMonthlyCount, 0);
    actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
    actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
}​