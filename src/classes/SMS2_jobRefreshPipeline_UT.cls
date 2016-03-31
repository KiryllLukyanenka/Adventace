@isTest
private class SMS2_jobRefreshPipeline_UT {
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_jobRefreshPipeline and SMS2_jobRefreshPipeline_Scheduler
	// Created 20151211 EBG / Demand Chain Systems
	// support@demandchainsystems.com
	//////////////////////////////////	
	@isTest static void test_method_one() {
		Test.startTest();

        ADVSMS__TACE_Pipeline_Balancing_Algorithm__c newPBA = new ADVSMS__TACE_Pipeline_Balancing_Algorithm__c();
        newPBA.OwnerId = UserInfo.getUserId();
        newPBA.User__c = UserInfo.getUserId();
        newPBA.Average_Deal_Size__c = 1;
        newPBA.Annual_Target__c = 1;
        newPBA.Probability_of_a_NOC_Closing__c = 20;
        newPBA.Probability_of_an_A_Becoming_a_Win__c = 20;
        newPBA.Average_Sales_Cycle_Length_months__c = 6;
        newPBA.A_B_Ratio__c = 2;
        insert newPBA;

		String jobId_00 = System.schedule('Refresh Pipeline - On the Hour',    '0 0 * * * ?', new SMS2_jobRefreshPipeline_Scheduler());

		Test.stopTest();
	}
	
}