public with sharing class TaskHTMLEmailController {
    private final Task TaskObj;

    public String firstHTMLEmail { get 
        {return getFirstHTMLEmail(); }
    }
    
    public TaskHTMLEmailController(ApexPages.StandardController stdController) {
        this.TaskObj = (Task)stdController.getRecord();
    }

    public String getFirstHTMLEmail() {
        EmailMessage firstEmail;
        for(EmailMessage oEM: [SELECT HtmlBody
                                                ,TextBody
                                        FROM EmailMessage 
                                        WHERE ActivityId=:TaskObj.Id 
                                        ORDER BY MessageDate DESC
                               LIMIT 1]) { 
            firstEmail=oEM;
        }
        if (firstEmail!=null) {
            if(firstEmail.HtmlBody != '' && firstEmail.HtmlBody != null){
                return firstEmail.HtmlBody;
            }
            else{
                return firstEmail.TextBody;
            }
        }
        return '';
    }
    

}