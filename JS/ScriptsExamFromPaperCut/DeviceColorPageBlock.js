/*
* Set a daily color copy limit and block color copy access once this limit has been reached.
*
* Note: Test before use as not all devices will support this feature.
*       It's also important to note that color copy access can only be blocked *on login*
*       Therefore this recipe comes with disclaimer that once a user has been logged in, they
*       can continue doing color copies and you will only be able to block them when the user next
*       logs in.
*/
// eslint-disable-next-line no-unused-vars
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
  
  
  // eslint-disable-next-line no-unused-vars
  function deviceJobLogHook(inputs, actions) {
    if (inputs.job.isCopy && inputs.job.isColor) {
      // read in number of color pages for copy job and save
      actions.user.onCompletionIncrementNumberProperty("color-copy-per-day", inputs.job.totalColorPages);
      
      // update color copy day to today.
      var date = new Date();
      actions.user.onCompletionSaveProperty("color-copy-day-last-seen", date.getDay());
    }
  }