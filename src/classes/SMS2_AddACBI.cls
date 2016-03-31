public with sharing class SMS2_AddACBI {
	
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////
	
    public ADVSMS__Critical_Business_Issue__c cbi;
    public String r2 = ApexPages.currentPage().getParameters().get('r');
    public String parentId = ApexPages.currentPage().getParameters().get('ret');
    public ID oppId = ApexPages.currentPage().getParameters().get('opp');
    public ID jt = ApexPages.currentPage().getParameters().get('jt');
    
    ///////////////////////////////
	// Constructors
	///////////////////////////////
    
    public SMS2_AddACBI(ApexPages.StandardController stdController) {
        this.cbi = (ADVSMS__Critical_Business_Issue__c)stdController.getRecord();
        this.cbi.job_title__c = jt;
    }
    
    ///////////////////////////////
	// GETers
	///////////////////////////////
    
    public string getJobName() {
        
        ADVSMS__Job_Title__c njt = [Select Id, Name from ADVSMS__Job_Title__c where Id = :jt];
        return njt.name;
    
    }
    
    public String getRef() { return r2; }
    
    ///////////////////////////////
	// Action Methods
	///////////////////////////////
    
    public PageReference save2() {
        
        Boolean saveRecord = true;

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Critical_Business_Issue__c.fields.Name.isCreateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            System.Debug('**** CRUD/FLS FAIL ****');
            return null;
        }
        
        if(cbi.Name != null && cbi.Name.length() >= 1) {
            
            insert cbi;
        
        } else {
            saveRecord = false;
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.ERROR, 'Name of critical business issue is required');
            ApexPages.addMessage(er);
        }

        /// Save and redirect back to that IJT
        if(saveRecord) {
            
            PageReference pg;
     
            if(this.parentId == '999' || this.parentId == null) {
                
               pg = new PageReference(r2);
            
            } else {                
                
                Impacted_Job_Title__c ijt = [Select Id from ADVSMS__Impacted_Job_Title__c where Id = :parentId];
                pg = new ApexPages.StandardController(ijt).edit();
                
            }
            
            pg.setRedirect(true);
            return pg;
        
        } else {
            
            return null;
        }
    }  

    public PageReference cancel2() {
        
        /// Save and redirect back to that IJT
 
        PageReference pg;   
        if(this.parentId == null || this.parentId == '999') {
            
            pg = new PageReference(r2);
        
        } else {            
             
            Impacted_Job_Title__c ijt = [Select Id from ADVSMS__Impacted_Job_Title__c where Id = :this.parentId];
            pg = new ApexPages.StandardController(ijt).edit();
                
        }
        
        pg.setRedirect(true);
        return pg;
    }  

}