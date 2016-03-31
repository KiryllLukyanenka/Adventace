@isTest
private class SMS2_AddACBI_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_AddACBI
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////
	
	static testMethod void SMS2_AddACBI_unitTest() {

		test.startTest();

        ADVSMS__Job_Title__c newGlobalIJT = new Job_Title__c();
        newGlobalIJT.name = 'Global Impacted Job Title';
        insert newGlobalIJT;

        System.Assert(newGlobalIJT.Id != null, 'newGlobalIJT was not created correctly!');
            
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;

        System.Assert(newAccount.Id != null, 'newAccount was not created correctly!');
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity 1';
        newOpp.AccountId = newAccount.Id;
        newOpp.StageName = '(A) Power Promoter';
        newOpp.ADVSMS__NOC_Date__c = System.Today();
        newOpp.closeDate = System.Today();
        newOpp.amount = 100;
        insert newOpp;

        System.Assert(newOpp.Id != null, 'newOpp was not created correctly!');
        
        ADVSMS__Impacted_Job_Title__c newIJT = new ADVSMS__Impacted_Job_Title__c();
        newIJT.Name = 'New Impacted Job Title';
        newIJT.Opportunity__c = newOpp.id;
        insert newIJT;

        System.Assert(newIJT.Id != null, 'newIJT was not created correctly!');
        
        ADVSMS__Critical_Business_Issue__c newCBI = new ADVSMS__Critical_Business_Issue__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(newCBI);

        ApexPages.currentPage().getParameters().put('opp', newOpp.id);
        ApexPages.currentPage().getParameters().put('jt', newGlobalIJT.id);
    
        SMS2_AddACBI controller = new SMS2_AddACBI(sc);
        
        controller.getRef();
        
        controller.save2();
        controller.parentId = null;
        
        controller.save2();
        controller.parentId = '999';
        
        controller.save2();
        controller.cbi.name = 'Test';
        controller.parentId = newIJT.id;
        
        controller.save2();
        controller.getJobName();
        
        controller.cancel2();
        controller.parentId = null;
        
        test.stopTest();
        
    }
}