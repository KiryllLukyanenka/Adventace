@isTest(SeeAllData=true)
private class SMS2_skillDevelopmentViewExtension_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_skillDevelopmentViewExtension
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	// **** THIS TEST CLASS REQUIRES ACCESS TO THE ORG DATA ****
	//////////////////////////////////

    static testMethod void SMS2_skillDevelopmentViewExtension_unitTest() {
    
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
        
        ADVSMS__Skill_Help__c newSH1 = new ADVSMS__Skill_Help__c();
        //newSH1.Name = 'SH 1';
        newSH1.Skill__c = newSk.Id;
        newSH1.Skill_Help_Level__c = '1';
        insert newSH1;
        
        ADVSMS__Skill_Help__c newSH2 = new ADVSMS__Skill_Help__c();
        //newSH2.Name = 'SH 2';
        newSH2.Skill__c = newSk.Id;
        newSH2.Skill_Help_Level__c = '2';
        insert newSH2;
        
        ADVSMS__Skill_Help__c newSH3 = new ADVSMS__Skill_Help__c();
        //newSH3.Name = 'SH 3';
        newSH3.Skill__c = newSk.Id;
        newSH3.Skill_Help_Level__c = '3';
        insert newSH3;       
        
        ADVSMS__Skills__c newSks = new ADVSMS__Skills__c();
        newSks.Personal_Development_Plan__c = false;
        newSks.Skill__c = newSk.Id;
        newSks.Skill_Analyzer__c = newTSA.Id;
        insert newSks;
        
        ADVSMS__TACE_Skill_Analyzer__c newSAc = new ADVSMS__TACE_Skill_Analyzer__c();
        ApexPages.StandardController sc = new ApexPages.StandardController(newSAc);        
        SMS2_skillDevelopmentViewExtension controller = new SMS2_skillDevelopmentViewExtension(sc);
        
        controller.ska = newTSA;
        
        controller.getSkills(); 
        controller.saveSkills();
        
        // Testing Helper Classes
        SMS2_skillDevelopmentViewExtension.skillRollUp hClsSkillRollUp = new SMS2_skillDevelopmentViewExtension.skillRollUp(newSks);
        hClsSkillRollUp.getsh1b();
        hClsSkillRollUp.getsh2b();
        hClsSkillRollUp.getsh3b();
        hClsSkillRollUp.getsh1();
        hClsSkillRollUp.getsh2();
        hClsSkillRollUp.getsh3();
    }
}