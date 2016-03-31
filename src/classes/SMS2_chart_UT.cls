@isTest
private class SMS2_chart_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_chart
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////

	static testMethod void SMS2_chart_unitTest() {
        
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
        
        List<ADVSMS__Impacted_Job_Title__c> lstImpactedTitles = new List<ADVSMS__Impacted_Job_Title__c>();
        
        ADVSMS__Impacted_Job_Title__c newIJT2 = new ADVSMS__Impacted_Job_Title__c();
        newIJT2.Name = 'New Impacted Job Title 2';
        newIJT2.Opportunity__c = newOpp.id;
        newIJT2.Sales_Call_Status__c = 'In Progress';
        insert newIJT2;
        lstImpactedTitles.add(newIJT2);
        
        ADVSMS__Impacted_Job_Title__c newIJT3 = new ADVSMS__Impacted_Job_Title__c();
        newIJT3.Name = 'New Impacted Job Title 3';
        newIJT3.Opportunity__c = newOpp.id;
        newIJT3.Sales_Call_Status__c = 'In Progress';
        insert newIJT3;
        lstImpactedTitles.add(newIJT3);
        
        ADVSMS__Impacted_Job_Title__c newIJT4 = new ADVSMS__Impacted_Job_Title__c();
        newIJT4.Name = 'New Impacted Job Title 4';
        newIJT4.Opportunity__c = newOpp.id;
        newIJT4.Sales_Call_Status__c = 'In Progress';
        insert newIJT4;
        lstImpactedTitles.add(newIJT4);
        
        ADVSMS__Impacted_Job_Title__c newIJT = new ADVSMS__Impacted_Job_Title__c();
        newIJT.Name = 'New Impacted Job Title';
        newIJT.Opportunity__c = newOpp.id;
        newIJT.Sales_Call_Status__c = 'In Progress';
        newIJT.impacts__c = newIJT2.Id;
        newIJT.Impacted_2__c = newIJT3.Id;
        newIJT.Impacted_3__c = newIJT4.Id;
        insert newIJT;
        lstImpactedTitles.add(newIJT);
        
        SMS2_chart controller = new SMS2_chart();
        PageReference pageRef = Page.SMS2_chart;
        Test.setCurrentPage(pageRef);
        controller = new SMS2_chart();
        
        controller.oppid = newOpp.id;
        
        controller.doNothing();
        controller.retOpp();
        controller.lock();
        controller.getImpactedJobs();
        controller.getImpactedJobConnections();
        
        // Testing Helper Classes
        SMS2_chart.createImpactedJob hClsCreateImpactedJob;
        hClsCreateImpactedJob = new SMS2_chart.createImpactedJob(newIJT, lstImpactedTitles, 50, 10, 1);
        hClsCreateImpactedJob.geth();
        hClsCreateImpactedJob.getfromLeft();
        hClsCreateImpactedJob.getijt();
        hClsCreateImpactedJob.setijt(newIJT);
        hClsCreateImpactedJob.getCauses();
        hClsCreateImpactedJob.geti();
        hClsCreateImpactedJob.getx();
        hClsCreateImpactedJob.gety();
        
        SMS2_chart.createCauses hClsCreateCauses = new SMS2_chart.createCauses(newIJT, newIJT2);
        hClsCreateCauses.getcauseId();
        hClsCreateCauses.getcause();
               

   }
}