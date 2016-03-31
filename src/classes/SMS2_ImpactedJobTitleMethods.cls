public without sharing class SMS2_ImpactedJobTitleMethods {
/**
*   {Purpose}   - Performs various actions against the Impacted Job Title object
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name        Description
*   2015601  	EBG/DCS		Created
*   20151216	EBG/DCS 	Changed list of opportunities to be a map so
*							system doesn't error if the same opportunity has
*							multiple Power Promoter IJTs.  Opportunity will be
*							updated with last Power Promoter in the list
*   =============================================================================
*/

	///////////////////////////
	// If an Impacted Job Title is linked to an opportunity and contact, and has a 
	//  Buyer Type of 'Power Promoter', set the opportunity's Power Promoter Contact
	//  to the IJT's contact
	///////////////////////////
	public static void assignPowerPromoter(List<ADVSMS__Impacted_Job_Title__c> lstIJTs) {
		Map<Id, Opportunity> mapOpps = new Map<Id, Opportunity>();

		for (ADVSMS__Impacted_Job_Title__c oIJT : lstIJTs) {
			if (oIJT.ADVSMS__Opportunity__c != null
					&& oIJT.ADVSMS__Contact__c != null
					&& oIJT.ADVSMS__Type_of_buyer__c == 'Power Promoter') {
				Opportunity oOpp = new Opportunity(Id=oIJT.ADVSMS__Opportunity__c
													, ADVSMS__Power_Promoter_Contact__c = oIJT.ADVSMS__Contact__c);
				mapOpps.put(oOpp.Id, oOpp);
			}
		}

		system.debug('\n\n***Inside assignPowerPromoter.  lstOpps:\n' + mapOpps.values());
		if (mapOpps.size() > 0) {
			update mapOpps.values();
		}

	}

}