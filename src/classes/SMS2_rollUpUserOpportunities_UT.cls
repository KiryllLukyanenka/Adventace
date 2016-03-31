@isTest(SeeAllData=true)
public class SMS2_rollUpUserOpportunities_UT {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class supports the Unit Tests for SMS2_rollUpUserOpportunities
	// Created 20120424 AAB / Demand Chain Systems
	// andyb@demandchainsystems.com
	// **** THIS TEST CLASS REQUIRES ACCESS TO THE ORG DATA ****
	//////////////////////////////////

	static testMethod void SMS2_rollUpUserOpportunities_unitTest() {
    
        User u = [SELECT ProfileId FROM User WHERE Id = :userInfo.getUserId()];
            
        User newSeller = new User();
        newSeller.alias='nSell';
        newSeller.email='newSeller@test.com';
        newSeller.firstname='New';
        newSeller.lastname='Seller';
        newSeller.profileid=u.ProfileId;
        newSeller.localesidkey='en_US';
        newSeller.username='newSeller@test.com';
        newSeller.timezonesidkey='America/Chicago';
        newSeller.languagelocalekey='en_US';
        newSeller.emailencodingkey='UTF-8';
        insert newSeller;
    
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;
        
        ADVSMS__TACE_Pipeline_Balancing_Algorithm__c newPBA = new ADVSMS__TACE_Pipeline_Balancing_Algorithm__c();
        newPBA.OwnerId = UserInfo.getUserId();
        newPBA.User__c = newSeller.Id;
        newPBA.Average_Deal_Size__c = 1;
        newPBA.Annual_Target__c = 1;
        newPBA.Probability_of_a_NOC_Closing__c = 20;
        newPBA.Probability_of_an_A_Becoming_a_Win__c = 20;
        newPBA.Average_Sales_Cycle_Length_months__c = 6;
        newPBA.A_B_Ratio__c = 2;
        insert newPBA;        
        
        Opportunity newOpp = new Opportunity();
        newOpp.Name = 'Test Opportunity 1';
        newOpp.OwnerId = newSeller.Id;
        newOpp.AccountId = newAccount.Id;
        newOpp.StageName = '(A) Power Promoter';
        newOpp.closeDate = System.Today();
        newOpp.ADVSMS__NOC_Date__c = System.Today();
        newOpp.amount = 100;
        insert newOpp;
        
        newOpp.StageName = '(A+) Power Promoter';
        update newOpp;
        
        newOpp.StageName = '(B) Promoter';
        update newOpp;
        
        newOpp.StageName = '(C) Candidate';
        update newOpp;
        
        newOpp.StageName = '(NL) Near Loss';
        update newOpp;        
        
        newOpp.StageName = '(NW) Near Win';
        update newOpp;
        
        newOpp.StageName = '(W) Win';
        update newOpp;  
        
        newOpp.closeDate = System.Today().addMonths(1);
        newOpp.StageName = '(A) Power Promoter';
        update newOpp;
        
        newOpp.closeDate = System.Today().addMonths(1);        
        newOpp.StageName = '(A+) Power Promoter';
        update newOpp;
        
        newOpp.closeDate = System.Today().addMonths(1);
        newOpp.StageName = '(NW) Near Win';
        update newOpp;
        
//        newOpp.closeDate = System.Today().addMonths(1);
//        newOpp.StageName = '(W) Win';
//        update newOpp;
        
        newOpp.closeDate = System.Today().addMonths(2);
        newOpp.StageName = '(A) Power Promoter';
        update newOpp;
        
        newOpp.closeDate = System.Today().addMonths(2);        
        newOpp.StageName = '(A+) Power Promoter';
        update newOpp;
        
        newOpp.closeDate = System.Today().addMonths(2);
        newOpp.StageName = '(NW) Near Win';
        update newOpp;
        
//        newOpp.closeDate = System.Today().addMonths(2);
//        newOpp.StageName = '(W) Win';
//        newOpp.Amount = 100;
//        update newOpp;
                
        delete newOpp;
    
    }

    //added by EBG/DCS on 20151123 to test new future method
    static testMethod void SMS2_rollUpUserOpportunities_buildPipeline_unitTest() {
        User newSeller = ADVSMS.SMS2_rollUpUserOpportunities_UT.createSellerUser();
        system.debug('*** newSeller:\n' + newSeller);

        ADVSMS__TACE_Pipeline_Balancing_Algorithm__c newPipeline
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createPipelineRecord(newSeller);
        system.debug('*** newPipeline:\n' + newPipeline);

        Account oAcct = ADVSMS.SMS2_rollUpUserOpportunities_UT.createAccount();
        system.debug('*** oAcct:\n' + oAcct);

        List<Opportunity> lstOpps_A 
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A) Power Promoter'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 1);
        lstOpps_A.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A) Power Promoter'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 2));
        lstOpps_A.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A) Power Promoter'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 3));
        system.debug('*** lstOpps_A.size(): ' + lstOpps_A.size());

        List<Opportunity> lstOpps_APlus
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A+) Power Promoter'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 10);
        lstOpps_APlus.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A+) Power Promoter'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 20));
        lstOpps_APlus.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(A+) Power Promoter'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 30));
        system.debug('*** lstOpps_APlus.size(): ' + lstOpps_APlus.size());

        List<Opportunity> lstOpps_NW
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NW) Near Win'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 100);
        lstOpps_NW.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NW) Near Win'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 200));
        lstOpps_NW.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NW) Near Win'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 300));
        system.debug('*** lstOpps_NW.size(): ' + lstOpps_NW.size());

        List<Opportunity> lstOpps_W
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(W) Win'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 1.5);
/*
        lstOpps_W.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(W) Win'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 2.5));            
        lstOpps_W.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(W) Win'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 3.5)); 
*/                                                                                   
        system.debug('*** lstOpps_W.size(): ' + lstOpps_W.size());
        system.debug('*** lstOpps_W:\n' + lstOpps_W);

        List<Opportunity> lstOpps_NL
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NL) Near Loss'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 15);
        lstOpps_NL.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NL) Near Loss'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 25));
        lstOpps_NL.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(NL) Near Loss'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 35));
        system.debug('*** lstOpps_NL.size(): ' + lstOpps_NL.size());

        List<Opportunity> lstOpps_B
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(B) Promoter'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 150);
        lstOpps_B.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(B) Promoter'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 250));
        lstOpps_B.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(B) Promoter'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 350));
        system.debug('*** lstOpps_B.size(): ' + lstOpps_B.size());


        List<Opportunity> lstOpps_C
            = ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(C) Candidate'
                                                                        , Date.today()
                                                                        , Date.today()
                                                                        , 1500);
        lstOpps_C.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(C) Candidate'
                                                                        , Date.today().addMonths(1)
                                                                        , Date.today().addMonths(1)
                                                                        , 2500));
        lstOpps_C.addAll(ADVSMS.SMS2_rollUpUserOpportunities_UT.createOpportunities(5
                                                                        , oAcct.Id
                                                                        , newSeller.Id
                                                                        , '(C) Candidate'
                                                                        , Date.today().addMonths(2)
                                                                        , Date.today().addMonths(2)
                                                                        , 3500));
        system.debug('*** lstOpps_C.size(): ' + lstOpps_C.size());


        Set<String> ownerIds = new Set<String>();
        ownerIds.add((String)newSeller.Id);

        Test.startTest();
        system.debug('*** Before calling buildPipelineForUsers');
        //ADVSMS.SMS2_rollUpUserOpportunities sca = new ADVSMS.SMS2_rollUpUserOpportunities(ownerIds);
        ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers(ownerIds);
        system.debug('*** After calling buildPipelineForUsers');
        Test.stopTest();
    }

    

    //creates a user to be be linked to a pipeline record
    public static User createSellerUser() {
        User newSeller = new User();
        newSeller.alias='nSell';
        newSeller.email='newSeller@test.com';
        newSeller.firstname='New';
        newSeller.lastname='Seller';
        newSeller.profileid=userInfo.getProfileId();
        newSeller.localesidkey='en_US';
        newSeller.username='newSeller@test.com';
        newSeller.timezonesidkey='America/Chicago';
        newSeller.languagelocalekey='en_US';
        newSeller.emailencodingkey='UTF-8';
        insert newSeller;
        return newSeller;        
    }

    //creates a pipeline record
    public static ADVSMS__TACE_Pipeline_Balancing_Algorithm__c createPipelineRecord(User seller) {
        ADVSMS__TACE_Pipeline_Balancing_Algorithm__c newPBA = new ADVSMS__TACE_Pipeline_Balancing_Algorithm__c();
        newPBA.OwnerId = seller.Id;
        newPBA.User__c = seller.Id;
        newPBA.Average_Deal_Size__c = 1;
        newPBA.Annual_Target__c = 1;
        newPBA.Probability_of_a_NOC_Closing__c = 20;
        newPBA.Probability_of_an_A_Becoming_a_Win__c = 20;
        newPBA.Average_Sales_Cycle_Length_months__c = 6;
        newPBA.A_B_Ratio__c = 2;
        insert newPBA;
        return newPBA;
    }

    //creates an account record
    public static Account createAccount() {
        Account newAccount = new Account();
        newAccount.Name = 'Test Account 1';
        insert newAccount;
        return newAccount;
    }

    //creates opportunities under the given account and owner with the given stage, close date, and NOC Date
    public static List<Opportunity> createOpportunities(Integer recCount
                                                        , Id accountId
                                                        , Id ownerId
                                                        , String stage
                                                        , Date dtCloseDate
                                                        , Date dtNocDate
                                                        , Decimal amount) {
        List<Opportunity> lstRecs = new List<Opportunity>();
        for (Integer i=1; i<=recCount; i++) {
            Opportunity oRec = new Opportunity();
            oRec.Name = 'Opp' + i + ' - ' + stage;
            oRec.AccountId = accountId;
            oRec.OwnerId = ownerId;
            oRec.StageName = stage;
            oRec.CloseDate = dtCloseDate;
            oRec.ADVSMS__NOC_Date__c = dtNocDate;
            oRec.Amount = amount;
            lstRecs.add(oRec);
        }

        insert lstRecs;
        return lstRecs;

    }

}