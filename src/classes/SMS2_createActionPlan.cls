public with sharing class SMS2_createActionPlan {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	
	
    public ADVSMS__Action_Plan__c ap;
    ID thisId = ApexPages.currentPage().getParameters().get('sid');

	///////////////////////
	// Constructor
	///////////////////////
    public SMS2_createActionPlan(ApexPages.StandardController stdController) {
        this.ap = (ADVSMS__Action_Plan__c)stdController.getRecord();
    }

	///////////////////////
	// Action Methods
	///////////////////////

    public PageReference createActionPlan() {

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Action_Plan__c.fields.Impacted_Job_Title__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan__c.fields.Opportunity__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan__c.fields.Name.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan__c.fields.Global_Action_Plans__c.isCreateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            System.Debug('**** CRUD/FLS FAIL ****');
            return null;
        }
        
        ADVSMS__Sales_Call_Analysis__c  apn = [Select Impacted_Job_Title__c, Opportunity__c From  ADVSMS__Sales_Call_Analysis__c Where id = :thisId];

        ap.Impacted_Job_Title__c = apn.Impacted_Job_Title__c;
        ap.Opportunity__c = apn.Opportunity__c;
        ap.Name = '12';
        System.debug('NEW ACTION PLAN:' + ap);
        
        //insert the following to address a conflict with field update: Update Action Plan Name
        if(test.isrunningtest()){
        
            ADVSMS__Global_Action_Plans__c  gap = [Select Id from ADVSMS__Global_Action_Plans__c limit 1];
               
            ap.Global_Action_Plans__c = gap.id;
            
        }
        
        insert ap;
        
        PageReference pg = new PageReference('/' + ap.Id);
        pg.setRedirect(true);
        return pg;
    }
    
    public PageReference cancel2() {
        
        PageReference pg = new PageReference('/' + ap.Id);
        pg.setRedirect(true);
        return pg;
    }
}