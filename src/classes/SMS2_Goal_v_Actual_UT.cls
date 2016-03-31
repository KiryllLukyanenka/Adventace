@isTest
private class SMS2_Goal_v_Actual_UT {
	
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_Goal_v_Actual
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	//////////////////////////////////

	static testMethod void SMS2_Goal_v_Actual_DrillType1_unitTest() {
        
        //test for drill type of 1
        Test.startTest();       
        SMS2_Goal_v_Actual controller = new SMS2_Goal_v_Actual();
        PageReference pageRef = Page.SMS2_Goal_v_Actual;
        Test.setCurrentPage(pageRef);        
        
        controller = new SMS2_Goal_v_Actual();  
        
        controller.drillType = null;
        
        controller.getLatestData();
        controller.subordinates(); 
        controller.getUsersQuery();
        controller.getPerformMetrics();
        controller.getSub();
        controller.getSubSize();
        controller.getProfileId();
        controller.getabGraphData();
        controller.getActualGraphData();
        controller.getNocGraphData();
        controller.gettblData();
        controller.gettableActualGraphData();
        controller.gettableNoclGraphData();
        Test.stopTest();   

	}
   
	static testMethod void SMS2_Goal_v_Actual_DrillType2_unitTest() {

        //test for drill type of 2
        Test.startTest();        
        SMS2_Goal_v_Actual controller2 = new SMS2_Goal_v_Actual();
        PageReference pageRef2 = Page.SMS2_Goal_v_Actual;
        Test.setCurrentPage(pageRef2); 
        
        controller2.drillType = '2';
        
        controller2.getLatestData();
        controller2.subordinates();         
        Test.stopTest();
   
	}
	
	static testMethod void helperClasses_unitTest() {
		
		SMS2_Goal_v_Actual.graphDataNoc hClsGraphDataNoc = new SMS2_Goal_v_Actual.graphDataNoc('1', '2', '3', '4', '5');
		hClsGraphDataNoc.getnocActual();
		hClsGraphDataNoc.getnocGoal();
		hClsGraphDataNoc.getroleName();
		hClsGraphDataNoc.getroleLink();
		hClsGraphDataNoc.getrendLink();
		hClsGraphDataNoc.getrendName();
		
		SMS2_Goal_v_Actual.graphDataActual hClsgraphDataActual = new SMS2_Goal_v_Actual.graphDataActual('1', 2, 3, '4', '5');
		hClsgraphDataActual.getaDollarActuals();
		hClsgraphDataActual.getaDollarGoal();
		hClsgraphDataActual.getroleName();
		hClsgraphDataActual.getroleLink();
		hClsgraphDataActual.getrendLink();
		hClsgraphDataActual.getrendName();
		
		SMS2_Goal_v_Actual.graphData hClsgraphData = new SMS2_Goal_v_Actual.graphData('1', '2', '3', '4', '5', '6', '7');
		hClsgraphData.getB();
		hClsgraphData.getA();
		hClsgraphData.getABRatioGoal();
		hClsgraphData.getABRatioActual();
		hClsgraphData.getroleName();
		hClsgraphData.getroleLink();
		hClsgraphData.getrendLink();
		hClsgraphData.getrendName();
		
	}
}