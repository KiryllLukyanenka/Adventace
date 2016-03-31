trigger SMS2_ActionPlanWorkflow on ADVSMS__Action_Plan__c (before insert, before update, after insert) {

/**
*   {Purpose}  �  This trigger handles the Action_Plan__c object - specifically the move of Workflow actions to APEX
*					for AppExchange compatibility with Pro orgs
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name             		Description
*   20131219	Andy Boettcher DCS    	Created
*   =============================================================================
*/

	if(trigger.isBefore) {
		
		if(trigger.isInsert || trigger.isUpdate) {

			// Get all Ids of GAPs
			Set<Id> setGlobalIds = new Set<Id>();
			for(ADVSMS__Action_Plan__c ap : trigger.new) {
				setGlobalIds.add(ap.Global_Action_Plans__c);
			}
			
			Map<Id, ADVSMS__Global_Action_Plans__c> mapAPs = new Map<Id, ADVSMS__Global_Action_Plans__c>([SELECT Id, Name FROM ADVSMS__Global_Action_Plans__c WHERE Id IN :setGlobalIds]);
			
			// Replacing Workflow:  "Action Plan Name"	
			for(ADVSMS__Action_Plan__c ap : trigger.new) {		
				if(ap.Global_Action_Plans__c != null) {
					ap.Name = mapAPs.get(ap.Global_Action_Plans__c).Name;
				}
			}
			
		}
		
	}

	if(trigger.isAfter) {
		if(trigger.isInsert) {
			ADVSMS.SMS2_AutopopulateActionPlan newActionPlan = new ADVSMS.SMS2_AutopopulateActionPlan(Trigger.new);
		}
	}

}