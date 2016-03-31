global class SMS2_jobRefreshPipeline implements Database.Batchable<SObject> {
    
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// Batch routine to update all pipeline records
	// Created 20151211 EBG / Demand Chain Systems
	// support@demandchainsystems.com
	//////////////////////////////////    
    
    global String query;
    global List<SObject> glstJobRecords;
    
    //constructor
    global SMS2_jobRefreshPipeline() {

        //build the query to find all the owners of the pipelines we wish to updated
        String soqlStmt = 'Select  Id';
                    soqlStmt += ', Name ';
                    soqlStmt += ', User__c ';
                    soqlStmt += 'From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c '; 
        
        system.debug('soqlStmt: ' + soqlStmt + '\n');        
        query = soqlStmt;

    }
    
    
    ////////////////////////////////////////////////
    //base method that runs when the class is instantiated.  Its return value is sent to the "execute" routine
    ////////////////////////////////////////////////
    global Database.QueryLocator start(Database.BatchableContext BC) {
      system.debug('\n\n******Inside start.\n');
      system.debug('\n\n******Inside start.  query:\n' + query + '\n*********\n');
      
        return Database.getQueryLocator(query);
    }


    ////////////////////////////////////////////////
    // EXECUTE
    ////////////////////////////////////////////////
    global void execute(Database.BatchableContext BC, List<SObject> jobRecords) {

      system.debug('Inside execute.');
      //the results of the query are returned in a list of SObjects, so as we process each record we need to 
      //convert it to a hard typed variable
        glstJobRecords = jobRecords;
        
        //loop through the records to build a set of user ids and then update the pipelines
        Set<String> ownerIds = new Set<String>();
        for (SObject jr : glstJobRecords) {
         	ADVSMS__TACE_Pipeline_Balancing_Algorithm__c pipeline = (ADVSMS__TACE_Pipeline_Balancing_Algorithm__c)jr;
         	ownerIds.add((String)pipeline.get('User__c'));
        }
        system.debug('*** Inside execute.  Records: ' + jobRecords.size() + '  ownerIds: ' + ownerIds);
    
		ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers(ownerIds);
    }

    
    ////////////////////////////////////////////////
    // FINISH
    ////////////////////////////////////////////////
    global void finish(Database.BatchableContext BC){
        
        //get the email address of the current user
        String strAdminEmail = '';
        for (User u : [Select Id, Email From User Where Id = :UserInfo.getUserId()]) {
        	strAdminEmail = u.Email;
        }
        
        // Get the ID of the AsyncApexJob representing this batch job
        // from Database.BatchableContext.
        // Query the AsyncApexJob object to retrieve the current job's information.
        AsyncApexJob a = [Select Id
                                , CompletedDate
                                , Status
                                , ExtendedStatus
                                , JobType
                                , NumberOfErrors
                                , JobItemsProcessed
                                , TotalJobItems 
                            from AsyncApexJob 
                            where Id = :BC.getJobId()];
        
        // Send an email to the admin notifying of job failure.  To assist with code coverage, build the email but 
        //  only send if there is an error
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {strAdminEmail};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Error in Scheduled Routine : SMS2_jobRefreshPipeline');
        String strBody = 'The batch Apex job processed ' + a.TotalJobItems +' batches with '+ a.NumberOfErrors + ' failures.\n' +
                        '\nCompletedDate: ' + a.CompletedDate +
                        '\nStatus: ' + a.Status +
                        '\nExtendedStatus: ' + a.ExtendedStatus +
                        '\nJobType: ' + a.JobType +
                        '\nJobItemsProcessed: ' + a.JobItemsProcessed;
                            
            mail.setPlainTextBody(strBody);

        if (a.NumberOfErrors > 0) {
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
    

}