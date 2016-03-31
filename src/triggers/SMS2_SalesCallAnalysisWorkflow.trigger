trigger SMS2_SalesCallAnalysisWorkflow on ADVSMS__Sales_Call_Analysis__c (before insert, before update, after insert) {

/**
*   {Purpose}  �  This trigger handles the Sales_Call_Analysis__c object - specifically the move of Workflow actions to APEX
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
			
			// Pull Scope Ids
			Set<Id> setScopeIds = new Set<Id>();
			for(ADVSMS__Sales_Call_Analysis__c sca : trigger.new) {
				setScopeIds.add(sca.Impacted_Job_Title__c);
			}

			Map<Id, ADVSMS__Impacted_Job_Title__c> mapIJTs = new Map<Id, ADVSMS__Impacted_Job_Title__c>([SELECT Id, Name FROM ADVSMS__Impacted_Job_Title__c WHERE Id IN :setScopeIds]);
			
			// Replacing Workflow:  "Map Job Title Change"	
			for(ADVSMS__Sales_Call_Analysis__c sca : trigger.new) {				
				if(sca.Impacted_Job_Title__c != null) {
					sca.Name = mapIJTs.get(sca.Impacted_Job_Title__c).Name;
				}
			}
			
		}
		
	}

	if(trigger.isAfter) {
		if(trigger.isInsert) {
			ADVSMS.SMS2_addSalesCallAnalysisCauseCap tScAcC = new ADVSMS.SMS2_addSalesCallAnalysisCauseCap(Trigger.new);
		}
	}

}