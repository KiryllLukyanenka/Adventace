@isTest
private class SMS2_createActionPlan_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_createActionPlan
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////
    
    static testMethod void SMS2_createActionPlan_unitTest() {
        
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
        
        ADVSMS__Sales_Call_Analysis__c newSCA = new ADVSMS__Sales_Call_Analysis__c();
        newSCA.Name = 'New SCA';
        newSCA.Opportunity__c = newOpp.id;
        newSCA.Impacted_Job_Title__c = newIJT.Id;
        insert newSCA;

        ADVSMS__Opportunity_Qualifiers__c newOQ = new ADVSMS__Opportunity_Qualifiers__c();
        newOQ.ADVSMS__Sales_Call_Analysis__c = newSCA.Id;
        insert newOQ;
 
        Action_Plan__c newAPc = new Action_Plan__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(newAPc);
            
        ApexPages.currentPage().getParameters().put('sid', newSCA.id);
     
        SMS2_createActionPlan controller = new SMS2_createActionPlan(sc);
               
        controller.createActionPlan();
        
        controller.cancel2();
        
    }
}