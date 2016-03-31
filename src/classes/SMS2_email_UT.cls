@isTest
private class SMS2_email_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_email
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////

    static testMethod void SMS2_email_unitTest() {
    
        ADVSMS__Global_Action_Plans__c newGAP = new ADVSMS__Global_Action_Plans__c();
        newGAP.Name = 'Test GAP';
        insert newGAP;
        
        ADVSMS__Global_Action_Plan_Steps__c newGAPS = new ADVSMS__Global_Action_Plan_Steps__c();
        newGAPS.Global_Action_Plans__c = newGAP.Id;
        insert newGAPS; 
       
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity 1';
        newOpp.AccountId = newAccount.Id;
        newOpp.StageName = '(A) Power Promoter';
        newOpp.CloseDate = System.Today();
        newOpp.ADVSMS__NOC_Date__c = System.Today();
        newOpp.Amount = 100;
        insert newOpp;       
       
        ADVSMS__Job_Title__c newJT = new ADVSMS__Job_Title__c();
        newJT.Name = 'New Job Title';
        insert newJT;
        
        ADVSMS__Critical_Business_Issue__c newCBI = new ADVSMS__Critical_Business_Issue__c();
        newCBI.Name = 'New CBI';
        newCBI.Job_Title__c = newJT.Id;
        insert newCBI;
        
        ADVSMS__Impacted_Job_Title__c newIJT = new ADVSMS__Impacted_Job_Title__c();
        newIJT.Name = 'New Impacted Job Title';
        newIJT.Opportunity__c = newOpp.id;
        newIJT.Critical_Business_Issue__c = newCBI.Id;
        newIJT.Sales_Call_Status__c = 'In Progress';
        insert newIJT;
        
        newIJT.Type_of_buyer__c = 'Power Promoter';
        update newIJT;
        
        ADVSMS__Action_Plan__c newAP = new ADVSMS__Action_Plan__c();
        newAP.Name = 'Test AP';
        newAP.Global_Action_Plans__c = newGAP.Id;
        newAP.Impacted_Job_Title__c = newIJT.Id;
        newAP.Opportunity__c = newOpp.Id;
        //newAP.Start_date_of_plan__c = date.today();
        newAP.Action_Plan_Mapped__c = false;
        insert newAP;
        
        List<ADVSMS__Action_Plan_Step__c> lstAPSs = new List<ADVSMS__Action_Plan_Step__c>();        

        SMS2_email controller = new SMS2_email();
        controller = new SMS2_email();
        
        controller.impactedJobTitleId = newIJT.id;
        
        controller.getdt();
        controller.getPowerPromoter();
        controller.getimpactedJobTitle();
        controller.getApStep();
        controller.getOQ();
        controller.getNameOfSender();
        controller.gettableData();   
        
        // Test Helper Classes 
        
        SMS2_email.tableRollUp hClsTableRollUp = new SMS2_email.tableRollUp(lstAPSs);
        hClsTableRollUp.getTableRoll();
        
        SMS2_email.tableRollUpTwo hClsTableRollUpTwo = new SMS2_email.tableRollUpTwo('test', lstAPSs);
        hClsTableRollUpTwo.getSteps();
        hClsTableRollUpTwo.getObjective();
        hClsTableRollUpTwo.getobjCount();
        
    
    }
}