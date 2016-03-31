trigger SMS2_ImpactedJTWorkflow on ADVSMS__Impacted_Job_Title__c (before insert, before update, after insert, after update) {

/**
*   {Purpose}  �  This trigger handles the ADVSMS__Impacted_Job_Title__c object - specifically the move of Workflow actions to APEX
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
*	20150601	EBG/DCS 				Added call to "assignPowerPromoter"
*   20150608	EBG/DCS 				Added "after update" to trigger header
*	20151216	EBG/DCS 				Moved "assignPowerPromoter" to bottom and only
*										execute if the "Type of Buyer" field was modified
*										or a new IJT was inserted
*   =============================================================================
*/
	system.debug('\n\n***Inside SMS2_ImpactedJTWorkflow.\nisBefore: ' + trigger.isBefore + '\nisAfter: ' + trigger.isAfter);

	//Added by EBG/DCS on 20151216
	List<ADVSMS__Impacted_Job_Title__c> lstIJTs = new List<ADVSMS__Impacted_Job_Title__c>();

	if(trigger.isBefore) {
		
		//Commented out by EBG/DCS on 20151216
		//ADVSMS.SMS2_ImpactedJobTitleMethods.assignPowerPromoter(trigger.new);

		if(trigger.isInsert || trigger.isUpdate) {

			for(ADVSMS__Impacted_Job_Title__c ijt : trigger.new) {				
				
				// Replacing Workflow:  "Update x and y"
				//System.Debug('CHECKING FOR PLAN NULLS');
				if(ijt.x_plan__c != null && ijt.y_plan__c != null) {
					//System.Debug('PLAN IS NOT NULL');
					//System.Debug(ijt);
					ijt.x__c = ijt.x_plan__c;
					ijt.y__c = ijt.y_plan__c;
					ijt.xy_mapped__c = true;
					//System.Debug(ijt);					
				}
				
				// Replacing Workflow:  "Null out x y plan"	
				if(ijt.xy_mapped__c) {
					ijt.y_plan__c = null;
					ijt.x_plan__c = null;
					ijt.xy_mapped__c = false;
				}

				//Added by EBG/DCS on 20151216
				if (trigger.isInsert) {
					lstIJTs.add(ijt);
				} else if (trigger.oldMap.get(ijt.Id).ADVSMS__Type_of_buyer__c != ijt.ADVSMS__Type_of_buyer__c) {
					lstIJTs.add(ijt);
				}
				
			}
		}
		
	}

	if(trigger.isAfter){
		if (trigger.isInsert) {
			ADVSMS.SMS2_addSalesCallAnalysis sca = new ADVSMS.SMS2_addSalesCallAnalysis(Trigger.new, 'I');
		}
		if (trigger.isUpdate) {
			ADVSMS.SMS2_addSalesCallAnalysis sca = new ADVSMS.SMS2_addSalesCallAnalysis(Trigger.new, 'U');
		}
	}

	//Added by EBG/DCS on 20151216
	if (lstIJTs.size() > 0) {
		ADVSMS.SMS2_ImpactedJobTitleMethods.assignPowerPromoter(lstIJTs);
	}

}