//
// Use Device Scripting to implement copy, scan, and fax policies at the MFD.  
// You don't have to be a programmer as there are many pre-written recipes available for you to use. 
// But if you're confident, you can write your own scripts in JavasScript using snippets 
// and the reference documentation.
// To implement Printing policies, try out our Print Scripting. 
//
function deviceLoginHook(inputs, actions) {
    // your script here

    // Deny device login to students before 8am or after 6pm.
    var date = new Date();
    var hours = date.getHours();

    if (inputs.user.isInGroup("Students") && (hours < 8 || hours >= 18)) {
        actions.login.denyLoginAccess();
    }


    // block a user from releasing a held job
    // and provide a custom message as to why the job was denied
    actions.heldJob.blockRelease("Held job(s) denied due to release restrictions. Modify your job and try again.");



    // Sets a global property.
    // NOTE: This operation is not performed until the device hook
    // has finished running.
    actions.utils.onCompletionSaveProperty("my-property-name", "My Value");



    // Sets a user property.
    // NOTE: This operation is not performed until the device hook
    // has finished running.
    actions.user.onCompletionSaveProperty("my-property-name", "My Value");

    // 20% volume discount for jobs with more than 100 pages
    if (inputs.job.totalPages > 100) {
        var newCost = inputs.job.cost * 0.8;
        actions.job.setCost(newCost);
        actions.job.addComment('20% volume discount applied');
        actions.log.debug('Applied 20% volume discount to job from user "' 
        + inputs.user.username + '."');
    }
}