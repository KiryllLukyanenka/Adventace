public with sharing class SMS2_AssignSkillsToSkillDevelopmenrPlan {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	
	
	///////////////////////
	// Constructor
	///////////////////////

    public SMS2_AssignSkillsToSkillDevelopmenrPlan(List<ADVSMS__TACE_Skill_Analyzer__c> newSkillDevPlans) {
        
        List<ADVSMS__Skills__c> skillsToAdd = new List<ADVSMS__Skills__c>();
        
        /// Create a set of IDS
        Set<String> allSKids = new Set<String>();
        for(ADVSMS__TACE_Skill_Analyzer__c nskdp : newSkillDevPlans) {
            
            allSKids.add(nskdp.Skill_Analyzer_Set__c);

        }   
        
        Map<Id, ADVSMS__Skill__c> relatedSkills= new Map<ID, ADVSMS__Skill__c>([
            Select Id,Skill_Analyser_Set__c,Skill_Definition__c from ADVSMS__Skill__c Where Skill_Analyser_Set__c in :allSKids
        ]);
    
        /// Put it in a list so it is easy to itterate over
        List<ADVSMS__Skill__c> relatedSkillsList = relatedSkills.values();
        
        for(ADVSMS__TACE_Skill_Analyzer__c nskdp : newSkillDevPlans) {
            
            for(ADVSMS__Skill__c sk : relatedSkillsList) {
                
                if(sk.Skill_Analyser_Set__c == nskdp.Skill_Analyzer_Set__c) {
                    
                    ADVSMS__Skills__c newSkill = new ADVSMS__Skills__c();
                    newSkill.Skill_Analyzer__c = nskdp.id;
                    newSkill.Skill__c = sk.id;
                    newSkill.Skill_Defeinition_n__c  = sk.Skill_Definition__c;
                    skillsToAdd.add(newSkill);
                }
            }           
        }
        
        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Skills__c.fields.Skill_Analyzer__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Skills__c.fields.Skill__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Skills__c.fields.Skill_Defeinition_n__c.isCreateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           System.Debug('**** CRUD/FLS FAIL ****');

        } else {
            if(skillsToAdd.size() >0 ) {insert skillsToAdd;}
        }
    }
    
}