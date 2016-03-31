@isTest
private class SMS2_createPersonalDevelopmentPlan_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_createPersonalDevelopmentPlan
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////

    static testMethod void SMS2_createPersonalDevelopmentPlan_unitTest() {
        
		User u = [SELECT ProfileId FROM User WHERE Id = :userInfo.getUserId()];
		
        User newSeller = new User();
        newSeller.alias='nSell';
        newSeller.email='newSeller@test.com';
        newSeller.firstname='New';
        newSeller.lastname='Seller';
        newSeller.profileid=u.ProfileId;
        newSeller.localesidkey='en_US';
        newSeller.username='newSeller@test.com';
        newSeller.timezonesidkey='America/Chicago';
        newSeller.languagelocalekey='en_US';
        newSeller.emailencodingkey='UTF-8';
        insert newSeller;
         
        ADVSMS__Skill_Analyzer_Set__c newSAS = new ADVSMS__Skill_Analyzer_Set__c();
        newSAS.name = 'Test SAS';
        insert newSAS;        
        
        ADVSMS__TACE_Skill_Analyzer__c newTSA = new ADVSMS__TACE_Skill_Analyzer__c();
        newTSA.Seller__c = newSeller.Id;
        newTSA.Skill_Analyzer_Set__c = newSAS.id;
        insert newTSA;
        
        ADVSMS__TACE_Personal_Development_Plan__c newPDP = new ADVSMS__TACE_Personal_Development_Plan__c();
        newPDP.name = 'Test PDP';
        newPDP.Skill_Analyzer__c = newTSA.Id;
        insert newPDP;        
        
        ADVSMS__Skill__c newSk = new ADVSMS__Skill__c();
        newSk.Skill_Comment_Title__c = 'Test data';
        newSk.Order__c = 4;
        newSk.Skill_Question__c = 'Test data';
        insert newSk;
        
        ADVSMS__Skills__c newSks = new ADVSMS__Skills__c();
        newSks.Personal_Development_Plan__c = false;
        newSks.Skill__c = newSk.Id;
        newSks.Skill_Analyzer__c = newTSA.Id;
        insert newSks;
        
        newSks.Personal_Development_Plan__c = true;
        newSks.Skill_Score__c = '3.0';
        update newSks;
       
    }
}