public with sharing class SMS2_addSalesCallAnalysisCauseCap {

    /* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
    /////////////////////////////////////////
    // Updated 20120424 AAB / DCS
    // andyb@demandchainsystems.com
    /////////////////////////////////////////   
    
    ///////////////////////
    // Constructor
    ///////////////////////

    public SMS2_addSalesCallAnalysisCauseCap(List<ADVSMS__Sales_Call_Analysis__c> allSalesCallAnalysis) {

        // Go grab the causes and capabilities that are related
        // to the CBI in this Sales_Call_Analysis__c
        List<ADVSMS__Opportunity_Qualifiers__c> oppQualifiers = new List<ADVSMS__Opportunity_Qualifiers__c>();
        
        /// Create a set of IDS
        Set<String> allCBIids = new Set<String>();
        Set<String> allIJT= new Set<String>();
        for(ADVSMS__Sales_Call_Analysis__c thisSCA : allSalesCallAnalysis) {
            
            if(thisSCA.Critical_Business_Issue_Id__c != null) { 
                
                allCBIids.add(thisSCA.Critical_Business_Issue_Id__c);
                allIJT.add(thisSCA.Impacted_Job_Title__c);
            }
        }
        
        // Put it in a list so it is easy to itterate over
        List<ADVSMS__Impacted_Job_Title__c> ijtToUpdate = [Select Sales_Call_Analysis_Created__c from ADVSMS__Impacted_Job_Title__c Where Id in :allIJT];
        
        for(ADVSMS__Impacted_Job_Title__c ij : ijtToUpdate) {
            
            ij.Sales_Call_Analysis_Created__c = true; 
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Sales_Call_Analysis_Created__c.isUpdateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            System.Debug('**** CRUD/FLS FAIL ****');
            return;
        }
        
        update ijtToUpdate;
        
        /// Need to get a Map of all Cause and Capabilities that are  
        /// related to any Critical Business Issue Id in this list
        Map<Id, ADVSMS__Causes_Capabilities__c> relatedCauseCapabilities = new Map<ID, ADVSMS__Causes_Capabilities__c>(
            [Select Id, Critical_Business_Issue__c, ADVSMS__Cause_RTF__c, ADVSMS__Capabilities_RTF__c from ADVSMS__Causes_Capabilities__c Where Critical_Business_Issue__c in :allCBIids]);
        System.debug('relatedCauseCapabilities - ' + relatedCauseCapabilities.size());
        
        
        /// Put it in a list so it is easy to itterate over
        List<ADVSMS__Causes_Capabilities__c> relatedCauseCapabilitiesList = relatedCauseCapabilities.values();
        System.debug('relatedCauseCapabilitiesList - ' + relatedCauseCapabilitiesList.size());
        
        for(ADVSMS__Sales_Call_Analysis__c thisSCA : allSalesCallAnalysis) {
            
            // Need to itterate through the relatedCauseCapabilitiesList and see
            // how many match the Critical_Business_Issue_Id__c that is associated
            // with thisSCA. Create new Opportunity_Qualifiers__c for each match
            
            for(ADVSMS__Causes_Capabilities__c thisCapCaus : relatedCauseCapabilitiesList) {
                
                String cbi = String.valueOf(thisCapCaus.Critical_Business_Issue__c);
                //cbi15 = cbi15.substring(0,14); 
                System.debug(cbi + ' - ' + thisSCA.Critical_Business_Issue_Id__c);
                
                if(cbi.contains(thisSCA.Critical_Business_Issue_Id__c)) {
                    
                    ADVSMS__Opportunity_Qualifiers__c thisOppQual = new ADVSMS__Opportunity_Qualifiers__c();
                    thisOppQual.Causes_Capabilities__c = thisCapCaus.id;
                    thisOppQual.Sales_Call_Analysis__c = thisSCA.id;
                    oppQualifiers.add(thisOppQual);
                }
            }
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Opportunity_Qualifiers__c.fields.Causes_Capabilities__c.isCreateable() ||
            !Schema.sObjectType.ADVSMS__Opportunity_Qualifiers__c.fields.Sales_Call_Analysis__c.isCreateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           System.Debug('**** CRUD/FLS FAIL ****');

        } 
        
        else {
        system.debug('inside else before insert' + oppQualifiers);
            if(oppQualifiers.size() > 0) {insert oppQualifiers;}
        }

    }
   
}