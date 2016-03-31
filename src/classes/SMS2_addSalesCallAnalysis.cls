public with sharing class SMS2_addSalesCallAnalysis {
	
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	
/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date        Name                    Description
*   20120424    Andy Boettcher DCS      Updated
*   20150608    EBG/DCS                 Added criteria to look at status != "To be conducted"
*   =============================================================================
*/
	
	///////////////////////
	// Constructor
	///////////////////////
	
    public SMS2_addSalesCallAnalysis(List<ADVSMS__Impacted_Job_Title__c> allImpactedJobTitles, String typ) {

        List<ADVSMS__Sales_Call_Analysis__c> scaToCreate = new List<ADVSMS__Sales_Call_Analysis__c>();

        if(typ == 'U') {

            for(ADVSMS__Impacted_Job_Title__c thisImpactedJobTitle : allImpactedJobTitles) {

                system.debug('\n\n***SMS2_addSalesCallAnalysis -> Update'
                                + '\nSales_Call_Status__c: ' + thisImpactedJobTitle.Sales_Call_Status__c
                                + '\nSales_Call_Analysis_Created__c: ' + thisImpactedJobTitle.Sales_Call_Analysis_Created__c);

                if(thisImpactedJobTitle.Sales_Call_Status__c != null 
                        && thisImpactedJobTitle.Sales_Call_Status__c != 'To be conducted'
                        && thisImpactedJobTitle.Sales_Call_Analysis_Created__c== false){
                    
                    /// THEN WE NEED TO CREATE A NEW Sales_Call_Analysis__c record and set this flg to true
    
                    //thisImpactedJobTitle.Sales_Call_Analysis_Created__c = true;
                    
                    ADVSMS__Sales_Call_Analysis__c newSalesCallAnalysis = new ADVSMS__Sales_Call_Analysis__c();
                    newSalesCallAnalysis.Impacted_Job_Title__c = thisImpactedJobTitle.id;
                    newSalesCallAnalysis.Name = thisImpactedJobTitle.Name;
                    newSalesCallAnalysis.Opportunity__c  = thisImpactedJobTitle.Opportunity__c;
                    scaToCreate.add(newSalesCallAnalysis);
                    
                }
                
            }

            //if(scaToCreate.size() > 0) { insert scaToCreate; }
        
        } else {
                       
            for(ADVSMS__Impacted_Job_Title__c thisImpactedJobTitle : allImpactedJobTitles) {
                
                if(thisImpactedJobTitle.Sales_Call_Status__c != null 
                        && thisImpactedJobTitle.Sales_Call_Status__c != 'To be conducted'
                        && thisImpactedJobTitle.Sales_Call_Analysis_Created__c== false){
                    
                    system.debug('\n\n***SMS2_addSalesCallAnalysis -> Update'
                                    + '\nSales_Call_Status__c: ' + thisImpactedJobTitle.Sales_Call_Status__c
                                    + '\nSales_Call_Analysis_Created__c: ' + thisImpactedJobTitle.Sales_Call_Analysis_Created__c);

                    /// THEN WE NEED TO CREATE A NEW Sales_Call_Analysis__c record and set this flg to true
    
                    //thisImpactedJobTitle.Sales_Call_Analysis_Created__c = true;
                    
                    ADVSMS__Sales_Call_Analysis__c newSalesCallAnalysis = new ADVSMS__Sales_Call_Analysis__c();
                    newSalesCallAnalysis.Impacted_Job_Title__c = thisImpactedJobTitle.id;
                    newSalesCallAnalysis.Name = thisImpactedJobTitle.Name;
                    newSalesCallAnalysis.Opportunity__c  = thisImpactedJobTitle.Opportunity__c;
                    scaToCreate.add(newSalesCallAnalysis);
                    
                }
                
            }
            
            //if(scaToCreate.size() > 0) { insert scaToCreate; }
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Sales_Call_Analysis__c.fields.Impacted_Job_Title__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Sales_Call_Analysis__c.fields.Name.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Sales_Call_Analysis__c.fields.Opportunity__c.isCreateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!'));
           System.Debug('**** CRUD/FLS FAIL ****');

        } else {
            if(scaToCreate.size() > 0) { 
                insert scaToCreate; 
                system.debug('\n\n***scaToCreate after insert:\n' + scaToCreate);
            }
        }
    
    }
    
}