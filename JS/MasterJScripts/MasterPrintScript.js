/**
 * Brian Willis
 * 2/5/20 - First setup
 * 2/17/20 - Verified that the three Hooks are working and removed info statement
 * in the else line.
 * 2/18/20 - Changed to on script, cancelPrintJobHook(inputs, actions, 
 * MAX_SHEETS_PER_MONTH), that passes the MAX_SHEET_PER_MONTH variable to the 
 * function.
 * 03/03/20 - Updated <REDACTED>TEACHERS_GRP to 1000 sheets per month, as requested
 * by the school principal
 *  
 * This JavaScript is for calling the cancelPrintJobHook(inputs, actions, 
 * MAX_SHEETS_PER_MONTH) for each school/locations, and any other global script 
 * that is used across this district. 
 *  
 * Individual school teacher groups are listed here and are executed if the person  
 * printing is in the appropriate teacher group.
 *
 * For limits on sheet count, this script must be used in conjunction with a Device 
 * script for each device in the printer group.
 */

function printJobHook(inputs, actions) {
    if (!inputs.job.isAnalysisComplete) {
        return;
    }
    // This function changes the default time out for IT persons print jobs to four days.
    // It can be run on all of the Pull Print Printers but only needs to be on the 
    // Ricoh Pull Print PC Printer:
    ITtimeLimit(inputs, actions);

    // This if statement runs through the different teacher groups and calls the 
    // cancelPrintJobHook(inputs, actions, MAX_SHEETS_PER_MONTH) for the correct
    // teacher group.  Be sure to add a new else if statement when adding new locations.
    if (inputs.user.isInGroup("<REDACTED>TEACHERS_GRP")){
        cancelPrintJobHook(inputs, actions, 1000);
    } else if (inputs.user.isInGroup(<REDACTED>TEACHERS_GRP)) {
        cancelPrintJobHook(inputs, actions, 1500);
    } else if (inputs.user.isInGroup("<REDACTED>TEACHERS_GRP")) {
        cancelPrintJobHook(inputs, actions, 1000);
    } else {
        
    }
}