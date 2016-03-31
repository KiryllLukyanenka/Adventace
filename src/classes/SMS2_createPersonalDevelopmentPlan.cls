public with sharing class SMS2_createPersonalDevelopmentPlan {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	
	
	/////////////////////
	// Constructors
	/////////////////////

    public SMS2_createPersonalDevelopmentPlan(List<ADVSMS__Skills__c> newSkill, List<ADVSMS__Skills__c> oldSkill) {

        List<ADVSMS__TACE_Personal_Development_Plan__c> pdp2create = new List<ADVSMS__TACE_Personal_Development_Plan__c>();
        
        Set<Id> parentIds = new Set<id>();
        
        for (Integer m=0; m<newSkill.size(); m++) {
        
            parentIds.add(newSkill[m].Skill_Analyzer__c);
        }
        
        /// Get a map of all those
        
        Map<Id, ADVSMS__TACE_Skill_Analyzer__c> parents = new Map<ID, ADVSMS__TACE_Skill_Analyzer__c>(
            [Select Id, Seller__r.Name,Period_Beginning__c From ADVSMS__TACE_Skill_Analyzer__c Where Id in :parentIds]);
        
        for (Integer m=0; m<newSkill.size(); m++) {
            
            if(newSkill[m].Personal_Development_Plan__c == true && oldSkill[m].Personal_Development_Plan__c == false) {
            
                ADVSMS__TACE_Personal_Development_Plan__c np = new ADVSMS__TACE_Personal_Development_Plan__c();
                np.Skill_Analyzer__c = newSkill[m].Skill_Analyzer__c;
                np.Annual_Actions__c = newSkill[m].Annual_Actions__c;
                np.Daily_Actions__c = newSkill[m].Daily_Actions__c;
                np.Monthly_Actions__c = newSkill[m].Monthly_Actions__c;
                np.Quarterly_Actions__c = newSkill[m].Quarterly_Actions__c;
                np.Key_Skill_to_Track__c = newSkill[m].Skill_Header_Label__c;
                np.Weekly_Actions__c = newSkill[m].Weekly_Actions__c;
                if(newSkill[m].Skill_Score__c != null) {
                    np.Actual_Capability__c = Double.valueOf(newSkill[m].Skill_Score__c);
                }
                np.name = parents.get(newSkill[m].Skill_Analyzer__c).Seller__r.Name + ' ' + newSkill[m].Skill_Header_Label__c + ' ' + String.valueOf(parents.get(newSkill[m].Skill_Analyzer__c).Period_Beginning__c);
                pdp2create.add(np);      
                 
            }
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Skill_Analyzer__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Annual_Actions__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Daily_Actions__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Monthly_Actions__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Quarterly_Actions__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Key_Skill_to_Track__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Weekly_Actions__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Actual_Capability__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Personal_Development_Plan__c.fields.Name.isCreateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           System.Debug('**** CRUD/FLS FAIL ****');

        } else {
            if(pdp2create.size() >0) {insert pdp2create;}
        }
        
    }
}