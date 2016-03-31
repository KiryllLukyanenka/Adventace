public global with sharing class SMS2_chart {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////	

    public global List<createImpactedJob> ijt = new List<createImpactedJob>();
    public ID oppId = ApexPages.currentPage().getParameters().get('id');

	///////////////////////
	// Constructor
	///////////////////////
	
	///////////////////////
	// GETers
	///////////////////////
	
	public List<createImpactedJob> getImpactedJobs() {

        if(ijt.size() == 0) {

            Integer i = 0;
            Integer height = 10;
            Integer fromLeft = 10;
            List<ADVSMS__Impacted_Job_Title__c> impactedJobs = [SELECT x_plan__c, y_plan__c, x__c, y__c, Name, Contact__r.FirstName, Contact__r.LastName, Contact__c, 
                    Critical_business_issue__c, Critical_business_issue__r.Name, Impacts__c, Impacted_2__c ,Impacted_3__c 
                    from ADVSMS__Impacted_Job_Title__c Where Opportunity__c = :oppId Order BY Order__c ASC];

            System.Debug('INITIAL QUERY RETURN SIZE = ' + impactedJobs.size());
            System.Debug(impactedJobs);


            
            for(ADVSMS__Impacted_Job_Title__c thisijt:impactedJobs) {
                
                createImpactedJob it = new createImpactedJob(thisijt,impactedJobs,height,fromLeft,i);
                ijt.add(it);
                fromLeft += 200;
                height += 100;
                i++;
            } 
            
            System.Debug('RETURNED LIST SIZE = ' + ijt.size());
        }

        return ijt;
    }
    
    
    public List<String> getImpactedJobConnections() {
        
        List<ADVSMS__Impacted_Job_Title__c> impactedJobs = [Select Name, Impacts__c,Impacted_2__c,Impacted_3__c,Critical_Business_Issue__c 
            from ADVSMS__Impacted_Job_Title__c Where Opportunity__c = :oppId];
        
        List<String> boxJobs = new List<String>(); 
        
        for(ADVSMS__Impacted_Job_Title__c ijt:impactedJobs) {
            
            if(ijt.Impacts__c != null) {
                
                boxJobs.add(ijt.Id +''+ ijt.Critical_Business_Issue__c  + ' '+  ijt.Impacts__c + ''+  ijt.id);
            
            }
            
            if(ijt.Impacted_2__c != null) {
                    
                boxJobs.add(ijt.Id +''+ ijt.Critical_Business_Issue__c  + ' '+  ijt.Impacted_2__c + ''+  ijt.id);
                
            }
            
            if(ijt.Impacted_3__c != null) {
                    
                boxJobs.add(ijt.Id +''+ ijt.Critical_Business_Issue__c  + ' '+  ijt.Impacted_3__c + ''+  ijt.id);
                
            }
        }
        
        return boxJobs;
    }
	
	///////////////////////
	// Action Methods
	///////////////////////

    public void doNothing() { }
    
    public PageReference retOpp() {
        
        PageReference pageRef = new PageReference('/' + ApexPages.currentPage().getParameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
        
    }
    public PageReference lock() {
        
        system.debug('IJT SIZE:'  + this.ijt.size());

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.x_plan__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.y_plan__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.x__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.y__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Name.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Contact__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Critical_business_issue__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacts__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_2__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.Impacted_3__c.isUpdateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            return null;
        }
        
        List<ADVSMS__Impacted_Job_Title__c> lstUpdateIJTs = new List<ADVSMS__Impacted_Job_Title__c>();
        for(createImpactedJob thisijt:ijt) {
            System.Debug(thisijt.ijt);

                lstUpdateIJTs.add(thisijt.ijt);
                //update thisijt.ijt;
        }

        if(lstUpdateIJTs.size() > 0) { update lstUpdateIJTs; }
        
        PageReference pageRef = new PageReference('/' + ApexPages.currentPage().getParameters().get('id'));
        pageRef.setRedirect(true);
        return pageRef;
        
    }

	///////////////////////
	// Helper Classes
	///////////////////////
    global class createImpactedJob {
        
        public List<createCauses> causes = new List<createCauses>();
        public global ADVSMS__Impacted_Job_Title__c ijt;
        public Integer height;
        public Integer fromLeft;
        public String i;
        public String x;
        public String y;
        
        public createImpactedJob(ADVSMS__Impacted_Job_Title__c thisImpactedJob, List<ADVSMS__Impacted_Job_Title__c> allImpactedJobs, Integer height, Integer fromLeft, Integer i) {
            this.i = String.valueOf(i);
            this.ijt = thisImpactedJob;
            this.height = height;
            this.fromLeft = fromLeft;
            this.y = thisImpactedJob.y__c;
            this.x = thisImpactedJob.x__c ;
            
            for(ADVSMS__Impacted_Job_Title__c ijtLoop:allImpactedJobs) {
                            
                if(ijtLoop.Impacts__c == thisImpactedJob.Id) {
                    createCauses thisCause = new createCauses(thisImpactedJob,ijtLoop);
                    causes.add(thisCause);
                }
                    
                if(ijtLoop.Impacted_2__c == thisImpactedJob.Id) {
                    createCauses thisCause = new createCauses(thisImpactedJob,ijtLoop);
                    causes.add(thisCause);
                }   
                
                if(ijtLoop.Impacted_3__c == thisImpactedJob.Id) {
                    createCauses thisCause = new createCauses(thisImpactedJob,ijtLoop);
                    causes.add(thisCause);
                }   
                
            }
        } 
        
        public  Integer geth() {
            
            return this.height;
        }
         public  Integer getfromLeft() {
            
            return this.fromLeft;
        }
        public Impacted_Job_Title__c getijt() {
            
            return this.ijt; 
        }

        public void setijt(ADVSMS__Impacted_Job_Title__c ijt) {
            
            this.ijt = ijt;
        }
        public List<createCauses> getCauses(){
        
            return this.causes;  
        }
        
        public string geti() {
            
            return i;
        }
        
        public string getx() {
            
            return this.x;
        }
        public string gety() {
            
            return this.y;
        }

    }
    
    public class createCauses{

        public string causeID;   
        public string cause;
        public createCauses(ADVSMS__Impacted_Job_Title__c ijt, ADVSMS__Impacted_Job_Title__c cause){
        
            this.causeID = ijt.id +''+ cause.id;
            this.cause = cause.ADVSMS__Critical_business_issue__r.Name;
    
        }
        
        public String getcauseId() {
            
            return this.causeID;
        }
        
        public String getcause() {
        
            return this.cause;  
        }
        
    }    
}