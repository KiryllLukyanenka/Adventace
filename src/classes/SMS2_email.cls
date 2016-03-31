public with sharing class SMS2_email {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	
	public String impactedJobTitleId {get;set;}
    public tableRollUp tableData;
    
	/////////////////////
	// Constructors
	/////////////////////

	/////////////////////
	// GETers
	/////////////////////
	
    public Date getdt() {
        
        Date dt = System.today();
        return dt;
    }
    
    public ADVSMS__Impacted_Job_Title__c getPowerPromoter() {
        
        ADVSMS__Impacted_Job_Title__c oppToReturnPP = new ADVSMS__Impacted_Job_Title__c();
        
        ADVSMS__Impacted_Job_Title__c oppToReturn = [Select Opportunity__c from ADVSMS__Impacted_Job_Title__c where id =:impactedJobTitleId];
        List<ADVSMS__Impacted_Job_Title__c> oppToReturn2 = 
            [Select Type_of_buyer__c,name, Critical_Business_Issue__r.Name, Contact__r.FirstName, Contact__r.LastName, Contact__r.Account.Name, 
            Contact__r.Account.BillingStreet, Contact__r.Account.BillingCity, Contact__r.Account.BillingState, Contact__r.Account.BillingPostalCode 
            from ADVSMS__Impacted_Job_Title__c where Opportunity__c = :oppToReturn.Opportunity__c];
       
        for(ADVSMS__Impacted_Job_Title__c thisijt:oppToReturn2) {
        
            if(thisIjt.Type_of_buyer__c == 'Power Promoter') {
                oppToReturnPP = thisijt;
            }
        }
        return oppToReturnPP;
        
    }
    
    public ADVSMS__Impacted_Job_Title__c getimpactedJobTitle() {
        
        ADVSMS__Impacted_Job_Title__c oppToReturn = [Select name, Critical_Business_Issue__r.Name, Contact__r.FirstName, Contact__r.LastName, Contact__r.Account.Name, 
        Contact__r.Account.BillingStreet, Contact__r.Account.BillingCity, Contact__r.Account.BillingState, Contact__r.Account.BillingPostalCode 
        from ADVSMS__Impacted_Job_Title__c where id =:impactedJobTitleId];
        return oppToReturn;
    }
    
    public List<ADVSMS__Action_Plan__c> getApStep() {
    
        List<ADVSMS__Action_Plan__c> aps = [Select (Select Objective__c, Date__c, Action_Item__c, Key_Decision_Point__c, Completed__c 
            From ADVSMS__Action_Plan_Steps__r  Order By Date__c ASC) From Action_Plan__c Where Impacted_Job_Title__c = :impactedJobTitleId];

        return aps;

    }
    public List<ADVSMS__Sales_Call_Analysis__c> getOQ() {
    
        List<ADVSMS__Sales_Call_Analysis__c> aps = 
        [Select (Select ADVSMS__Cause_RTF__c
                        , ADVSMS__Capabilities_RTF__c
                        , ADVSMS__Proof_RTF__c 
                From ADVSMS__Opportunity_Qualifiers__r 
                Order By ADVSMS__Priority__c DESC) 
                From ADVSMS__Sales_Call_Analysis__c 
        Where Impacted_Job_Title__c = :impactedJobTitleId];
        return aps;

    }
    
    public String getNameOfSender() {
        
        String nm = UserInfo.getName();
        return nm; 
    }
   
	public tableRollUp gettableData() {
	     
	    List<ADVSMS__Action_Plan__c> aps = 
        [Select (Select Objective__c
                        , Date__c
                        , Action_Item__c
                        , Key_Decision_Point__c
                        , Completed__c 
                From ADVSMS__Action_Plan_Steps__r  
                Order By Date__c ASC) 
        From ADVSMS__Action_Plan__c 
        Where Impacted_Job_Title__c = :impactedJobTitleId];
	    
	    if(aps.size() > 0) { tableData = new tableRollUp(aps[0].Action_Plan_Steps__r); }
	   	
	    system.debug(tableData);
		return this.tableData;
	}
	
    /////////////////////
	// Helper Classes
	/////////////////////
    public class tableRollUp {
        
        List<tableRollUpTwo> tableRoll = new List<tableRollUpTwo>();
        Set<String> objectiveNames = new Set<String>();
        List<String> objectiveNamesOrd = new List<String>();
        
        public tableRollUp(List<ADVSMS__Action_Plan_Step__c> aps ) {

            for(ADVSMS__Action_Plan_Step__c thisAp:aps) {
                
                if(!objectiveNames.contains(thisAp.Objective__c)) {
                
                    objectiveNames.add(thisAp.Objective__c);
                    objectiveNamesOrd.add(thisAp.Objective__c);
                
                }               
            }
            
            for(String thisObjective:objectiveNamesOrd) {
            
                tableRollUpTwo thisTableRoll = new tableRollUpTwo(thisObjective,aps);
                tableRoll.add(thisTableRoll);
                
            }
        }
        
        public List<tableRollUpTwo> getTableRoll() {
            
        
            return this.tableRoll;
        }
        
    }
    
    public class tableRollUpTwo {
       
        public String obj; 
        public Integer objCount = 0; 
        public List<ADVSMS__Action_Plan_Step__c>    thisObjectiveSteps = new List<ADVSMS__Action_Plan_Step__c>();
        
        public tableRollUpTwo(String objective, List<ADVSMS__Action_Plan_Step__c> aps) {
            
            this.obj = objective;
            
            for(ADVSMS__Action_Plan_Step__c thisAp:aps) {
                
                if(objective == thisAp.Objective__c) {

                    thisObjectiveSteps.add(thisAp);
                    objCount++;
                }
            }
        }   
        
        public  List<ADVSMS__Action_Plan_Step__c> getSteps() {
            
            return this.thisObjectiveSteps;
        }
        
        public String getObjective() {
            
            return this.obj;
        }
        
        public Integer getobjCount() {
            
            return this.objCount;
        }
   
   }

}