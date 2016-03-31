public with sharing class SMS2_addAJobTitlePage {
  
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////
	
    public ADVSMS__Job_Title__c jt;
    public String parentId = ApexPages.currentPage().getParameters().get('ret');
    public ID oppId = ApexPages.currentPage().getParameters().get('opp');
    public ID verticalId = ApexPages.currentPage().getParameters().get('vert');
    public String r2 =  ApexPages.currentPage().getParameters().get('r');
    
    ///////////////////////////////
	// Constructors
	///////////////////////////////    	
    public SMS2_addAJobTitlePage(ApexPages.StandardController stdController) {
        this.jt = (ADVSMS__Job_Title__c)stdController.getRecord();
        this.jt.ADVSMS__Vertical__c = this.verticalId;
    }
    
    ///////////////////////////////
	// GETers
	/////////////////////////////// 
    
    public String getparentId() { return 'PI: ' + this.parentId; }
    
    ///////////////////////////////
	// Action methods
	/////////////////////////////// 
    
    public PageReference save2() {
        Boolean saveRecord = true;

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Job_Title__c.fields.Name.isCreateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            System.Debug('**** CRUD/FLS FAIL ****');
            return null;
        }
        
        if(jt.Name != null && jt.Name.length() >= 1) {
            
            insert jt;
        
        } else {
            saveRecord = false;
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.ERROR, 'Name Job Title is required');
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
        if(this.parentId == null) {
            
           pg = new PageReference(r2);
        
        } else {            
             
            ADVSMS__Impacted_Job_Title__c ijt = [Select Id from ADVSMS__Impacted_Job_Title__c where Id = :this.parentId];
            pg = new ApexPages.StandardController(ijt).edit();            
            
        }
        
        pg.setRedirect(true);
        return pg;
    }

}