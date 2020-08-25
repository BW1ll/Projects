/*
* Print Policy Enforcement (warnings & automatic conversion)
*
* Enforce a company/corporate print policy designed to reduce toner and save 
* paper by discouraging bad habits. By default the script:
*   - Discourages single-sided printing
*   - Discourages printing of emails in color
*   - Discourages printing of web pages in color
*   - Discourages printing of emails that have more than one page
*
* Users are given the option to convert their job to grayscale or duplex where
* appropriate, or to acknowledge that they understand and want to print anyway.
*
* The email and web page printing detection in this script is designed to work
* with Microsoft Outlook and Microsoft Internet Explorer.
* 
* NOTE: This script should only be used on devices that support attribute
* modification (converting to Grayscale and Duplex). If your printer does not
* support this (i.e. is not PostScript or PCL), consider using the companion
* script: Print Policy Enforcement (warnings)
*
* This is an advanced recipe and demonstrates:
*   - job attribute modification
*   - multi-input user dialogs
*   - recording comments
*   - sending messages to users
*/
function printJobHook(inputs, actions) {
  
  /*
  * Edit the settings below according to your policy and environment.
  */
  var DISCOURAGE_SIMPLEX_PRINTING = true;
  var DISCOURAGE_COLOR_WEB_PAGE_PRINTING = true;
  var DISCOURAGE_COLOR_EMAIL_PRINTING = true;
  var DISCOURAGE_EMAIL_PRINTING = true;
  var EMAIL_PAGE_LIMIT = 1;
  
  // Show warning only if printing more than X pages.
  var SIMPLEX_WARNING_PAGE_LIMIT = 1;
  
  // Title tag used by the web browser
  var WEB_APPLICATION_TITLE = 'http://';
  var WEB_APPLICATION_TITLE2 = 'https://';
  
  // Title tag used by the email application
  var EMAIL_APPLICATION_TITLES = [
    'Microsoft Outlook',
    'Microsoft Office Outlook',
    'outbind://'
  ];
  
  /*
  * This print hook will need access to all job details
  * so return if full job analysis is not yet complete.
  * The only job details that are available before analysis
  * are metadata such as username, printer name, and date.
  *
  * See reference documentation for full explanation.
  */
  if (!inputs.job.isAnalysisComplete) {
    // No job details yet so return.
    return;
  }
  
  var message;
  var response;
  var showThankYou;
  
  /*
  * Discourage users from printing web pages in color.
  */
  
  
  // These messages will appear in the App. Log
  
  // actions.log.error("Job color:"+inputs.job.documentName);
  
  var LIMIT = 200;  // Show message for jobs over 500 pages.
  
  /*
  * This print hook will need access to all job details
  * so return if full job analysis is not yet complete.
  * The only job details that are available before analysis
  * are metadata such as username, printer name, and date.
  *
  * See reference documentation for full explanation.
  */
  
  if (inputs.job.totalPages > LIMIT) {
    /*
    * Job is larger than our page limit, so ask the user to confirm via
    * red warning message so we grab their attention.
    */
    var message = "<html><span style='font-size: 1.5em; color:red'>"
        + "This print job is over " + LIMIT + " pages. Please confirm the job."
        + "</span></html>";
    var response = actions.client.promptPrintCancel(message);
    if (response  == "CANCEL" || response  == "TIMEOUT") {
      // Cancel the job and exit the script.
      actions.job.cancel();
      return;
    }
    
    // User pressed OK, so allow it to print - simply return taking no action.
  }
  
  if (DISCOURAGE_COLOR_WEB_PAGE_PRINTING
      && inputs.job.isColor
     ) {
       
       htmlForm = "<html>"
         + "<div style='width:400px; padding: 10px; color:#6F6F6F; "
         + "    background: url(http://%PC_SERVER%/scripting/print/recipes/images/treebg.png) no-repeat;'>"
         + "  <div style='padding: 10px; font-weight: bold; font-size: 20px; text-align: center;'>"
         + "    Print Policy Alert<br>"
         + "    <img src='http://%PC_SERVER%/images/icons3/24x24/warning.png'>"
         + "  </div>"
         + "  <div style='font-size: 14px; font-weight: bold; text-align: center;'>"
         + "  <p>The current cost of this print job is $" + inputs.job.cost + "</p>"
         + "    Please help us save toner!"
         + "  </div>"
         + "  <br><br>"
         + "  <div style='font-size: 12px;'>"
         + "   Printing web pages in color costs much more than black and white"
         + "   and is not consistent with company printing policy.<br><br>"
         + "   Would you like to <b>convert this job to grayscale</b>?"
         + "  </div>"
         + "</div><br>"
         + "<div align='center'>"
         + "  <table><tr><th align='right'>Action:</th><td>"
         + "    <select name='action'>"
         + "      <option value='convert' selected>Convert to Grayscale</option>"
         + "      <option value='dont-convert'>I understand, but this job is important</option>"
         + "    </select>"
         + "    </td></tr><tr><th align='left' style='vertical-align: middle;'>Reason for using color: </th>"
         + "    <td><input type='text' size='40' name='reasonForPrinting'></td></tr>"
         + "  </table>"
         + "</div>"
         + "</html>";
       
       // Display the message with custom dialog title and description (options).
       response = actions.client.promptForForm(htmlForm,
                                               {
                                                 'dialogTitle': 'Print Information',
                                                 'dialogDesc': inputs.job.documentName,
                                                 'hideJobDetails': true,
                                                 'fastResponse': true
                                               }
                                              );
       actions.log.error("Job color:"+response["action"]);   
       
       if (response["action"] == "convert") {
         actions.job.convertToGrayscale();
         showThankYou = true;
         actions.log.info("The printing policy rules saved "
                          + inputs.utils.formatNumber(inputs.job.totalPages, 0)
                          + " color pages."
                         );
       } else if (response["action"] == "dont-convert") {
         actions.client.sendMessage("Please consider grayscale printing for your next job.");
         var comment = 'Color reason: ' + response["reasonForPrinting"] + "<br />";
         actions.job.addComment(comment);
       } else if (response == "CANCEL" || response == "TIMEOUT") {
         actions.job.cancel();
         // don't display any more dialogs
         return;
       } 
     }
  
  
  /*
  * Discourage users from printing emails in color.
  */
  if (DISCOURAGE_COLOR_EMAIL_PRINTING
      && inputs.job.isColor
      && matchesAny(inputs.job.documentName, EMAIL_APPLICATION_TITLES)) {
        
        htmlForm = "<html>"
          + "<div style='width:400px; padding: 10px; color:#6F6F6F; "
          + "    background: url(http://%PC_SERVER%/scripting/print/recipes/images/treebg.png) no-repeat;'>"
          + "  <div style='padding: 10px; font-weight: bold; font-size: 20px; text-align: center;'>"
          + "    Printing Policy Alert<br>"
          + "    <img src='http://%PC_SERVER%/images/icons3/24x24/warning.png'>"
          + "  </div>"
          + "  <div style='font-size: 14px; font-weight: bold; text-align: center;'>"
          + "    Please don't print emails in color!"
          + "  </div>"
          + "  <br><br>"
          + "  <div style='font-size: 12px;'>"
          + "   Printing emails in color costs much more than black and white"
          + "   and is not consistent with company printing policy.<br><br>"
          + "   Would you like to <b>convert this job to grayscale</b>?"
          + "  </div>"
          + "</div><br>"
          + " <div align='center'>"
          + " <table><tr><th align='left'>Action: </th>"
          + "  <td><select name='action'>"
          + "    <option value='convert' selected>Convert to Grayscale</option>"
          + "    <option value='dont-convert'>I understand, but this job is important</option>"
          + "  </select></td></tr>"
          + " <tr><th align='left' style='vertical-align: middle;'>Reason for using color: </th>"
          + " <td><input type='text' size='40' name='reasonForPrinting'></td></tr></table>"
          + "</div>"
          + "</html>";
        
        // Display the message with custom dialog title and description (options).
        response = actions.client.promptForForm(
          htmlForm,
          {
            'dialogTitle': 'Print Information',
            'dialogDesc': inputs.job.documentName,
            'hideJobDetails': true,
            'fastResponse': true
          }
        );
        
        if (response["action"] == "convert") {
          actions.job.convertToGrayscale();
          showThankYou = true;
          actions.log.info("The printing policy rules saved "
                           + inputs.utils.formatNumber(inputs.job.totalPages, 0)
                           + " color pages."
                          );
        } else if (response["action"] == "dont-convert") {
          actions.client.sendMessage("Please consider grayscale printing for your next job.");
          var comment = 'Color reason: ' + response["reasonForPrinting"] + "<br />";
          actions.job.addComment(comment);
        } else if (response == "CANCEL" || response == "TIMEOUT") {
          actions.job.cancel();
          // don't display any more dialogs
          return;
        }
      }
  
  /*
  * Discourage users from printing more than one page of an email.
  */
  if (DISCOURAGE_EMAIL_PRINTING && matchesAny(inputs.job.documentName, EMAIL_APPLICATION_TITLES)
      && inputs.job.totalPages > EMAIL_PAGE_LIMIT) {
        
        htmlForm = "<html>"
          + "<div style='width:400px; padding: 10px; color:#6F6F6F; "
          + "    background: url(http://%PC_SERVER%/scripting/print/recipes/images/treebg.png) no-repeat;'>"
          + "  <div style='padding: 10px; font-weight: bold; font-size: 20px; text-align: center;'>"
          + "    Printing Policy Alert<br>"
          + "    <img src='http://%PC_SERVER%/images/icons3/24x24/warning.png'>"
          + "  </div>"
          + "  <div style='font-size: 14px; font-weight: bold; text-align: center;'>"
          + "    Please don't print multi-page emails!"
          + "  </div>"
          + "  <br><br>"
          + "  <div style='font-size: 12px;'>"
          + "   Printing emails is discouraged under the printing policy. " 
          + "  If you must print an email please restrict it to one page.<br/><br/>"
          + "   Would you like to <b>cancel this print job</b>?"          
          + "  </div>"
          + "</div><br>"
          + " <div align='center'>"
          + " <table><tr><th align='left'>Action: </th>"
          + "  <td><select name='action'>"
          + "    <option value='cancel' selected>Cancel this print job.</option>"
          + "    <option value='dont-cancel'>I understand, but this job is important</option>"
          + "  </select></td></tr>"
          + "  </table>"
          + "</div>"
          + "</html>";
        
        // Display the message with custom dialog title and description (options).
        response = actions.client.promptForForm(
          htmlForm,
          {
            'dialogTitle': 'Print Information',
            'dialogDesc': inputs.job.documentName,
            'hideJobDetails': true,
            'fastResponse': true
          }
        );
        
        if (response["action"] == "dont-cancel") {
          actions.client.sendMessage("Please consider printing only one page of your email for your next job.");
        } else if (response["action"] == "cancel" || response == "CANCEL" || response == "TIMEOUT") {
          actions.job.cancel();
        }
      }
  
  
  /*
  * Discourage users from printing too many pages in simplex.
  */
  if (DISCOURAGE_SIMPLEX_PRINTING  
      && inputs.job.totalPages > SIMPLEX_WARNING_PAGE_LIMIT
      && !inputs.job.isDuplex) {
        
        htmlForm = "<html>"
          + "<div style='width:400px; padding: 10px; color:#6F6F6F; "
          + "    background: url(http://%PC_SERVER%/scripting/print/recipes/images/treebg.png) no-repeat;'>"
          + "  <div style='padding: 10px; font-weight: bold; font-size: 20px; text-align: center;'>"
          + "    Printing Policy Alert<br>"
          + "    <img src='http://%PC_SERVER%/images/icons3/24x24/warning.png'>"
          + "  </div>"
          + "  <div style='font-size: 14px; font-weight: bold; text-align: center;'>"
          + "    Please use double-sided printing!"
          + "  </div>"
          + "  <br><br>"
          + "  <div style='font-size: 12px;'>"
          + "   Did you know that this job will produce "
          +       inputs.utils.formatNumber(inputs.job.environmentGramsCO2, 0)
          + "   grams of CO<sub>2</sub> equiv.? This is equivalent to leaving a 60W bulb on for <b>"
          +       inputs.utils.formatNumber(inputs.job.environmentBulbHours, 1)
          + "   hours</b>!<br><br>"
          + "   You could halve this impact by printing double-sided."
          + "   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='http://%PC_SERVER%/images/icons3/32x32/tree.png'>"
          + "   <br><br>"
          + "   Would you like to <b>convert this job to duplex</b>?"
          + "  </div>"
          + "</div><br>"
          + "<div align='center'>"
          + " <table><tr><th align='left'>Action: </th>"
          + "  <td><select name='action'>"
          + "    <option value='convert' selected>Convert to Duplex</option>"
          + "    <option value='dont-convert'>I understand, but this job is important</option>"
          + "  </select></td></tr>"
          + " <tr><th align='left' style='vertical-align: middle;'>Reason for not using duplex: </th>"
          + " <td><input type='text' size='40' name='reasonForPrinting'></td></tr></table>"
          + "</div>"
          + "</html>";
        
        // Display the message with custom dialog title and description (options).
        response = actions.client.promptForForm(
          htmlForm,
          {
            'dialogTitle': 'Print Information',
            'dialogDesc': inputs.job.documentName,
            'hideJobDetails': true
          }
        );
        
        if (response["action"] == "convert") {
          actions.job.convertToDuplex();
          showThankYou = true;
          actions.log.info("The printing policy rules saved "
                           + inputs.utils.formatNumber(inputs.job.environmentGramsCO2 / 2, 0)
                           + "grams of CO2.");
        } else if (response["action"] == "dont-convert") {
          actions.client.sendMessage("Please consider double-sided printing for your next job.");
          var comment = 'Duplex reason: ' + response["reasonForPrinting"] + '<br />';
          actions.job.addComment(comment);
        } else if (response == "CANCEL" || response == "TIMEOUT") {
          actions.job.cancel();
          // don't display any more dialogs
          return;
        }
      }
  
  
  if (!inputs.job.isAnalysisComplete) {
    // Full job details are not yet available. Return and wait to be called again.
    return;
  }
  
  // Perform tasks here that rely on the full job details being available.
  
  var newCost = inputs.job.cost; //inputs.job.calculateCostForPrinter(inputs.job.printerName).toPrecision(2);
  htmlForm = "<html>"
    + "<div style='width:400px; padding: 10px; color:#6F6F6F; "
    + "    background: url(http://%PC_SERVER%/scripting/print/recipes/images/treebg.png) no-repeat;'>"
    + "  <div style='padding: 10px; font-weight: bold; font-size: 20px; text-align: center;'>"
    + "    Printing Policy Alert<br>"
    + "    <img src='http://%PC_SERVER%/images/icons3/24x24/warning.png'>"
    + "  </div>"
    + "  <div style='font-size: 14px; font-weight: bold; text-align: center;'>"
    + "    The New Cost of your Print Job is $" + newCost
    + "  </div>"
    + "</html>";
  
  // Display the message with custom dialog title and description (options).
  response = actions.client.promptForForm(
    htmlForm,
    {
      'dialogTitle': 'Print Information',
      'dialogDesc': inputs.job.documentName,
      'hideJobDetails': true
    }
  );
  if (showThankYou) {
    actions.client.sendMessage("Thanks for considering your print action!");
  }
}

function matchesAny(str, matchStrs, actions) {
  if (str == null || matchStrs == null) {
    return false;
  }
  
  for (var i in matchStrs) {
    if (str.match(matchStrs[i])) {
      return true;
    }
  }
  
  return false;
}

