trigger SMS2_OpportunityWorkflow on Opportunity (before insert, before update, after delete, after insert, after update) {

/**
*   {Purpose}  �  This trigger handles the Opportunity object - specifically the move of Workflow actions to APEX
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
*   20151123	Eric Gronholz DCS 		Changed rollup call to future method "buildPipelineForUsers"
*										Commented out call to original code
*   =============================================================================
*/

	if(trigger.isBefore) {
		
		if(trigger.isInsert || trigger.isUpdate) {
			
			// Replacing Workflow:  "Milestone Change Rule"	
			for(Opportunity opp : trigger.new) {				
				if(opp.Milestone__c != opp.Previous_Milestone__c && (opp.Previous_Milestone__c != null || opp.Previous_Milestone__c != '')) {
					opp.Milestone_Change__c = System.Today();
					opp.Previous_Milestone__c = opp.Milestone__c;
				}
			}		
		}
	}

	if(trigger.isAfter) {
		Set<String> ownerIds = new Set<String>();
	    if(Trigger.isDelete) {
	        for (Opportunity o:Trigger.Old) {
	        	ownerIds.add(o.ownerId);
	        }
	        //ADVSMS.SMS2_rollUpUserOpportunities sca = new ADVSMS.SMS2_rollUpUserOpportunities(ownerIds);
	        if (Test.isRunningTest() == false) {
	        	//we don't run this part of the trigger in tests because we have a separate test class for it
	        	ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers_Future(ownerIds);
	        }
	    } else {
	        for (Opportunity o:Trigger.New) {
	        	ownerIds.add(o.ownerId);
	        }
	        if(trigger.isUpdate) {
	        	for (Opportunity o:Trigger.Old) { 
	        		ownerIds.add(o.ownerId); 
	        	}
	        }
	        //ADVSMS.SMS2_rollUpUserOpportunities sca = new ADVSMS.SMS2_rollUpUserOpportunities(ownerIds);
	        if (Test.isRunningTest() == false) {
	        	//we don't run this part of the trigger in tests because we have a separate test class for it
	        	ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers_Future(ownerIds);
	        }
	    }
	}

}