trigger SMS2_TaskLogic_BeforeAll on Task (before insert, before update, before delete) {
/**
*   {Purpose}  –  This class performs various actions against the task object
*                 
*   {Support}   - For assistance with this code, please contact support@demandchainsystems.com             
*                 www.demandchainsystems.com
*                 (952) 345-4533
*
*
*   CHANGE  HISTORY
*   =============================================================================
*   Date      Name             Description
*   20150528  EBG DCS          Created
*   =============================================================================
*/

	if (trigger.isInsert) {
		ADVSMS.SMS2_TaskMethods.reassignFromCaseToOpp(trigger.new);
	}

}