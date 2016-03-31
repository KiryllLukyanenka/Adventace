trigger SMS2_OppQualifiersWorkflow on ADVSMS__Opportunity_Qualifiers__c (before insert) {

/**
*   {Purpose}  �  This trigger handles the ADVSMS__Opportunity_Qualifiers__c object - specifically the move of Workflow actions to APEX
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
		
		if(trigger.isInsert) {
			
			// Pull Scope Ids
			Set<Id> setScopeIds = new Set<Id>();
			for(ADVSMS__Opportunity_Qualifiers__c oq : trigger.new) {
				setScopeIds.add(oq.Causes_Capabilities__c);
			}

			Map<Id, ADVSMS__Causes_Capabilities__c> mapCCs = new Map<Id, ADVSMS__Causes_Capabilities__c>(
				[SELECT Id, Name, ADVSMS__Cause_RTF__c, ADVSMS__Capabilities_RTF__c, ADVSMS__Proof_RTF__c FROM ADVSMS__Causes_Capabilities__c WHERE Id IN :setScopeIds]);
			
			// Replacing Workflow:  "Map over cause/capabilities"	
			for(ADVSMS__Opportunity_Qualifiers__c oq : trigger.new) {
				if(oq.Causes_Capabilities__c != null) {
					oq.ADVSMS__Cause_RTF__c = mapCCs.get(oq.Causes_Capabilities__c).ADVSMS__Cause_RTF__c;
					oq.ADVSMS__Capabilities_RTF__c = mapCCs.get(oq.Causes_Capabilities__c).ADVSMS__Capabilities_RTF__c;
					oq.ADVSMS__Proof_RTF__c = mapCCs.get(oq.Causes_Capabilities__c).ADVSMS__Proof_RTF__c;
				}
			}
			
			
			
		}
		
	}

}