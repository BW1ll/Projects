/**
 * Brian Willis
 * 2/5/20 - First setup
 * 2/6/20 - <REDACTED> 
 * Monthly Sheet limit for use on direct print printers.
 * 
 * This script, if it is needed, needs to be appllied inconjuction with a devices 
 * script (for each MFP in the printer group), and Pull Print script (to be
 * applied to each virutal Pull Print queue that relates to this location),
 * 
 * Name the file in this format if this script will be added to the COMMON.JS:
 * print-script-common.js name = MMPrint(inputs, actions)
 */

function printJobHook(inputs, actions) {
    // Modify this value to change the monthly page limit.  
    var MAX_SHEETS_PER_MONTH = 0;

    if (!inputs.job.isAnalysisComplete) {
        return;
    }
    var teachersGRP = "<REDACTED>TEACHERS_GRP";
    var sped = "SpedTeachers";
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var email = inputs.user.email;
    var document = inputs.job.documentName;
    var sheets = inputs.job.totalSheets;
    var printer = inputs.job.printerName;
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");
    var currentMonthIndex = inputs.job.date.getMonth();
    var overSheetCount = (sheets + currentMonthlyCount - MAX_SHEETS_PER_MONTH);
    var deniedMessage = ("This print job, " + document + ",   has been denied.  You have exceeded" + " your monthly limit of " + MAX_SHEETS_PER_MONTH + " sheets per month by " + overSheetCount + " sheet/s.");

    if (inputs.user.isInGroup(sped)) {
        actions.log.info("DirectPritnt:" + name + ", " + userName + ", is a memeber of the '" + sped + "'.");
    } else {
        if (inputs.user.isInGroup(teachersGRP)) {
            if (currentMonthlyCount == null) currentMonthlyCount = 0;
            if (monthLastSeen == null || monthLastSeen != currentMonthIndex) currentMonthlyCount = 0;
            actions.log.info("DirectPritnt: " + printer + ": " + name + ", " + userName + ", curreentMonthIndex is now "
                + currentMonthIndex + ", MonthLastSeen is now " + monthLastSeen + ", CurrentMonthly Count "
                + currentMonthlyCount + ".");
            if ((currentMonthlyCount + sheets) > MAX_SHEETS_PER_MONTH) {
                actions.job.addComment(deniedMessage);
                actions.client.sendMessage(deniedMessage);
                actions.utils.sendEmail(email, "Print job was Denied", deniedMessage);
                actions.job.cancelAndLog("This job was denied because you have exceeded the "
                    + MAX_SHEETS_PER_MONTH + " sheet monthly quota by " + overSheetCount + " sheet/s.");
                return;
            }
            actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
            actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
        }
    }
}