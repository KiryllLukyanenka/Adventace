public without sharing class SMS2_TaskMethods {
/**
*   {Purpose}   - Performs various actions against the Task object
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name        Description
*   20150528  	EBG/DCS		Created
*   =============================================================================
*/

	///////////////////////////
	// When a task is created by the Conga mail merge process and assigned to
	// a case indicated in a custom setting, search the description of the task
	// for the opportunity id to which the task should be reassigned
	///////////////////////////
	public static void reassignFromCaseToOpp(List<Task> lstTasks) {
		String caseId = ADVSMS__SMS_Conga_Email_Case_ID__c.getInstance().ADVSMS__CASE_ID__c;

		if (caseId != null) {
			//loop through the tasks and if any are associated to the case, look in
			// the task description for the opportunity id to associate to the task
			for (Task oTask : lstTasks) {
				String searchString = 'SMS_Opp:';
				if (oTask.WhatId == caseId 
						&& oTask.Description != null
						&& oTask.Description.contains(searchString)) {
					Integer startPos = oTask.Description.indexOf(searchString) + searchString.length();
					Integer endPos = startPos + 15;
					String oppId = oTask.Description.substring(startPos, endPos);
					if (oppId != null) {
						oTask.WhatId = oppId;
					}
				}
			}
		}
	}

}