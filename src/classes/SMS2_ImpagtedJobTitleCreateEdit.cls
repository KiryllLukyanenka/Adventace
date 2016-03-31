public with sharing class SMS2_ImpagtedJobTitleCreateEdit {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
/*   CHANGE  HISTORY
*   =============================================================================
*   Date        Name            Description
*   20120424    AAB / DCS       Updated
*   20150522    EBG / DCS       Added Vertical field
*   20150522    EBG / DCS       Added Vertical field
*   =============================================================================
*/

    public ADVSMS__Impacted_Job_Title__c ijt;
    public String SelJobTitle = null;
    public String causeJTI = null;
    public String causeJTI2 = null;
    public String causeJTI3 = null;
    public String selCBI = null;
    public String saveOrUpdate = null;
    public String selVertical {get;set;}
    public Boolean bolShowVertical {get;set;}
    public Boolean bolShowNewTitleLink = false;
    public Boolean bolShowNewCBILink = false;
    public List<SelectOption> lstVerticalOptions {get;set;}
    public List<SelectOption> lstJTOptions {get;set;}
    public String opportunityId {get;set;}
    public Opportunity oppRecord {get;set;}
    public Boolean bolShowDebug {get;set;}
    
    /////////////////////
	// Controller
	/////////////////////    
    public SMS2_ImpagtedJobTitleCreateEdit(ApexPages.StandardController stdController) {
        system.debug('\n\n***Inside constructor');
        ID thisId = ApexPages.currentPage().getParameters().get('id');
        bolShowDebug = false;
        if(ApexPages.currentPage().getParameters().get('dbg') == 'true') {
            bolShowDebug = true;
        }
        
        if(thisId != null) {            
            this.saveOrUpdate = 'update';
            this.ijt = [Select Id
                                , Name
                                , Order__c
                                , Impacted_2__c
                                , Impacted_3__c
                                , Type_of_buyer__c
                                , Sales_Call_Analysis_Created__c
                                , Sales_Call_Status__c
                                , Job_Title__c
                                , Impacts__c
                                , Critical_Business_Issue__c
                                , Opportunity__c
                                , Opportunity__r.Vertical__c
                                , Contact__c 
                                , Vertical__c
                        from ADVSMS__Impacted_Job_Title__c 
                        Where Id = :thisId];        
        } else {            
            this.saveOrUpdate = 'save';
            this.ijt = (ADVSMS__Impacted_Job_Title__c)stdController.getRecord();
        }

        //if we don't have an opportunity, see if we can find it in the parameters so
        // we can pull fields from the opportunity
        opportunityId = this.ijt.Opportunity__c;
        oppRecord = new Opportunity();
        system.debug('\n\n***opportunityId: ' + opportunityId);
        if (opportunityId == null || opportunityId == '') {
            opportunityId = this.findOpportunityId(ApexPages.currentPage().getParameters());
        }
        oppRecord = this.findOppRecord(opportunityId);
        system.debug('\n\n***Found opp record: ' + oppRecord);

        //retrieve the vertical dropdown
        lstVerticalOptions = getavailVerticals();
        bolShowVertical = (lstVerticalOptions.size() > 1);

        //display either the vertical value stored with the record or the vertical from the opportunity
        if (bolShowVertical) {
            if (this.ijt.Vertical__c != null) {
                selVertical = this.ijt.Vertical__c;
            } else if (oppRecord != null && oppRecord.Vertical__c != null) {
                selVertical = oppRecord.Vertical__c;
            } else {
                selVertical = '999';
            }
            //if only one vertical is available (list will have 2 entries because the first entry is '999')
            // and this is a new record, display the one available vertical
            if (lstVerticalOptions.size() == 2) {
                selVertical = lstVerticalOptions[1].getValue();
            }
            //disable the links to create job titles and critical business issues
            //They are enables as the picklists are loaded
            bolShowNewTitleLink = false;
            bolShowNewCBILink = false;
        }

        if (bolShowVertical == false || selVertical != null) {
            lstJTOptions = getJobTitles(selVertical);
        }

        getSelJobTitle();
        if (SelJobTitle != null && SelJobTitle != '999') {
            bolShowNewCBILink = true;
        }


    }
    
    /////////////////////
	// GETers
	/////////////////////
    
    public ADVSMS__Impacted_Job_Title__c getitj() { return this.ijt; }

    public Boolean getBolShowNewTitleLink() {
        if (Schema.sObjectType.ADVSMS__Job_Title__c.isCreateable()) {
            return bolShowNewTitleLink;
        } else {
            return false;
        }
    }

    public Boolean getBolShowNewCBILink() {
        if (Schema.sObjectType.ADVSMS__Critical_Business_Issue__c.isCreateable()) {
            return bolShowNewCBILink;
        } else {
            return false;
        }
    }


    ////////////////////////////////////////////////////////
    // find job title associated to the given vertical id
    ////////////////////////////////////////////////////////
    public List<SelectOption> getJobTitles(String verticalId) {        
        List<SelectOption> options = new List<SelectOption>();
        bolShowNewTitleLink = false;
        bolShowNewCBILink = false;
        /// Iterate through the list and create the pick list
        options.add(new SelectOption('999','-None-'));
        
        for(ADVSMS__Job_Title__c oRec : [Select Id
                                                , Name
                                        FROM ADVSMS__Job_Title__c
                                        Where ADVSMS__Vertical__c = :verticalId
                                            And ADVSMS__Active__c = true
                                        Order By Name ASC LIMIT 1000]) {
            options.add(new SelectOption(oRec.Id, oRec.Name));
        }
        if (verticalId != null && verticalId != '999') {
            bolShowNewTitleLink = true;
        } else {
            SelJobTitle = null;
        }
        return options;
    }    

    public String getSelJobTitle() {
        if(ijt.job_title__c != null) {        
            if(SelJobTitle == null) {                
                SelJobTitle = ijt.job_title__c;                
                return SelJobTitle;                
            } else {                
                return SelJobTitle;
            }             
        } else {      
            return SelJobTitle;
        }
        
    }
       
    public void setSelJobTitle(String SelJobTitle) {        
        this.SelJobTitle = SelJobTitle;
    }
    
	public String getcauseJTI() {      
		if(ijt.Impacts__c != null) {        
            if(causeJTI == null) {                
                causeJTI = ijt.Impacts__c;                
                return causeJTI;                
            } else {                
                return causeJTI;
            }             
		} else {
            return causeJTI;
		}
	}
    
	public String getcauseJTI2() {	  
	   if(ijt.Impacted_2__c != null) {	    
	        if(causeJTI2 == null) {	            
	            causeJTI2 = ijt.Impacted_2__c;	            
	            return causeJTI2;	            
	        } else {	            
	            return causeJTI2;
	        }
	         
	   } else {	   
	        return causeJTI2;
	   }
	}

     public String getcauseJTI3() {      
       if(ijt.Impacted_3__c != null) {        
            if(causeJTI3 == null) {                
                causeJTI3 = ijt.Impacted_3__c;                
                return causeJTI3;                
            } else {                
                return causeJTI3;
            }             
       } else {               
            return causeJTI3;
       }
    }
 
    public void setcauseJTI3(String causeJTI3) { this.causeJTI3 = causeJTI3; }
   
    public void setcauseJTI2(String causeJTI2) { this.causeJTI2 = causeJTI2; }
   
    public void setcauseJTI(String causeJTI) { this.causeJTI = causeJTI; }

    public String getselCBI() {      
        if(ijt.Critical_Business_Issue__c != null) {        
            if(selCBI == null) {                
                selCBI = ijt.Critical_Business_Issue__c;                
                return selCBI;                
            } else {                
                return selCBI;
            }
             
       } else {
            return selCBI;        
        }
    }
        
    public void setselCBI(String selCBI) { this.selCBI = selCBI; }
    
    public void loadCBI() {
        selCBI = '999';
        bolShowNewCBILink = false;
        if (SelJobTitle != null && SelJobTitle != '999') {
            bolShowNewCBILink = true;
        }
    }

    /****************************************************************
    ** Retreive Job Titles associated to the given vertical
    ****************************************************************/
    public void loadJT() {
        SelJobTitle = '999';
        selCBI = '999';
        bolShowNewCBILink = false;
        lstJTOptions = getJobTitles(selVertical);        
        system.debug('\n\n***Inside loadJT.\nselVertical: ' + selVertical + '\n lstJTOptions: ' + lstJTOptions);
    }

    /****************************************************************
    ** Find all active verticals plus the vertical on the currently
    **  selected Impact Job Title (even if the vertical is inactive)
    ****************************************************************/
    public List<SelectOption> getavailVerticals() {        
        List<SelectOption> options = new List<SelectOption>();        
        List<ADVSMS__Vertical__c> lstRecs = [Select Id
                                                    , Name 
                                                    , ADVSMS__Active__c
                                            from ADVSMS__Vertical__c  
                                            Order By Name ASC];
        
        options.add(new SelectOption('999','-Select-'));
        /// Iterate through the list and create the initial pick list
        for(ADVSMS__Vertical__c oRec : lstRecs) {
            if (oRec.ADVSMS__Active__c == true 
                    || (this.ijt.Vertical__c != null
                            && oRec.Id == this.ijt.Vertical__c)) {       
                options.add(new SelectOption(oRec.Id, oRec.name));                 
            }
        }        
        return options;
    } 

    public List<SelectOption> getavailCBI() {        
        bolShowNewCBILink = false;
        List<SelectOption> options = new List<SelectOption>();        
        if(this.SelJobTitle != null) {
            List<ADVSMS__Critical_Business_Issue__c> allCBI = [Select Id
                                                                    , Name 
                                                                from ADVSMS__Critical_Business_Issue__c 
                                                                Where Job_title__c = :SelJobTitle  
                                                                Order By Name ASC];
            
            options.add(new SelectOption('999','-Select-'));
            /// Itterate through the list and creat the initial pick list
            for(ADVSMS__Critical_Business_Issue__c cbi:allCBI) {                
                options.add(new SelectOption(cbi.Id,cbi.name));                 
            }
            if (this.SelJobTitle != '999') {
                bolShowNewCBILink = true;
            }
        }
        return options;
    } 

    public List<SelectOption> getavailJTI() {         
        List<SelectOption> options = new List<SelectOption>();        
        List<ADVSMS__Impacted_Job_Title__c> allJTI = [Select Id
                                                            , Name 
                                                        from ADVSMS__Impacted_Job_Title__c 
                                                        Where Opportunity__c  = :ijt.Opportunity__c 
                                                        Order By Name ASC];
            
        options.add(new SelectOption('999','-Select-'));
        /// Iterate through the list and create the initial pick list
        for(Impacted_Job_Title__c ljti:allJTI) {
                options.add(new SelectOption(ljti.Id,ljti.name)); 
        }            
        return options;        
    }
    
    /////////////////////
	// Action Methods
	/////////////////////

    public PageReference addAJobTitle() {
        PageReference pg = Page.SMS2_AddAJobTitle;        
        if(this.saveOrUpdate == 'update') {            
            pg.getParameters().put('ret',this.ijt.id);           
        } else {            
            String re = String.valueOf(ApexPages.currentPage().getUrl());
            re = EncodingUtil.urlEncode(re, 'UTF-8');
            pg.getParameters().put('r',re);   
        }
         
        pg.getParameters().put('opp',this.ijt.Opportunity__c);
        pg.getParameters().put('vert',this.selVertical);
        pg.setRedirect(true);
        return pg;
    }

     public PageReference addACBI() {                
        /// NEED TO PUT IN A CONTROL HERE TO MAKE SURE
        // 'jt' IS NOT 999        
        if(SelJobTitle == '999') {            
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.FATAL, 'You must have a job title selected');
            ApexPages.addMessage(er);
            return null;
        }
        
        
        PageReference pg = Page.SMS2_AddACBI;
        pg.getParameters().put('jt',SelJobTitle); 
        pg.getParameters().put('opp',this.ijt.Opportunity__c);
        
        if(this.saveOrUpdate == 'update') {            
            pg.getParameters().put('ret',this.ijt.id);           
        } else {            
            String re = String.valueOf(ApexPages.currentPage().getUrl());
            re = EncodingUtil.urlEncode(re, 'UTF-8');
            pg.getParameters().put('r',re);   
        }
        
        pg.setRedirect(true);
        return pg; 
    }

    public PageReference cancel2() {        
        PageReference pg = new PageReference('/' + ijt.Opportunity__c);
        pg.setRedirect(true);
        return pg;
    }

    public PageReference save2() {        
        Boolean saveRecord = true;

        if (bolShowVertical && selVertical != null && selVertical != '999') {
            ijt.vertical__c = selVertical;
        } else if(bolShowVertical && (selVertical == null || selVertical ==  '999')) {            
            saveRecord = false;
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.FATAL, 'Vertical is required');
            ApexPages.addMessage(er);
        }        
         
        if(SelJobTitle != null && SelJobTitle !=  '999' ) {            
            ijt.job_title__c = SelJobTitle;
            Job_Title__c thisTitle = [Select Id, Name from ADVSMS__Job_Title__c where Id = :SelJobTitle];
            ijt.name = thisTitle.Name;
        } else {
            saveRecord = false;
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.FATAL, 'Job title is required');
            ApexPages.addMessage(er);
        } 
        
        if(selCBI != null  && selCBI !=  '999') {            
            ijt.Critical_Business_Issue__c = selCBI;
        } else {
            saveRecord = false;
            ApexPages.Message er = new ApexPages.Message(ApexPages.severity.FATAL, 'Critical business issue is required');
            ApexPages.addMessage(er);
        }

        System.Debug('causeJTI = ' + causeJTI);
        
        if(causeJTI != null) {
            if(causeJTI !=  '999') {
                ijt.Impacts__c = causeJTI;
            } else {
                ijt.Impacts__c = null;                
            }
        }         
        
        if(causeJTI2 != null ) {
            if(causeJTI2 !=  '999') {
                ijt.Impacted_2__c = causeJTI2;
            } else {
                ijt.Impacted_2__c = null;                
            }            
        } 
        
        if(causeJTI3 != null) {            
            if(causeJTI3 !=  '999') {
                ijt.Impacted_3__c = causeJTI3;
            } else {
                ijt.Impacted_3__c = null;                
            }
        }       
        
        if(saveRecord) {            
            try{                
                if(this.saveOrUpdate == 'update') {
                    // Check for CRUD/FLS
                    if(!Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Order__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_2__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_3__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Type_of_buyer__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Sales_Call_Analysis_Created__c.isUpdateable() || 
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Sales_Call_Status__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.job_title__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacts__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Critical_Business_Issue__c.isUpdateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Contact__c.isUpdateable()) {

                       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
                       System.Debug('**** CRUD/FLS FAIL ****');
                    } else {
                        update ijt;
                        system.debug('\n\n***Updated ijt:\n' + ijt);
                    }
                } else {
                     // Check for CRUD/FLS
                    if(!Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Order__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_2__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_3__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Type_of_buyer__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Sales_Call_Analysis_Created__c.isCreateable() || 
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Sales_Call_Status__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.job_title__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacts__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Critical_Business_Issue__c.isCreateable() ||
                        !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Contact__c.isCreateable()) {

                       ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
                       System.Debug('**** CRUD/FLS FAIL ****');
                    } else {
                        insert ijt;
                        system.debug('\n\n***Inserted ijt:\n' + ijt);

                        //update the opportunity with the IJT's vertical if the opp does not have a vertical
                        if (ijt.Vertical__c != null 
                                && oppRecord != null 
                                && oppRecord.Vertical__c == null) {
                            oppRecord.Vertical__c = ijt.Vertical__c;
                            update oppRecord;
                        }
                    }                          
                }
                    
                PageReference pg = new PageReference('/' + ijt.Opportunity__c);
                pg.setRedirect(true);
                return pg;
            
            } catch(DmlException ex){                
                ApexPages.addMessages(ex);
                return null;
            }
        } else {            
            return null;            
        }
    }

    //given the map of parameters passed into the page find the opportunity id (if passed in)
    private string findOpportunityId(Map<String, String> mapParams) {
        string retVal = null;
        for (String s : mapParams.keySet()) {
            system.debug('\n\n***Param: ' + s + ' --> ' + mapParams.get(s) 
                            + '\ncontains(_lkid): ' + s.contains('_lkid'));
            if (s.contains('_lkid')) {
                system.debug('\n\nFound lookup:' + mapParams.get(s).substring(0, 3));
                if (mapParams.get(s).substring(0, 3) == '006') {
                    retVal = mapParams.get(s);
                    break;
                }
            }
        }
        return retVal;
    }

    //given an oppportunity id, return the opportunity record
    private Opportunity findOppRecord(String oppId) {
        system.debug('\n\n***Inside findOppRecord: ' + oppId);
        Opportunity retVal = null;
        if (oppId != null) {
            for (Opportunity o : [Select Id
                                        , Vertical__c 
                                    From Opportunity 
                                    Where Id = :oppId]) {
                retVal = o;
            }
        }
        return retVal;
    }
}