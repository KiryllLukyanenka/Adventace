@isTest
private class SMS2_ImpagtedJobTitleCreateEdit_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_ImpagtedJobTitleCreateEdit
	//////////////////////////////////
/*   CHANGE  HISTORY
*   =============================================================================
*   Date        Name            Description
*   20120424    AAB / DCS       Updated
*   20150529    EBG / DCS       Added Vertical field
*   20150601    EBG / DCS       Added contact
*   =============================================================================
*/    

    static testMethod void SMS2_ImpagtedJobTitleCreateEdit_unitTest() {
             
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;
        
        Contact newContact = new Contact();
        newContact.FirstName = 'TestFN';
        newContact.LastName = 'TestLN';
        newContact.AccountId = newAccount.Id;
        insert newContact;

        ADVSMS__Vertical__c newVertical = new ADVSMS__Vertical__c();
        newVertical.Name = 'Vertical Name';
        newVertical.Active__c = false;
        insert newVertical;

        ADVSMS__Job_Title__c newJT = new ADVSMS__Job_Title__c();
        newJT.Name = 'JT Name';
        newJT.Active__c = true;
        newJT.Vertical__c = newVertical.Id;
        insert newJT;
        
        ADVSMS__Critical_Business_Issue__c newCBI = new ADVSMS__Critical_Business_Issue__c();
        newCBI.Name = 'New CBI';
        newCBI.Job_Title__c = newJT.Id;
        insert newCBI;

        //ADVSMS__Vertical_Job_Title__c newVJT = new ADVSMS__Vertical_Job_Title__c();
        //newVJT.ADVSMS__Job_Title__c = newJT.Id;
        //newVJT.ADVSMS__Vertical__c = newVertical.Id;
        //insert newVJT;

        //need this here to avoid validation rule
        newVertical.Active__c = true;
        update newVertical;

        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity 1';
        newOpp.AccountId = newAccount.Id;
        newOpp.StageName = '(A) Power Promoter';
        newOpp.CloseDate = System.Today();
        newOpp.ADVSMS__NOC_Date__c = System.Today();
        newOpp.Amount = 100;
        newOpp.Vertical__c = newVertical.Id;
        insert newOpp;
        
        ADVSMS__Impacted_Job_Title__c newIJTi1 = new ADVSMS__Impacted_Job_Title__c();
        newIJTi1.Name = 'New Impacted Job Title Impact 1';
        newIJTi1.Opportunity__c = newOpp.id;
        newIJTi1.Job_Title__c = newJT.Id;
        newIJTi1.Vertical__c = newVertical.Id;
        newIJTi1.Type_of_buyer__c = 'Power Promoter';
        newIJTi1.ADVSMS__Contact__c = newContact.Id;
        insert newIJTi1; 
        
        ADVSMS__Impacted_Job_Title__c newIJTi2 = new ADVSMS__Impacted_Job_Title__c();
        newIJTi2.Name = 'New Impacted Job Title Impact 2';
        newIJTi2.Opportunity__c = newOpp.id;
        newIJTi2.Job_Title__c = newJT.Id;
        insert newIJTi2; 
        
        ADVSMS__Impacted_Job_Title__c newIJTi3 = new ADVSMS__Impacted_Job_Title__c();
        newIJTi3.Name = 'New Impacted Job Title Impact 3';
        newIJTi3.Opportunity__c = newOpp.id;
        newIJTi3.Job_Title__c = newJT.Id;
        insert newIJTi3; 

        ApexPages.StandardController scAlt3 = new ApexPages.StandardController(newIJTi3);
        ApexPages.currentPage().getParameters().put('id', newIJTi3.Id);
        SMS2_ImpagtedJobTitleCreateEdit controllerAlt3 = new SMS2_ImpagtedJobTitleCreateEdit(scAlt3);

        ADVSMS__Impacted_Job_Title__c newIJT = new ADVSMS__Impacted_Job_Title__c();
        newIJT.Name = 'New Impacted Job Title';
        newIJT.Opportunity__c = newOpp.id;
        newIJT.Job_Title__c = newJT.Id;
        newIJT.Impacts__c = newIJTi1.Id;
        newIJT.Impacted_2__c = newIJTi2.Id;
        newIJT.Impacted_3__c = newIJTi3.Id;
        newIJT.Vertical__c = newVertical.Id;
        insert newIJT;       

        ApexPages.StandardController scAlt = new ApexPages.StandardController(newIJT);
        ApexPages.currentPage().getParameters().put('id', newIJT.Id);
        ApexPages.currentPage().getParameters().put('dbg', 'true');
        SMS2_ImpagtedJobTitleCreateEdit controllerAlt = new SMS2_ImpagtedJobTitleCreateEdit(scAlt);
        
        Impacted_Job_Title__c newIJTc = new Impacted_Job_Title__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(newIJTc);
        ApexPages.currentPage().getParameters().put('id', null);        
        SMS2_ImpagtedJobTitleCreateEdit controller = new SMS2_ImpagtedJobTitleCreateEdit(sc);
        
        PageReference pageRef = Page.SMS2_ImpactedJobTitleCreateEdit;
        Test.setCurrentPage(pageRef); 
        
        ApexPages.currentPage().getParameters().put('thisID', newIJT.Id);
        controller.ijt.job_title__c = newJT.Id;
        controller.ijt.Impacts__c = newIJTi1.Id;
        controller.ijt.Impacted_2__c = newIJTi2.Id;
        controller.ijt.Impacted_3__c = newIJTi3.Id;
        controller.ijt.Critical_Business_Issue__c = newCBI.Id;
        controller.selVertical = newVertical.Id;
        
        controller.getitj();
        //controller.getavailJobTitles();
        controller.getSelJobTitle();
        controller.getcauseJTI();
        controller.getcauseJTI2();
        controller.getcauseJTI3();
        controller.getselCBI();
        controller.loadCBI();
        controller.getavailCBI();
        controller.getavailJTI();
        controller.addAJobTitle();
        controller.addACBI();        
        controller.cancel2();
        controller.save2();  
        controller.setSelJobTitle('Test');
        controller.setcauseJTI2('Test');
        controller.setcauseJTI('Test');
        controller.setselCBI('Test');
        controller.setcauseJTI3('Test');  
        //controller.loadVJT(); 
        controller.loadJT(); 
        controller.getBolShowNewTitleLink();
        controller.getBolShowNewCBILink();
        controller.getJobTitles('999');
        controller.getSelJobTitle();
        controller.getcauseJTI();
        controller.getcauseJTI2();
        controller.getcauseJTI3();

        controller.SelJobTitle = '999';
        controller.bolShowVertical = true;
        controller.selVertical = '999';
        controller.addACBI();
        //controller.save2();
    }
}