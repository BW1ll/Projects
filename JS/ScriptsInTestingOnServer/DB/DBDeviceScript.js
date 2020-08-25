/**
 * Brian Willis
 * 2/5/20 - First setup
 * 2/6/20 - converted to <REDACTED>
 * Monthly Sheet limit blocked at device.
 * 
 * Convert double sided sheet cost for copy jobs to single sided so that the Sheet limit will
 * accurate.
 * 
 * This script needs to be appllied inconjuction with a Pull Print script (to be
 * applied to each virutal Pull Print queue that relates to this location), and 
 * if needed, a direct print script (for each direct printer in the printer goup)
 * 
 * I do not suggest putting the device scripts in the print-script-common.js file
 */

function devicePrintReleaseHook(inputs, actions) {

    var MAX_SHEETS_PER_MONTH = 1500; // // change this to the montly sheet limit and in deviceJobLogHook below
    var teachersGRP = "<REDACTED>TEACHERS_GRP"; // change this var in deviceJobLogHook below.
    var sped = "SpedTeachers";
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var email = inputs.user.email;
    var pages = inputs.heldJob.totalPages;
    var copies = inputs.heldJob.copies;
    var duplex = inputs.heldJob.isDuplex;
    var document = inputs.heldJob.documentName;
    var device = inputs.device.deviceName;
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");
    var currentMonthIndex = inputs.heldJob.date.getMonth();
    var jobSheets = (Math.ceil(Math.ceil(pages / copies) / 2) * copies);
    var overSheetCount = (jobSheets + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;
    var overSheetCountSimplex = (pages + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;

    if (currentMonthlyCount == null) currentMonthlyCount = 0;
    if (monthLastSeen == null || monthLastSeen != currentMonthIndex) currentMonthlyCount = 0;
    if (inputs.user.isInGroup(teachersGRP) && !inputs.user.isInGroup(sped) && duplex) {
        if ((jobSheets + currentMonthlyCount) > MAX_SHEETS_PER_MONTH) {
            actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by " + overSheetCount + ".  This job cannot be released.");
            actions.utils.sendEmail(email, "Print job was Denied", "DevicePull: " + name + " Job: " + document + " Over Limit: " + overSheetCount + " Limit: "
                + MAX_SHEETS_PER_MONTH);
            currentMonthlyCount += jobSheets;
            actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
            actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
            actions.log.info("DevicePull Duplex: " + device + ",  Name: " + name + ",  Username: " + userName + ",  Job: " + document + ",  Sheets: " + jobSheets + ",  Limit: "
                + MAX_SHEETS_PER_MONTH + ",  Monthly Count: " + currentMonthlyCount + ",  curreentMonthIndex: " + currentMonthIndex + ",  MonthLastSeen: "
                + monthLastSeen + ".");
        }
    }
    if (inputs.user.isInGroup(teachersGRP) && !inputs.user.isInGroup(sped) && !duplex) {
        if ((pages + currentMonthlyCount) > MAX_SHEETS_PER_MONTH) {
            actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by " + overSheetCountSimplex
                + ".  This job cannot be released.");
            actions.utils.sendEmail(email, "Print job was Denied", "DevicePull: " + name + " Job: " + document + " Over Limit: " + overSheetCountSimplex + " Limit: "
                + MAX_SHEETS_PER_MONTH);
            currentMonthlyCount += pages;
            actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
            actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
            actions.log.info("DevicePull Simplex: " + device + ",  Name: " + name + ",  Username: " + userName + ",  Job: " + document + ",  Sheets: " + pages + ",  Limit: "
                + MAX_SHEETS_PER_MONTH + ",  Monthly Count: " + currentMonthlyCount + ",  curreentMonthIndex: " + currentMonthIndex + ",  MonthLastSeen: "
                + monthLastSeen + ".");
        }
    }
}

function deviceJobLogHook(inputs, actions) {
    // Check if user is a teachersGRP member and that this was a copy job
    var MAX_SHEETS_PER_MONTH = 1500;
    var teachersGRP = "<REDACTED>TEACHERS_GRP";
    var sped = "SpedTeachers";
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
    var currentMonthIndex = inputs.job.date.getMonth();
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");

    if (currentMonthlyCount == null) currentMonthlyCount = 0;
    if (monthLastSeen == null || monthLastSeen != currentMonthIndex) currentMonthlyCount = 0;
    if (inputs.user.isInGroup(teachersGRP) && !inputs.user.isInGroup(sped) && duplex && copy) {
        actions.job.setCost(correctedCost2);
        currentMonthlyCount += sheets;
        actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
        actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
        actions.job.addComment("Job Duplex: " + document + ",  Sheets: " + sheets + ",  Pages: " + pages + ",  Copies: " + copies + ",  Limit: " + MAX_SHEETS_PER_MONTH + ",  Monthly Count: "
            + currentMonthlyCount + ",  Corrected Cost 1: " + correctedCost + ",  Corrected Cost 2: " + correctedCost2)
    }
    if (inputs.user.isInGroup(teachersGRP) && !inputs.user.isInGroup(sped) && !duplex && copy) {
        currentMonthlyCount += sheets;
        actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
        actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
        actions.job.addComment("DeviceLog: " + device + " Job: " + document + ", was simplex and cost ajusted not needed for '" + teachersGRP + "'.");
    }
}​