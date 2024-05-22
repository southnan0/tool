const path = require('path');
var Freemarker = require('freemarker.js');
const fs = require('fs')

var fm = new Freemarker({
  viewRoot: path.resolve(__dirname, './template'),
  options: {
    /** for fmpp */
  }
});

const dataObject = {
  "emailText":"Following workflow is pending for your review.",
  "warnTips":  "For further action or details on this workflow, please click More to enter OA - Workflow page.  ",
  "style":  {
            "emailBaseInfoColumnLabel":  "box-sizing:border-box;vertical-align:top;border-top-width:1px;border-top-color:#f4f4f4;border-top-style:solid;margin:0;padding:5px 0;min-width:130px",
            "emailTitle":  "padding:50px 10px 50px 10px;font-size:32px;color:#000;line-height:1.2em;font-weight:600",
            "contentMaxWidth":  "700px",
            "colorGray":  "#7a8499",
            "emailBaseInfoColumnValue":  "box-sizing:border-box;vertical-align:top;border-top-width:1px;border-top-color:#f4f4f4;border-top-style:solid;margin:0;padding:5px 0 0 10px;min-width:130px",
            "emailStepDetail":  "word-break:break-all;box-sizing: border-box;padding: 8px 16px 16px;",
            "emailTdP":  "margin: 4px 0;font-size: 12px;",
            "emailWrapper":  "box-sizing:border-box;min-width: 600px;max-width:700px;max-width: min(700px, 100%);height:100%;font-size:14px;line-height:1.6em;background-color:#fff;margin:0 auto;",
            "emailStepColumn":  "font-weight:500;vertical-align: top;line-height: 18px;"
  },
  "flowDescription":  "Employee Expense Reimbursement Application Process[New](test)",
  "entity":  {},
  "fieldDefinition":  {},
  "date":  "Nov 20, 2023",
  "href":  "",
  "subject":  "Request【Employee Expense Reimbursement Application Process[New](test)】is pending for your review",
  "workflowState":  {
            "backgroundColor":  "rgba(195, 133, 54, 0.1)",
            "color":  "rgba(195, 133, 54, 1)",
            "title":  "Following 【Employee Expense Reimbursement Application Process[New](test)】 is pending for your review.",
            "statusText":  "Pending for Approval",
            "header":  "Following workflow is pending for your review."
  },
  "operations":  [
            {
                      "href":  "https://accounts.google.com/o/oauth2/v2/auth?client_id=974997301548-oe72rd9m77q06ugd3kujmfmjfpmjtqha.apps.googleusercontent.com&redirect_uri=https://portal-test.skyoa.com/oauthcallback/google&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&state=%7B%22r_url%22%3A%22http%3A%2F%2Fgw.portal-test.skyoa.com%2Foauth%2Fauthorize%3Fclient_id%3D1260%26response_type%3Dcode%26client_type%3Dpc%26redirect_uri%3Dhttps%253A%252F%252Fwork-test1.skyoa.com%252F%26state%3D%252Fworkflow%252Fapprove%252Fe623b3ab3a234cddaad050281399351f%253FfromEmail%253Dy%22%7D",
                      "text":  "Approve"
            },
            {
                      "href":  "https://accounts.google.com/o/oauth2/v2/auth?client_id=974997301548-oe72rd9m77q06ugd3kujmfmjfpmjtqha.apps.googleusercontent.com&redirect_uri=https://portal-test.skyoa.com/oauthcallback/google&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&state=%7B%22r_url%22%3A%22http%3A%2F%2Fgw.portal-test.skyoa.com%2Foauth%2Fauthorize%3Fclient_id%3D1260%26response_type%3Dcode%26client_type%3Dpc%26redirect_uri%3Dhttps%253A%252F%252Fwork-test1.skyoa.com%252F%26state%3D%252Fworkflow%252Fapprove%252Fe623b3ab3a234cddaad050281399351f%253FfromEmail%253Dn%22%7D",
                      "text":  "Decline"
            },
            {
                      "href":  "https://accounts.google.com/o/oauth2/v2/auth?client_id=974997301548-oe72rd9m77q06ugd3kujmfmjfpmjtqha.apps.googleusercontent.com&redirect_uri=https://portal-test.skyoa.com/oauthcallback/google&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email&state=%7B%22r_url%22%3A%22http%3A%2F%2Fgw.portal-test.skyoa.com%2Foauth%2Fauthorize%3Fclient_id%3D1260%26response_type%3Dcode%26client_type%3Dpc%26redirect_uri%3Dhttps%253A%252F%252Fwork-test1.skyoa.com%252F%26state%3D%252Fworkflow%252Fapprove%252Fe623b3ab3a234cddaad050281399351f%253FfromEmail%253Dm%22%7D",
                      "text":  "More"
            }
  ]
}
// Single template file
fm.render('email.ftl', dataObject, function(err, html, output) {
  console.info(output)
    if(err){
        console.info(err)
    }else{
        fs.writeFileSync("output.html", html);
    }
});