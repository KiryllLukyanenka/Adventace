public with sharing class SMS2_AutopopulateActionPlan {

    /* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
    /////////////////////////////////////////
    // Updated 20120424 AAB / DCS
    // andyb@demandchainsystems.com
    /////////////////////////////////////////   
    
    ///////////////////////
    // Constructor
    ///////////////////////

    public SMS2_AutopopulateActionPlan(List<ADVSMS__Action_Plan__c> actionPlansToMap) {
        
        /// MAKE SURE ALL THE FIELDS
        /// ARE FILLED IN
        /// Action_Plan_Mapped__c = false
        /// Global_Action_Plans__c !=  null
    
        List<ADVSMS__Action_Plan_Step__c> apsToCreate = new List<ADVSMS__Action_Plan_Step__c>();
        
        /// NEED TO GET A SET OF ALL Global_Action_Plans__c IDS
        
        Set<ID> globalActionPlanIds = new Set<ID>();
        for(ADVSMS__Action_Plan__c thisActionPlan:actionPlansToMap) { 
            
            if(thisActionPlan.Global_Action_Plans__c != null) {
                globalActionPlanIds.add(thisActionPlan.Global_Action_Plans__c);
            }
        }
        
        // Get all the Global ACtion Plan Steps
        List<ADVSMS__Global_Action_Plan_Steps__c> globalActionPlanSteps = 
            [Select  Order__c, Objective__c, Key_Decision_Point__c, Id, Global_Action_Plans__c, Days_from_first_step__c, Action_Item__c 
            From ADVSMS__Global_Action_Plan_Steps__c Where Global_Action_Plans__c in :globalActionPlanIds];
        
        for(ADVSMS__Action_Plan__c thisActionPlan:actionPlansToMap) {
            
            if(thisActionPlan.Action_Plan_Mapped__c == false && thisActionPlan.Global_Action_Plans__c != null) {
                
                for(ADVSMS__Global_Action_Plan_Steps__c thisActionPlanStep:globalActionPlanSteps) {
                
                    if(thisActionPlanStep.Global_Action_Plans__c == thisActionPlan.Global_Action_Plans__c) {
                        
                        // We need to add this Global Action Plan Step to this action plan
                        
                        ADVSMS__Action_Plan_Step__c thisActionPlanStep2Create = new ADVSMS__Action_Plan_Step__c();
                        thisActionPlanStep2Create.Action_Item__c = thisActionPlanStep.Action_Item__c;
                        thisActionPlanStep2Create.Key_Decision_Point__c = thisActionPlanStep.Key_Decision_Point__c;
                        thisActionPlanStep2Create.Objective__c = thisActionPlanStep.Objective__c;
                        thisActionPlanStep2Create.Action_Plan__c = thisActionPlan.Id;
                        
                        if(thisActionPlan.Start_date_of_plan__c != null) {
                                
                            Integer dys = thisActionPlanStep.Days_from_first_step__c.intValue();
                            Date ancDate = thisActionPlan.Start_date_of_plan__c;
                            thisActionPlanStep2Create.Date__c = ancDate.addDays(dys);
    
                        }
                        
                        apsToCreate.add(thisActionPlanStep2Create);
                    }
                }
            }
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Action_Plan_Step__c.fields.Action_Item__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan_Step__c.fields.Key_Decision_Point__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan_Step__c.fields.Objective__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan_Step__c.fields.Action_Plan__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Action_Plan_Step__c.fields.Date__c.isCreateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           System.Debug('**** CRUD/FLS FAIL ****');

        } else {
            if(apsToCreate.size() > 0 ) {insert apsToCreate;}
        }
    
        
    }
 
}