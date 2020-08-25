/*
* Daily color page limit
*  
* Sometimes, a high price tag just isn't enough to discourage users from
* printing in color. This recipe imposes a fixed limit on the number of color
* pages a user can print per day.
*
* Imposing a color page quota is a better solution than separate balances for
* color and black & white.  Separate balances are more confusing (two accounts
* to manage) and also can lead to waste.  The user may for example run out of
* black and white credit, and therefore be forced to print in color wasting
* resources.  This method (an overlayed color quota) solves these issues.
*/
function printJobHook(inputs, actions) {

  // Modify this value to change the daily color page limit.  
  var MAX_COLOR_PAGES_PER_DAY = 5;
  var user = inputs.job.username;

  if (!inputs.job.isAnalysisComplete) {
    return;
  }
  if (!inputs.job.isColor) {
    // Not color so no need to check and apply any limits.
    actions.utils.sendEmail(user, "Script Testing 1", "Is Color")
    return;
  }

  var currentColorCount = inputs.user.getNumberProperty("color-per-day");
  if (currentColorCount == null) currentColorCount = 0;
  actions.utils.sendEmail(user, "Script Testing 2", currentColorCount)
  var currentDayIndex = inputs.job.date.toDateString();
  var dayLastSeen = inputs.user.getProperty("color-day-last-seen");
  if (dayLastSeen == null || dayLastSeen != currentDayIndex) {
    // It's a new day. Reset the current count value to zero.
    currentColorCount = 0;
    actions.utils.sendEmail(user, "Script Testing 3", currentColorCount)
  }

  currentColorCount += inputs.job.totalColorPages;
  if (currentColorCount > MAX_COLOR_PAGES_PER_DAY) {
    var deniedMessage = "This print job has been denied.  You have exceeded"
      + " your daily limit of " + MAX_COLOR_PAGES_PER_DAY
      + " color pages per day. Please print in grayscale.";

    actions.client.sendMessage(deniedMessage);
    actions.utils.sendEmail(user, "Script Testing 4", currentColorCount + deniedMessage)
    actions.job.cancelAndLog("This job was denied because you have exceeded"
      + " the daily color quota.");

    return;
  }

  // If we're here, then it's OK for the job to proceed.

  // Save the current daily count  
  actions.user.onCompletionSaveProperty("color-day-last-seen", currentDayIndex);
  // Note: Set is used for simplicity (see "Rate limit by department"
  // for use of increment).
  actions.user.onCompletionSaveProperty("color-per-day", currentColorCount);
}