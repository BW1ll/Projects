/**
 * Brian Willis
 * 2/5/20 - First setup
 * 2/6/20 - <REDACTED>
 * 
 * Functon to change the cost for duplex print jobs released on MFP's to the same
 * as the cost for simplex.  This is done so that the monitary value will be the
 * same, so that when a user hits the monitary limit of x, the acctual amount of 
 * paper produced is the same for every user in that group.  This script does not
 * acctually apply the limit of x.
 * 
 * This script needs to be appllied inconjuction with a devices script (for each
 * MFP in the printer group), and if needed, a direct print script (for each 
 * direct printer in the printer goup)
 * 
 * Name the functions in this format. Script will be added to the COMMON.JS:
 * print-script-common.js name = DBPullPrint(inputs, actions);
 */

function DasiyBatesPullPrint(inputs, actions) {
  
    if (!inputs.job.isAnalysisComplete) {

        return;
    }
    var teachersGRP = "<REDACTED>TEACHERS_GRP";
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var document = inputs.job.documentName;
    var duplex = inputs.job.isDuplex;
    var sheets = inputs.job.totalSheets;
    var correctedCost = (Math.ceil(sheets / 2) * 0.015);

    if (inputs.user.isInGroup(teachersGRP) && duplex) {
        actions.job.setCost(correctedCost);
        actions.job.addComment("PullPrint: " + name + ", " + userName + ", " + document 
            + ", has been cost ajusted for '" + teachersGRP + "' " + correctedCost + ".")
        actions.log.info("PullPrint: " + name + ", " + userName + ", "+ document 
            + ", has been cost ajusted for '" + teachersGRP + "' " + correctedCost + ".")
    }
}