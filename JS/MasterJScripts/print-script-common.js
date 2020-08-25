//new common js code for printers

/**
 * Function to change the time of held jobs for IT department.
 */
// eslint-disable-next-line no-unused-vars
function ITtimeLimit(inputs, actions) {

    var GROUP_FOR_NEW_TIMEOUT = "IT";
    var NEW_TIMEOUT_IN_MINUTES = 5760;

    //Test to see if the user printing is a member of this group
    if (inputs.user.isInGroup(GROUP_FOR_NEW_TIMEOUT)) {
        //This user is a member of the defined group. Adjust the timeout of this job.
        actions.job.setHoldReleaseTimeout(NEW_TIMEOUT_IN_MINUTES);
    }
}
/**
 * Brian Willis
 * 2/14/20 - First Setup
 * 02/17/20 - add instructions for applying script, and naming call back function
 * 02/18/20 - changed to one script for sheet limits for all locations called 
 * by adding and else if to the MasterPrintScript.js file.
 * 03/03/20 - Corrected IF statement to OR instead of and.  This should
 * fix the issue of the currentMonthlyCount not resetting at the beginning of the 
 * month.
 * 
 * Monthly Sheet limit for individual locations.  Do not edit this script.  Edit
 * the cancelPrintJobHook(inputs, actions, MAX_SHEETS_PER_MONTH) function in the
 * MasterPrintScript.js file.
 * 
 * This script needs to be applied in-conjunction with a devices script (for each
 * MFP in the printer group).
 * 
 * The teacherGRP group is checked before the script is run and the MAX_SHEETS_PER_MONTH
 * variable is passed through to this script.
 */
function cancelPrintJobHook(inputs, actions, MAX_SHEETS_PER_MONTH) {
    var sped = "SpedTeachers";
    var unrestricted = "UNRESTRICTED"
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var email = inputs.user.email;
    var document = inputs.job.documentName;
    var sheets = inputs.job.totalSheets;
    var pages = inputs.job.totalPages;
    var copies = inputs.job.copies;
    var duplex = inputs.job.isDuplex;
    var correctedCost = ((Math.ceil(Math.ceil(pages / copies) / 2) * copies) * 0.015);
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");
    var date = new Date();
    var currentMonthIndex = date.getMonth();
    var overSheetCount = (sheets + currentMonthlyCount - MAX_SHEETS_PER_MONTH);
    var deniedMessage = ("This print job, " + document + ",   has been denied.  You have exceeded" + " your monthly limit of " + MAX_SHEETS_PER_MONTH + " sheets per month by "
        + overSheetCount + " sheet/s.");

    if (currentMonthlyCount == null || monthLastSeen == null || monthLastSeen != currentMonthIndex) {
        monthLastSeen = currentMonthIndex;
        currentMonthlyCount = 0;
    }

    if (!inputs.user.isInGroup(sped) || !inputs.user.isInGroup(unrestricted)) {
        if ((currentMonthlyCount + sheets) > MAX_SHEETS_PER_MONTH) {
            actions.client.sendMessage(deniedMessage);
            actions.utils.sendEmail(email, "Print job was Denied", deniedMessage);
            actions.job.cancelAndLog("This job was denied because it will exceeded the "
                + MAX_SHEETS_PER_MONTH + " sheet monthly quota by " + overSheetCount + " sheet/s.");
        } else if ((currentMonthlyCount + sheets) <= MAX_SHEETS_PER_MONTH) {
            actions.job.addComment("You have " + (MAX_SHEETS_PER_MONTH - (currentMonthlyCount + sheets)) + " sheet/s before you reach your max limit of " + MAX_SHEETS_PER_MONTH
                + " sheet limit.");
            currentMonthlyCount += sheets;
            if (duplex) {
                actions.job.setCost(correctedCost);
            }
        } else {
            actions.log.warning("Verify tha the user, " + name + ",  " + userName + ",  is in the " + sped + "  group.");
        }
        currentMonthlyCount = Math.ceil(currentMonthlyCount);
        inputs.utils.formatNumber(currentMonthlyCount, 0);
        actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
        actions.user.onCompletionSaveProperty("month-last-seen", currentMonthIndex);
    }
}
