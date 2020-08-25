/*
* Set a daily color copy limit and block color copy access once this limit has been reached.
*
* Note: Test before use as not all devices will support this feature.
*       It's also important to note that color copy access can only be blocked *on login*
*       Therefore this recipe comes with disclaimer that once a user has been logged in, they
*       can continue doing color copies and you will only be able to block them when the user next
*       logs in.
*/
function deviceLoginHook(inputs, actions) {

    var MAX_COLOR_COPY_PAGES_PER_DAY = 20;

    var currentColorCount = inputs.user.getNumberProperty("color-copy-per-day");
    var dayLastSeen = inputs.user.getProperty("color-copy-day-last-seen");
    var date = new Date();
    var currentDayIndex = date.getDay();
    // Reset color copy counter if:
    //    i) Color copy count doesn't exist for user, or
    //    ii) We don't have a day the last color copy job was performed, or
    //    iii) It's a new day
    if (currentColorCount == null || dayLastSeen == null || dayLastSeen != currentDayIndex) {
        currentColorCount = 0;
        actions.user.onCompletionSaveProperty("color-copy-per-day", currentColorCount);
    }

    if (currentColorCount >= MAX_COLOR_COPY_PAGES_PER_DAY) {
        actions.log.info("Denying color copy access for user " + inputs.user.username + " as daily color limit has been reached");
        actions.login.denyColorCopyAccess();
    }

}


function deviceJobLogHook(inputs, actions) {
    if (inputs.job.isCopy && inputs.job.isColor) {
        // read in number of color pages for copy job and save
        actions.user.onCompletionIncrementNumberProperty("color-copy-per-day", inputs.job.totalColorPages);

        // update color copy day to today.
        var date = new Date();
        actions.user.onCompletionSaveProperty("color-copy-day-last-seen", date.getDay());
    }
}


/*
* Use the cost model of another device to calculate the cost of a job.
*
* Example: There's a copier in the staff room ("device\staff_room_copier")
*          that has a different cost model as it's just for staff use only.
*          The staff copier has free B&W copying and half price on color copying.
*          Using this script, you can apply that cost model to other copiers
*          so that staff members get free B&W copying regardless of which copier
*          they are using.
*
* It's important to note that this is a *post-job* cost adjustment. This means that
* although a user may have enough money for the job using this cheaper cost model,
* they may still be denied doing the job due to zero stop using the old cost model.
*/
function deviceJobLogHook(inputs, actions) {

    var STAFF_GROUP = "Staff";
    var STAFF_DEVICE = "staff_room_copier";

    // only change cost model if the user is a staff member
    if (inputs.user.isInGroup(STAFF_GROUP)) {
        // calculate the cost of the job had it been done on the 'staff_room_copier' device
        var updatedCost = inputs.job.calculateCostForDevice(STAFF_DEVICE);

        // change the cost to the newly calculated figure
        actions.job.setCost(updatedCost);
        actions.job.addComment("Cost adjustment applied for staff member");
    }
}
/*
* This recipe highlights how the print release hook complements
* the "Change print settings at the device" feature to provide
* an even more customised experience at the MFD.
*
* Example:  We'll be enforcing two different policies at the device.
*           The assumption for this scenario is that
*           "change-print-job-settings" is enabled.
*
*           The first:
*           Faculty members have no restrictions on how many copies
*           they can print but students are restricted to no more than
*           3 copies per print job. Enforce a policy to block students from
*           releasing more than 3 copies of a single held print job. A
*           message will be displayed on the screen prompting the user
*           to reduce the number of copies.
*
*           The second:
*           The science department are environmentally conscious
*           and want to enforce duplex printing for print
*           jobs of a certain length (greater than 20 pages). By
*           enforcing this policy, if users want to charge to the
*           "Science" account, they will need to change the job
*           to duplex printing (or alternatively select another
*           account).
*
*
*
* Remember this hook should only be used when other release interfaces
* are not enabled (i.e. mobile release, web user interface) otherwise
* users will be able to bypass this hook.
*/
function devicePrintReleaseHook(inputs, actions) {

    if (inputs.user.isInGroup("Students") && inputs.heldJob.copies > 3) {
        actions.heldJob.blockRelease("No more than three copies per print job are permitted. " +
            "Reduce the number of copies and try again");
        return;
    }

    if (inputs.heldJob.selectedSharedAccountName == "Science"
        && inputs.heldJob.isSimplex
        && inputs.heldJob.totalPages > 20) {
        actions.heldJob.blockRelease("Restrictions have prevented this job from being released. " +
            "Change to duplex mode and try again.");
        return;
    }

}
if (inputs.heldJob.isDuplex) {
    var newCost = inputs.job.cost * 0.015;
}



// 20% volume discount for jobs with more than 100 pages
if (inputs.job.totalPages > 100) {
    var newCost = inputs.job.cost * 0.8;
    actions.job.setCost(newCost);
    actions.job.addComment('20% volume discount applied');
    actions.log.debug('Applied 20% volume discount to job from user "' +
        inputs.user.username + '."');
}


function deviceLoginHook(inputs, actions) {
    var MAX_SHEETS_PER_MONTH = 0; // change this to the montly sheet limit and in deviceJobLogHook below
    var teachersGRP = "INSERT GROUP NAME HERE"; // change this var in deviceJobLogHook below.
    var sped = "SpedTeachers";
    var name = inputs.user.fullName;
    var userName = inputs.user.username;
    var email = inputs.user.email;
    var heldPages = inputs.heldJob.totalPages;
    var heldCopies = inputs.heldJob.copies;
    var heldDuplex = inputs.heldJob.isDuplex;
    var heldDocument = inputs.heldJob.documentName;
    var device = inputs.device.deviceName;
    var currentMonthlyCount = inputs.user.getNumberProperty("per-month");
    var monthLastSeen = inputs.user.getProperty("month-last-seen");
    var date = new Date();
    var currentMonthIndex = date.getMonth();
    var jobSheets = (Math.ceil(Math.ceil(pages / copies) / 2) * copies);
    var overSheetCount = (jobSheets + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;
    var overSheetCountSimplex = (pages + currentMonthlyCount) - MAX_SHEETS_PER_MONTH;
    var newCost = inputs.jo

    if (currentMonthlyCount == null || monthLastSeen == null || monthLastSeen != currentMonthIndex) {
        currentMonthlyCount = 0;
        actions.user.onCompletionSaveProperty("per-month", currentMonthlyCount);
    }
}

function devicePrintReleaseHook(inputs, actions) {

    if (inputs.user.isInGroup(teachersGRP)
        && !inputs.user.isInGroup(sped)
        && inputs.heldJob.isDuplex
        && (jobSheets + currentMonthlyCount) >= MAX_SHEETS_PER_MONTH) {
        actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by "
            + overSheetCount + ".  This job cannot be released.");
        return;
    } else if (inputs.user.isInGroup(teachersGRP)
        && !inputs.user.isInGroup(sped)
        && inputs.heldJob.isSimplex
        && (pages + currentMonthlyCount) >= MAX_SHEETS_PER_MONTH) {
        actions.heldJob.blockRelease("The release of " + document + " will exceed your monthly paper allotment by "
            + overSheetCountSimplex + ".  This job cannot be released.");
    } else {
        actions.log.info("No actions were taken. The User, " + userName + ", is not a member of " + teachersGRP + " or is in the " + sped + "group.");
        return;
    }
}

function deviceJobLogHook(inputs, actions) {
    
    if (heldDuplex) {

    }
}

