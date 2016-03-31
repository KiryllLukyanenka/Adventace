@isTest
private class SMS2_SkillDefinition_UT {
	
	@isTest static void testSkillDefTrigger() {
		
		// Stage Data
		ADVSMS__Skill__c skMain = new ADVSMS__Skill__c(Skill_Definition__c='test update trigger');
		insert skMain;

		System.Assert(skMain.Id != null, 'Skill__c was not properly inserted!');

		ADVSMS__TACE_Skill_Analyzer__c tsaRoot = new ADVSMS__TACE_Skill_Analyzer__c();
		insert tsaRoot;

		ADVSMS__Skills__c sks1 = new ADVSMS__Skills__c(Skill_Analyzer__c=tsaRoot.Id);
		insert sks1;

		test.startTest();

		skMain.Skill_Definition__c = 'test update!';
		update skMain;


		test.stopTest();

	}

	
}