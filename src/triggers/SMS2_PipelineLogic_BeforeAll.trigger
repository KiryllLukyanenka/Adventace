trigger SMS2_PipelineLogic_BeforeAll on ADVSMS__TACE_Pipeline_Balancing_Algorithm__c (before insert
																						, before update
																						, before delete) {
/**
*   {Purpose}   - Performs various actions on the TACE_Pipeline_Balancing_Algorithm__c object
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name             	Description
*   20150601  	EBG/DCS				Created
*   =============================================================================
*/

	if (trigger.isInsert) {
		ADVSMS.SMS2_PipelineMethods.setOwnerToSeller(trigger.new);
	}

	if (trigger.isUpdate) {
		ADVSMS.SMS2_PipelineMethods.setOwnerToSeller(trigger.new);
	}
}