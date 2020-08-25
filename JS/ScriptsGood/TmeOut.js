/*
* Alter Job Timeout for a group of users
*
* The default timeout for all jobs is defined in "Options >> General >> Hold/Release Queues >> Delete held jobs if not released after:". *
* This script will adjust this timeout for members of a given group, setting a new timeout value (in minutes) for these jobs.
*/
function printJobHook(inputs, actions) {
  
  /*
  * Edit the settings below according to your policy and environment.
  */
  var GROUP_FOR_NEW_TIMEOUT = "IT";
  var NEW_TIMEOUT_IN_MINUTES = 5760;
  
  //Test to see if the user printing is a member of this group
  if(inputs.user.isInGroup(GROUP_FOR_NEW_TIMEOUT))
  {
    //This user is a member of the defined group. Adjust the timeout of this job.
    actions.job.setHoldReleaseTimeout(NEW_TIMEOUT_IN_MINUTES);
  }
}
