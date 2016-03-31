@isTest(SeeAllData=true)
private class SMS2_AssignSkillsToSkillDevelopPlan_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_AssignSkillsToSkillDevelopmenrPlan
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	// *** THIS UNIT TEST REQUIRES ACCESS TO THE LOCAL DATA ***
	//////////////////////////////////

    static testMethod void SMS2_AssignSkillsToSkillDevelopmenrPlan_unitTest() {
            
         User u = [select ProfileId from User where Id = :userInfo.getUserId()];
            
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
        
        ADVSMS__TACE_Skill_Analyzer__c newTSA = new ADVSMS__TACE_Skill_Analyzer__c();
        newTSA.Seller__c = newSeller.Id;
        insert newTSA;  
        
    }  
}