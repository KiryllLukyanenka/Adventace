/**
*   {Purpose}  		- Test class
*
*	{Code Covered}	- Classes: SMS2_TaskMethods
*					  Triggers: SMS2_TaskLogic_BeforeAll
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name        Description
*   20150529  	EBG/DCS		Created
*   =============================================================================
*/
@isTest
private class SMS2_TaskMethods_UT {
	
	@isTest static void testController() {
		//create the case whose id will be stored in the custom setting
		Case oTestCase = new Case();
		oTestCase.Subject = 'Test';
		oTestCase.Status = 'New';
		oTestCase.Priority = 'Low';
		oTestCase.Origin = 'Unit Test';
		insert oTestCase;

		//store the case id in the custom setting
		ADVSMS__SMS_Conga_Email_Case_ID__c oSetting = new ADVSMS__SMS_Conga_Email_Case_ID__c();
		oSetting.ADVSMS__CASE_ID__c = oTestCase.Id;
		insert oSetting;

		//create test data
		ADVSMS.SMS2_Populate_OrgData.populate_data();

		//retrieve an opportunity from the test data.  This opportunity will be where our task gets
		// reassigned via the trigger SMS_TaskLogic_BeforeAll
		Opportunity oTestOpp = new Opportunity();
		try {
			oTestOpp = [Select Id From Opportunity LIMIT 1];
		} catch(Exception ex) {
			system.assert(oTestOpp.Id != null, 'No opportunities available for testing SMS2_TasksMethods class');
		}

		test.startTest();

		//create a task associated to the case in the custom setting and in the task's description include the 
		// opportunity id to which it should be reassigned
		Task oTestTask = new Task();
		oTestTask.Subject = 'Test';
		oTestTask.WhatId = oTestCase.Id;
		oTestTask.Status = 'Not Started';
		oTestTask.Description = 'SMS_Opp:' + oTestOpp.Id;
		insert oTestTask;

		test.stopTest();
	}
	
}