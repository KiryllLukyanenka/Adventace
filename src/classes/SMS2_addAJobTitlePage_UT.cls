@isTest
private class SMS2_addAJobTitlePage_UT {
	
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_addAJobTitlePage
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////

    static testMethod void SMS2_addAJobTitlePage_unitTest() {
        
        ADVSMS__Job_Title__c newGlobalIJT = new Job_Title__c();
        newGlobalIJT.name = 'Global Impacted Job Title';
        insert newGlobalIJT;
            
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity 1';
        newOpp.AccountId = newAccount.Id;
        newOpp.StageName = '(A) Power Promoter';
        newOpp.CloseDate = System.Today();
        newOpp.ADVSMS__NOC_Date__c = System.Today();
        newOpp.amount = 100;
        insert newOpp;
        
        ADVSMS__Impacted_Job_Title__c newIJT = new ADVSMS__Impacted_Job_Title__c();
        newIJT.Name = 'New Impacted Job Title';
        newIJT.Opportunity__c = newOpp.id;
        insert newIJT;
        
        ADVSMS__Job_Title__c newJT = new ADVSMS__Job_Title__c();
        ADVSMS__Job_Title__c newJT2 = new ADVSMS__Job_Title__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(newJT);
        ApexPages.StandardController sc2 = new ApexPages.StandardController(newJT2);
            
        ApexPages.currentPage().getParameters().put('opp', newOpp.id);
    
        SMS2_addAJobTitlePage controller = new SMS2_addAJobTitlePage(sc);
        SMS2_addAJobTitlePage controller2 = new SMS2_addAJobTitlePage(sc2);
        
        controller.getparentId();
        
        controller.save2();
        controller.jt.Name = 'Test';
        controller.parentId = newIJT.id; 
        
        controller.save2();
        controller.parentId = '999';
        
        controller2.save2();
        controller2.jt.Name = 'Test';
        controller2.parentId = newIJT.id;
        
        controller2.cancel2();
        controller2.parentId = null;
                        
    } 
}