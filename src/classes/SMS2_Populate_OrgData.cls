public with sharing class SMS2_Populate_OrgData {

    public static void populate_data(){
        if(Schema.sObjectType.Account.fields.Name.isCreateable() &&
           Schema.sObjectType.Account.fields.Type.isCreateable() &&
           Schema.sObjectType.Account.fields.BillingStreet.isCreateable() &&
           Schema.sObjectType.Account.fields.BillingCity.isCreateable() &&
           Schema.sObjectType.Account.fields.BillingState.isCreateable() &&
           Schema.sObjectType.Account.fields.BillingCountry.isCreateable() &&
           Schema.sObjectType.Account.fields.BillingPostalCode.isCreateable() &&
           Schema.sObjectType.Account.fields.Phone.isCreateable() &&
           Schema.sObjectType.Contact.fields.AccountId.isCreateable() &&
           Schema.sObjectType.Contact.fields.Salutation.isCreateable() &&
           Schema.sObjectType.Contact.fields.FirstName.isCreateable() &&
           Schema.sObjectType.Contact.fields.LastName.isCreateable() &&
           Schema.sObjectType.Contact.fields.Title.isCreateable() &&
           Schema.sObjectType.Contact.fields.Email.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.Name.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.AccountId.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.Amount.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.StageName.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.Probability.isCreateable() &&
           Schema.sObjectType.Opportunity.fields.CloseDate.isCreateable() &&
           Schema.sObjectType.ADVSMS__Job_Title__c.fields.Name.isCreateable() &&
           Schema.sObjectType.ADVSMS__Critical_Business_Issue__c.fields.Name.isCreateable() &&
           Schema.sObjectType.ADVSMS__Critical_Business_Issue__c.fields.ADVSMS__Job_Title__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Causes_Capabilities__c.fields.ADVSMS__Capabilities_RTF__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Causes_Capabilities__c.fields.ADVSMS__Cause_RTF__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Causes_Capabilities__c.fields.ADVSMS__Critical_Business_Issue__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Causes_Capabilities__c.fields.ADVSMS__Proof_RTF__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plans__c.fields.Name.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Global_Action_Plans__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Objective__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Key_Decision_Point__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Days_from_first_step__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Order__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Global_Action_Plan_Steps__c.fields.ADVSMS__Action_Item__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Action_Plan__c.fields.ADVSMS__Opportunity__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Action_Plan__c.fields.ADVSMS__Global_Action_Plans__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.ADVSMS__Opportunity__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.ADVSMS__Job_Title__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.ADVSMS__Critical_Business_Issue__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.ADVSMS__impacts__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Impacted_Job_Title__c.fields.ADVSMS__Impacted_2__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Sales_Call_Analysis__c.fields.Name.isCreateable() &&
           Schema.sObjectType.ADVSMS__Sales_Call_Analysis__c.fields.ADVSMS__Opportunity__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill_Analyzer_Set__c.fields.Name.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Order__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Question__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Definition__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Analyser_Set__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Comment_Title__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Overall_Parameters__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Daily_Actions__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Weekly_Actions__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Monthly_Actions__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Quarterly_Actions__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Annual_Actions__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Header_label__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Help_Table_Header__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Help_1_Header__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Help_2_Header__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill__c.fields.ADVSMS__Skill_Help_3_Header__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill_Help__c.fields.ADVSMS__Skill__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill_Help__c.fields.ADVSMS__Skill_Help_Level__c.isCreateable() &&
           Schema.sObjectType.ADVSMS__Skill_Help__c.fields.ADVSMS__Characteristic__c.isCreateable() 
           ){
            Account newAccount = new Account();
                newAccount.Name = 'Queensway Ltd';
                newAccount.Type = 'Prospect';
                newAccount.BillingStreet = '2166 Chardonnay Circle';
                newAccount.BillingCity = 'Gibsonia';
                newAccount.BillingState = 'Pennsylvania';
                newAccount.BillingCountry = 'United States';
                newAccount.BillingPostalCode = '15044';
                newAccount.Phone = '555-555-5555';
            
            try{
                insert newAccount;
            } catch (System.DmlException e){
                for(Integer i = 0; i< e.getNumDml(); i++){
                    System.debug(e.getDmlMessage(i));
                }
            }

            Contact newContact1 = new Contact();
                newContact1.AccountId = newAccount.Id;
                newContact1.Salutation = 'Mr.';
                newContact1.FirstName = 'Jon';
                newContact1.LastName = 'Anderson';
                newContact1.Title = 'Director of Engineering';
                newContact1.Email = 'bobjunke@me.com';
            Contact newContact2 = new Contact();
                newContact2.AccountId = newAccount.Id;
                newContact2.Salutation = 'Mr.';
                newContact2.FirstName = 'Steve';
                newContact2.LastName = 'Howe';
                newContact2.Title = 'Director of Sales';
                newContact2.Email = 'bobjunke@me.com';
            Contact newContact3 = new Contact();
                newContact3.AccountId = newAccount.Id;
                newContact3.Salutation = 'Mr.';
                newContact3.FirstName = 'Jeffery';
                newContact3.LastName = 'Beck';
                newContact3.Title = 'Director of Quality Assurance';
                newContact3.Email = 'bobjunke@me.com';
            Contact newContact4 = new Contact();
                newContact4.AccountId = newAccount.Id;
                newContact4.Salutation = 'Ms.';
                newContact4.FirstName = 'Ann';
                newContact4.LastName = 'Haslam';
                newContact4.Title = 'Chief Financial Officer';
                newContact4.Email = 'bobjunke@me.com';
            Contact newContact5 = new Contact();
                newContact5.AccountId = newAccount.Id;
                newContact5.Salutation = 'Mr.';
                newContact5.FirstName = 'James';
                newContact5.LastName = 'Page';
                newContact5.Title = 'Chief Executive Officer';
                newContact5.Email = 'bobjunke@me.com';
            
            try{
                insert newContact1;
                insert newContact2;
                insert newContact3;
                insert newContact4;
                insert newContact5;
            } catch (System.DmlException e){
                for(Integer i = 0; i< e.getNumDml(); i++){
                    System.debug(e.getDmlMessage(i));
                }
            }

            Opportunity newOppty1 = new Opportunity();
                newOppty1.Name = 'Queensway Ltd. Part 1';
                newOppty1.AccountId = newAccount.Id;
                newOppty1.Amount = 500000;
                newOppty1.StageName = '(A) Power Promoter';
                newOppty1.Probability = 50;
                newOppty1.CloseDate = system.today()+90;
                newOppty1.ADVSMS__NOC_Date__c = System.Today();

            Opportunity newOppty2 = new Opportunity();
                newOppty2.Name = 'Queensway Ltd. Part 2';
                newOppty2.AccountId = newAccount.Id;
                newOppty2.Amount = 500000;
                newOppty2.StageName = '(A+) Power Promoter';
                newOppty2.Probability = 75;
                newOppty2.CloseDate = system.today()+90;
                newOppty2.ADVSMS__NOC_Date__c = System.Today();
            
            try{
                insert newOppty1;
                insert newOppty2;
            } catch (System.DmlException e){
                for(Integer i = 0; i< e.getNumDml(); i++){
                    System.debug(e.getDmlMessage(i));
                }
            }

            //Add verticals here and then associate to Job Titles below
            

            ADVSMS__Job_Title__c Jtitle1 = new ADVSMS__Job_Title__c();
                Jtitle1.Name = 'Director of Engineering';
            ADVSMS__Job_Title__c Jtitle2 = new ADVSMS__Job_Title__c();
                Jtitle2.Name = 'Director of Sales';
            ADVSMS__Job_Title__c Jtitle3 = new ADVSMS__Job_Title__c();
                Jtitle3.Name = 'Director of Quality Assurance';
            ADVSMS__Job_Title__c Jtitle4 = new ADVSMS__Job_Title__c();
                Jtitle4.Name = 'Chief Financial Officer';
            ADVSMS__Job_Title__c Jtitle5 = new ADVSMS__Job_Title__c();
                Jtitle5.Name = 'Chief Executive Officer';

            insert Jtitle1;
            insert Jtitle2;
            insert Jtitle3;
            insert Jtitle4;
            insert Jtitle5;

            ADVSMS__Critical_Business_Issue__c CBIssue1 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue1.Name = 'Delayed production of new products';
                CBIssue1.ADVSMS__Job_Title__c = Jtitle1.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue2 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue2.Name = 'Missed Production Schedules';
                CBIssue2.ADVSMS__Job_Title__c = Jtitle1.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue3 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue3.Name = 'New Products Coming in Significantly Over Budget';
                CBIssue3.ADVSMS__Job_Title__c = Jtitle1.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue4 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue4.Name = 'Faulty Products Make it to Production';
                CBIssue4.ADVSMS__Job_Title__c = Jtitle3.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue5 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue5.Name = 'Declining Sales';
                CBIssue5.ADVSMS__Job_Title__c = Jtitle2.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue6 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue6.Name = 'Missing Profit Targets';
                CBIssue6.ADVSMS__Job_Title__c = Jtitle4.Id;
            ADVSMS__Critical_Business_Issue__c CBIssue7 = new ADVSMS__Critical_Business_Issue__c();
                CBIssue7.Name = 'Missing Company Growth Targets';
                CBIssue7.ADVSMS__Job_Title__c = Jtitle5.Id;

            insert CBIssue1;
            insert CBIssue2;
            insert CBIssue3;
            insert CBIssue4;
            insert CBIssue5;
            insert CBIssue6;
            insert CBIssue7;

            ADVSMS__Causes_Capabilities__c Causes1 = new ADVSMS__Causes_Capabilities__c();
                Causes1.ADVSMS__Capabilities_RTF__c = 'During the design process, R&D needs to be able to prototype realistically and reliably in a virtual 3-D environment';
                Causes1.ADVSMS__Cause_RTF__c = 'Required to develop a high number of physical prototypes to arrive at the final production design';
                Causes1.ADVSMS__Critical_Business_Issue__c = CBIssue1.Id;
                Causes1.ADVSMS__Proof_RTF__c = 'Prototype Simulation';
            ADVSMS__Causes_Capabilities__c Causes2 = new ADVSMS__Causes_Capabilities__c();
                Causes2.ADVSMS__Capabilities_RTF__c = 'When quality testing, R&D needs to be able to conduct ‘destruction testing’ on their designs from their workstations under a variety of scenarios, which they can create';
                Causes2.ADVSMS__Cause_RTF__c = 'Unable to test the quality and robust nature of the prototypes until late in the process';
                Causes2.ADVSMS__Critical_Business_Issue__c = CBIssue1.Id;
                Causes2.ADVSMS__Proof_RTF__c = 'Core Destruction Testing';
            ADVSMS__Causes_Capabilities__c Causes3 = new ADVSMS__Causes_Capabilities__c();
                Causes3.ADVSMS__Capabilities_RTF__c = 'When R&D needs to make a prototype they can ‘see’ their designs in a 3-D image, showing all aspects of the design that match production criteria';
                Causes3.ADVSMS__Cause_RTF__c = 'R&D unable to deliver final production-ready prototypes on schedule';
                Causes3.ADVSMS__Critical_Business_Issue__c = CBIssue1.Id;
                Causes3.ADVSMS__Proof_RTF__c = '3-D Virtual Prototyping';

            insert Causes1;
            insert Causes2;
            insert Causes3;

            ADVSMS__Global_Action_Plans__c GActionPlan = new ADVSMS__Global_Action_Plans__c();
                GActionPlan.Name = 'CAD Multi-Product';

            insert GActionPlan;

            ADVSMS__Global_Action_Plan_Steps__c ActionStep1 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep1.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep1.ADVSMS__Objective__c = 'Needs Assessment';
                ActionStep1.ADVSMS__Key_Decision_Point__c = false;
                ActionStep1.ADVSMS__Days_from_first_step__c = 2;
                ActionStep1.ADVSMS__Order__c = 1;
                ActionStep1.ADVSMS__Action_Item__c = 'Meet with Director of Finance';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep2 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep2.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep2.ADVSMS__Objective__c = 'Needs Assessment';
                ActionStep2.ADVSMS__Key_Decision_Point__c = false;
                ActionStep2.ADVSMS__Days_from_first_step__c = 2;
                ActionStep2.ADVSMS__Order__c = 2;
                ActionStep2.ADVSMS__Action_Item__c = 'Meet with Director of Sales';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep3 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep3.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep3.ADVSMS__Objective__c = 'Needs Assessment';
                ActionStep3.ADVSMS__Key_Decision_Point__c = false;
                ActionStep3.ADVSMS__Days_from_first_step__c = 4;
                ActionStep3.ADVSMS__Order__c = 3;
                ActionStep3.ADVSMS__Action_Item__c = 'Meet with Director of Quality Assurance';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep4 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep4.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep4.ADVSMS__Objective__c = 'Needs Assessment';
                ActionStep4.ADVSMS__Key_Decision_Point__c = false;
                ActionStep4.ADVSMS__Days_from_first_step__c = 7;
                ActionStep4.ADVSMS__Order__c = 4;
                ActionStep4.ADVSMS__Action_Item__c = 'Meet with CFO';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep5 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep5.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep5.ADVSMS__Objective__c = 'Needs Assessment';
                ActionStep5.ADVSMS__Key_Decision_Point__c = true;
                ActionStep5.ADVSMS__Days_from_first_step__c = 13;
                ActionStep5.ADVSMS__Order__c = 5;
                ActionStep5.ADVSMS__Action_Item__c = 'Meet with committee to discuss needs';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep6 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep6.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep6.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep6.ADVSMS__Key_Decision_Point__c = true;
                ActionStep6.ADVSMS__Days_from_first_step__c = 23;
                ActionStep6.ADVSMS__Order__c = 6;
                ActionStep6.ADVSMS__Action_Item__c = 'Demonstration of CADesigner Product Suite';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep7 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep7.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep7.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep7.ADVSMS__Key_Decision_Point__c = false;
                ActionStep7.ADVSMS__Days_from_first_step__c = 23;
                ActionStep7.ADVSMS__Order__c = 7;
                ActionStep7.ADVSMS__Action_Item__c = 'Send standard license agreement';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep8 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep8.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep8.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep8.ADVSMS__Key_Decision_Point__c = false;
                ActionStep8.ADVSMS__Days_from_first_step__c = 30;
                ActionStep8.ADVSMS__Order__c = 8;
                ActionStep8.ADVSMS__Action_Item__c = 'Agree to metrics to be achieved';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep9 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep9.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep9.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep9.ADVSMS__Key_Decision_Point__c = false;
                ActionStep9.ADVSMS__Days_from_first_step__c = 30;
                ActionStep9.ADVSMS__Order__c = 9;
                ActionStep9.ADVSMS__Action_Item__c = 'Develop implementation plan';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep10 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep10.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep10.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep10.ADVSMS__Key_Decision_Point__c = true;
                ActionStep10.ADVSMS__Days_from_first_step__c = 37;
                ActionStep10.ADVSMS__Order__c = 10;
                ActionStep10.ADVSMS__Action_Item__c = 'Gain approval of implementation plan';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep11 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep11.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep11.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep11.ADVSMS__Key_Decision_Point__c = false;
                ActionStep11.ADVSMS__Days_from_first_step__c = 39;
                ActionStep11.ADVSMS__Order__c = 11;
                ActionStep11.ADVSMS__Action_Item__c = 'Develop value justification';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep12 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep12.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep12.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep12.ADVSMS__Key_Decision_Point__c = true;
                ActionStep12.ADVSMS__Days_from_first_step__c = 46;
                ActionStep12.ADVSMS__Order__c = 12;
                ActionStep12.ADVSMS__Action_Item__c = 'Gain approval of value justification';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep13 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep13.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep13.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep13.ADVSMS__Key_Decision_Point__c = false;
                ActionStep13.ADVSMS__Days_from_first_step__c = 49;
                ActionStep13.ADVSMS__Order__c = 13;
                ActionStep13.ADVSMS__Action_Item__c = 'Finalize license agreement';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep14 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep14.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep14.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep14.ADVSMS__Key_Decision_Point__c = true;
                ActionStep14.ADVSMS__Days_from_first_step__c = 56;
                ActionStep14.ADVSMS__Order__c = 14;
                ActionStep14.ADVSMS__Action_Item__c = 'Reference visit';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep15 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep15.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep15.ADVSMS__Objective__c = 'Proof and Due Diligence';
                ActionStep15.ADVSMS__Key_Decision_Point__c = true;
                ActionStep15.ADVSMS__Days_from_first_step__c = 63;
                ActionStep15.ADVSMS__Order__c = 15;
                ActionStep15.ADVSMS__Action_Item__c = 'Pre-proposal review';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep16 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep16.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep16.ADVSMS__Objective__c = 'Approval';
                ActionStep16.ADVSMS__Key_Decision_Point__c = true;
                ActionStep16.ADVSMS__Days_from_first_step__c = 70;
                ActionStep16.ADVSMS__Order__c = 16;
                ActionStep16.ADVSMS__Action_Item__c = 'Gain approval and contract signing';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep17 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep17.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep17.ADVSMS__Objective__c = 'Implementation';
                ActionStep17.ADVSMS__Key_Decision_Point__c = false;
                ActionStep17.ADVSMS__Days_from_first_step__c = 84;
                ActionStep17.ADVSMS__Order__c = 17;
                ActionStep17.ADVSMS__Action_Item__c = 'Implementation kick-off';
            ADVSMS__Global_Action_Plan_Steps__c ActionStep18 = new ADVSMS__Global_Action_Plan_Steps__c();
                ActionStep18.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
                ActionStep18.ADVSMS__Objective__c = 'Implementation';
                ActionStep18.ADVSMS__Key_Decision_Point__c = false;
                ActionStep18.ADVSMS__Days_from_first_step__c = 90;
                ActionStep18.ADVSMS__Order__c = 18;
                ActionStep18.ADVSMS__Action_Item__c = 'Review implementation and metrics to be achieved';

            insert ActionStep1;
            insert ActionStep2;
            insert ActionStep3;
            insert ActionStep4;
            insert ActionStep5;
            insert ActionStep6;
            insert ActionStep7;
            insert ActionStep8;
            insert ActionStep9;
            insert ActionStep10;
            insert ActionStep11;
            insert ActionStep12;
            insert ActionStep13;
            insert ActionStep14;
            insert ActionStep15;
            insert ActionStep16;
            insert ActionStep17;
            insert ActionStep18;

            ADVSMS__Action_Plan__c ActionPlan1 = new ADVSMS__Action_Plan__c();
                ActionPlan1.ADVSMS__Opportunity__c = newOppty1.Id;
                ActionPlan1.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;
            ADVSMS__Action_Plan__c ActionPlan2 = new ADVSMS__Action_Plan__c();
                ActionPlan2.ADVSMS__Opportunity__c = newOppty2.Id;
                ActionPlan2.ADVSMS__Global_Action_Plans__c = GActionPlan.Id;

            insert ActionPlan1;
            insert ActionPlan2;

            ADVSMS__Impacted_Job_Title__c ImpactTitle1 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle1.Name = Jtitle5.Name;
                ImpactTitle1.ADVSMS__Contact__c = newContact5.Id;
                ImpactTitle1.ADVSMS__Opportunity__c = newOppty2.Id;
                ImpactTitle1.ADVSMS__Job_Title__c = Jtitle5.Id;
                ImpactTitle1.ADVSMS__Critical_Business_Issue__c = CBIssue7.Id;

            insert ImpactTitle1;

            ADVSMS__Impacted_Job_Title__c ImpactTitle2 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle2.Name = Jtitle4.Name;
                ImpactTitle2.ADVSMS__Contact__c = newContact4.Id;
                ImpactTitle2.ADVSMS__Opportunity__c = newOppty2.Id;
                ImpactTitle2.ADVSMS__Job_Title__c = Jtitle4.Id;
                ImpactTitle2.ADVSMS__Critical_Business_Issue__c = CBIssue6.Id;
                ImpactTitle2.ADVSMS__impacts__c = ImpactTitle1.Id;

            insert ImpactTitle2;

            ADVSMS__Impacted_Job_Title__c ImpactTitle3 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle3.Name = Jtitle2.Name;
                ImpactTitle3.ADVSMS__Contact__c = newContact2.Id;
                ImpactTitle3.ADVSMS__Opportunity__c = newOppty2.Id;
                ImpactTitle3.ADVSMS__Job_Title__c = Jtitle2.Id;
                ImpactTitle3.ADVSMS__Critical_Business_Issue__c = CBIssue5.Id;
                ImpactTitle3.ADVSMS__impacts__c = ImpactTitle2.Id;
            ADVSMS__Impacted_Job_Title__c ImpactTitle4 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle4.Name = Jtitle3.Name;
                ImpactTitle4.ADVSMS__Contact__c = newContact3.Id;
                ImpactTitle4.ADVSMS__Opportunity__c = newOppty2.Id;
                ImpactTitle4.ADVSMS__Job_Title__c = Jtitle3.Id;
                ImpactTitle4.ADVSMS__Critical_Business_Issue__c = CBIssue4.Id;
                ImpactTitle4.ADVSMS__impacts__c = ImpactTitle2.Id;

            insert ImpactTitle3;
            insert ImpactTitle4;

            ADVSMS__Impacted_Job_Title__c ImpactTitle5 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle5.Name = Jtitle1.Name;
                ImpactTitle5.ADVSMS__Contact__c = newContact1.Id;
                ImpactTitle5.ADVSMS__Opportunity__c = newOppty2.Id;
                ImpactTitle5.ADVSMS__Job_Title__c = Jtitle1.Id;
                ImpactTitle5.ADVSMS__Critical_Business_Issue__c = CBIssue1.Id;
                ImpactTitle5.ADVSMS__impacts__c = ImpactTitle3.Id;
                ImpactTitle5.ADVSMS__Impacted_2__c = ImpactTitle4.Id;

            insert ImpactTitle5;

            ADVSMS__Impacted_Job_Title__c ImpactTitle6 = new ADVSMS__Impacted_Job_Title__c();
                ImpactTitle6.Name = Jtitle1.Name;
                ImpactTitle6.ADVSMS__Contact__c = newContact1.Id;
                ImpactTitle6.ADVSMS__Opportunity__c = newOppty1.Id;
                ImpactTitle6.ADVSMS__Job_Title__c = Jtitle1.Id;
                ImpactTitle6.ADVSMS__Critical_Business_Issue__c = CBIssue1.Id;

            insert ImpactTitle6;

            ADVSMS__Sales_Call_Analysis__c SalesCall = new ADVSMS__Sales_Call_Analysis__c();
                SalesCall.Name = 'Director of Engineering';
                SalesCall.ADVSMS__Opportunity__c = newOppty1.Id;
                SalesCall.ADVSMS__Impacted_Job_Title__c = ImpactTitle6.Id;

            insert SalesCall;

            ADVSMS__Sales_Call_Analysis__c SalesCall2 = new ADVSMS__Sales_Call_Analysis__c();
                SalesCall.Name = 'Director of Engineering';
                SalesCall.ADVSMS__Opportunity__c = newOppty2.Id;
                SalesCall.ADVSMS__Impacted_Job_Title__c = ImpactTitle5.Id;

            insert SalesCall2;

            ADVSMS__Skill_Analyzer_Set__c SkillAnalyzer = new ADVSMS__Skill_Analyzer_Set__c();
                SkillAnalyzer.Name = 'Sales/Account Executive';
            insert SkillAnalyzer;

            ADVSMS__Skill__c Skill1 = new ADVSMS__Skill__c();
                Skill1.ADVSMS__Order__c = 1;
                Skill1.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill1.ADVSMS__Skill_Definition__c = 'Seller should view account planning as critical strategic exercise designed to: Direct efforts to significantly penetrate accounts, Achieve “Trusted Advisor” status, Help identify and initiate opportunities first (before competition). Seller should not view account planning as a once a year event to get management off his/her back. Seller should utilize plan throughout year to guide efforts on the account. Seller should update plan on regular basis, as required. Capable of developing plan with appropriate support resources that thoroughly captures the information necessary for proactive opportunity identification.  Seller should identify key buyers targeted for both relationship management and development, coordinate internal resources to assist in the management of those relationships, develop and coordinate appropriate plans, and identify CBI’s for proactive opportunity identification.';
                Skill1.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill1.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill1.ADVSMS__Overall_Parameters__c = '';
                Skill1.ADVSMS__Daily_Actions__c = '';
                Skill1.ADVSMS__Weekly_Actions__c = '';
                Skill1.ADVSMS__Monthly_Actions__c = 'Track progress against Go-Forward Plan including identification of gaps and gap resolution plan where necessary.';
                Skill1.ADVSMS__Quarterly_Actions__c = 'Track progress against Go-Forward Plan including identification of gaps and gap resolution plan where necessary.';
                Skill1.ADVSMS__Annual_Actions__c = 'Develop/update: Account Profile(including Business Description, Products/Services, Shareholding, Goals & Objectives, Business Drivers, Key Performance Indicators)and identify implications that can lead to identification of High Probability Opportunities.';
                Skill1.ADVSMS__Skill_Header_label__c = 'Account Planning';
                Skill1.ADVSMS__Skill_Help_Table_Header__c = 'Account Planning';
                Skill1.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill1.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill1.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill2 = new ADVSMS__Skill__c();
                Skill2.ADVSMS__Order__c = 2;
                Skill2.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill2.ADVSMS__Skill_Definition__c = 'Capable of taking information from an account and/or territory plan and translating/building it into multiple, potential, high probability opportunities. In building opportunities, capable of:Identifying critical business issues of key buyers (in particular those above power line), Prioritizing those that favor you, Conducting a “cause and effect” analysis to take a buyer, and his/her CBI, and expand it to determine who is likely causing the CBI and what the effect of the CBI is on other key buyers (this then represents a potential integrated buying committee). Identifying capabilities you have that can help each buyer (this then represents a potential solution to the committees CBI’s). Capable of comparing several high probability opportunities and prioritizing them based on overall ability to win. Capable of developing necessary knowledge tools (prospecting scripts and letters, potential Action Plans) so that high probability opportunities are execution ready.';
                Skill2.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill2.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill2.ADVSMS__Overall_Parameters__c = '';
                Skill2.ADVSMS__Daily_Actions__c = '';
                Skill2.ADVSMS__Weekly_Actions__c = '';
                Skill2.ADVSMS__Monthly_Actions__c = 'Assess whether opportunities have been initiated.  Devise tactics accordingly.';
                Skill2.ADVSMS__Quarterly_Actions__c = 'Achieve P to (C or B or A) conversion rate of 3:1. Update/add opportunities to Account Plan.';
                Skill2.ADVSMS__Annual_Actions__c = 'Analyze&Record buyers and high probability critical business issues. Prioritize CBI’s. Create Impact Trees from cause&effects. Develop Capability Matrices. Assess, compare, and prioritize opportunities using Comparative Analyzer™. Create knowledge tools.';
                Skill2.ADVSMS__Skill_Header_label__c = 'Opportunity Identification';
                Skill2.ADVSMS__Skill_Help_Table_Header__c = 'Opportunity Identification';
                Skill2.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill2.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill2.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill3 = new ADVSMS__Skill__c();
                Skill3.ADVSMS__Order__c = 3;
                Skill3.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill3.ADVSMS__Skill_Definition__c = 'Ability to structure and conduct ongoing campaign (The Seven Touch Points) to generate leads, primarily above the power line, integrating telephone, letters, and potentially other media. Capable of structuring effective cold call and prospecting letters. Capable of effective delivery of cold call script. Can make effective transitions depending on prospect’s response to cold call: Proceed with additional CBI’s, Proceed with call introduction, Book an appointment.';
                Skill3.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill3.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill3.ADVSMS__Overall_Parameters__c = 'Dedicate, in writing, minimum amount of prospecting time (“sacred time”).  Initially 20%. Dedicate time periods during the week-nothing else gets in the way! Manager check upcoming week’s prospect list to make sure seller is calling above the Power Line';
                Skill3.ADVSMS__Daily_Actions__c = 'Role-play weekly, before first scheduled prospecting time period.';
                Skill3.ADVSMS__Weekly_Actions__c = 'Manager should check results (NOC’s) at the end of the week.  Fine tune.';
                Skill3.ADVSMS__Monthly_Actions__c = 'Use Pipeline Analyzer™ to track NOC Actual Vs. Goal.';
                Skill3.ADVSMS__Quarterly_Actions__c = 'Assess measurable progress: NOC Actual Vs. Goal.  Should achieve 90% of goal.';
                Skill3.ADVSMS__Annual_Actions__c = '';
                Skill3.ADVSMS__Skill_Header_label__c = 'Prospecting';
                Skill3.ADVSMS__Skill_Help_Table_Header__c = 'Prospecting';
                Skill3.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill3.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill3.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill4 = new ADVSMS__Skill__c();
                Skill4.ADVSMS__Order__c = 4;
                Skill4.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill4.ADVSMS__Skill_Definition__c = 'Seller views account penetration as conducting prospecting into a “warm” account. Understands and is capable of executing prospecting processes (with appropriate modifications for a penetration environment). Capable of effectively leveraging client contacts (referrals) and your past corporate success on the account. Capable of developing and executing an account penetration program.  Golf, lunch, dinner, social events are not key elements of the plan.';
                Skill4.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill4.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill4.ADVSMS__Overall_Parameters__c = 'Dedicate, in writing, minimum amount of prospecting time (“sacred time”).  Initially 20%. Dedicate time periods during the week-nothing else gets in the way! Manager check upcoming week’s prospect list to make sure seller is calling above the Power Line';
                Skill4.ADVSMS__Daily_Actions__c = 'Role-play weekly, before first scheduled prospecting time period.';
                Skill4.ADVSMS__Weekly_Actions__c = 'Have every contact seller has on the account provide 3-5 more. Use referral letters to initiate opportunities. Manager should check results (NOC’s) at the end of the week.  Fine tune.';
                Skill4.ADVSMS__Monthly_Actions__c = 'Use Pipeline Analyzer™ to track NOC Actual Vs. Goal.';
                Skill4.ADVSMS__Quarterly_Actions__c = 'Assess measurable progress: NOC Actual Vs. Goal.  Should achieve 90% of goal.';
                Skill4.ADVSMS__Annual_Actions__c = '';
                Skill4.ADVSMS__Skill_Header_label__c = 'Account Penetration';
                Skill4.ADVSMS__Skill_Help_Table_Header__c = 'Account Penetration';
                Skill4.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill4.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill4.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill5 = new ADVSMS__Skill__c();
                Skill5.ADVSMS__Order__c = 5;
                Skill5.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill5.ADVSMS__Skill_Definition__c = 'Capable of delivering effective competency message so that buyers believe seller can help solve problems. Can effectively get buyer to: Admit a critical business issue, Identify causes, Identify capabilities (particularly those that differentiate you).';
                Skill5.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill5.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill5.ADVSMS__Overall_Parameters__c = 'Check Prospecting / Account Penetration Contacts to ensure calls are being made “Above Power Line”';
                Skill5.ADVSMS__Daily_Actions__c = 'As sales calls are made, review results using “Opportunity Analyzer”.  Pre-edit all “Letters of Understanding”.';
                Skill5.ADVSMS__Weekly_Actions__c = 'Role-play Steps 2-4 of the Sales Call Process.  Record results on “Observation Worksheet”™.';
                Skill5.ADVSMS__Monthly_Actions__c = 'Use Pipeline Analyzer™ to check conversions from C to (B or A).';
                Skill5.ADVSMS__Quarterly_Actions__c = 'Achieve C to (B or A) conversion rate of 3:1.';
                Skill5.ADVSMS__Annual_Actions__c = '';
                Skill5.ADVSMS__Skill_Header_label__c = 'Solution Development';
                Skill5.ADVSMS__Skill_Help_Table_Header__c = 'Solution Development';
                Skill5.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill5.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill5.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill6 = new ADVSMS__Skill__c();
                Skill6.ADVSMS__Order__c = 6;
                Skill6.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill6.ADVSMS__Skill_Definition__c = 'Once buyer’s need has been developed, seller is capable of determining who may be causing the CBI and who may be affected by the CBI.  Given the identified buyers, seller should be able to determine if the buyer is above or below the “Power Line”. For buyers below the “Power Line”, seller should ask for, and potentially negotiate, access to power. For buyers above the “Power Line”, seller should propose an Action Plan.';
                Skill6.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill6.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill6.ADVSMS__Overall_Parameters__c = 'Check Prospecting / Account Penetration Contacts to ensure calls are being made “Above Power Line”.';
                Skill6.ADVSMS__Daily_Actions__c = 'Pre-edit (Capability levels 1,2) LOU’s.  All letters. Post-edit (Capability Level 3) LOU’s. Considerations: Random, “A” prospects only, Letters exceeding only $X.';
                Skill6.ADVSMS__Weekly_Actions__c = 'Role-play Steps 5-8.  Record results on Observation Sheet.';
                Skill6.ADVSMS__Monthly_Actions__c = 'Use Pipeline Analyzer™ to check conversions from C to (B or A).';
                Skill6.ADVSMS__Quarterly_Actions__c = 'Achieve C to (B or A) conversion rate of 3:1.';
                Skill6.ADVSMS__Annual_Actions__c = '';
                Skill6.ADVSMS__Skill_Header_label__c = 'Qualification - Sales Call';
                Skill6.ADVSMS__Skill_Help_Table_Header__c = 'Qualification - Sales Call';
                Skill6.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill6.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill6.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill7 = new ADVSMS__Skill__c();
                Skill7.ADVSMS__Order__c = 7;
                Skill7.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill7.ADVSMS__Skill_Definition__c = 'Capable of building effective Action Plans with a Power Promoter that: Reflect stages that align with buyer, Orders steps to maximize ability to qualify, Includes appropriate steps to give buyer great confidence to make the buy decision at end of sell cycle, Includes fee-based services, Minimizes length of sell cycle. Capable of using the Action Plan to determine appropriate internal (and/or external) resources required, and timing of the utilization of those resources.';
                Skill7.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill7.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill7.ADVSMS__Overall_Parameters__c = 'Make sure Seller understands stages 2-4 of buying model and the steps that go into each stage. Review successful Action Plans with seller.  Review fee-based steps';
                Skill7.ADVSMS__Daily_Actions__c = 'Pre-edit VS. Post-edit of Power Promoter Letters.';
                Skill7.ADVSMS__Weekly_Actions__c = 'Role-play Step 7B.';
                Skill7.ADVSMS__Monthly_Actions__c = 'Use Pipeline Analyzer™ to check conversions from C to (B or A).';
                Skill7.ADVSMS__Quarterly_Actions__c = 'Achieve C to (B or A) conversion rate of 3:1.';
                Skill7.ADVSMS__Annual_Actions__c = '';
                Skill7.ADVSMS__Skill_Header_label__c = 'Sell Cycle Control';
                Skill7.ADVSMS__Skill_Help_Table_Header__c = 'Sell Cycle Control';
                Skill7.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill7.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill7.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill8 = new ADVSMS__Skill__c();
                Skill8.ADVSMS__Order__c = 8;
                Skill8.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill8.ADVSMS__Skill_Definition__c = 'Willing and able to disqualify “loser” opportunities, and do so early during execution of the Action Plan. When delays or road blocks occur, utilizes Power Promoter to quickly overcome difficulties. Willing to walk if buyer will not complete a key activity, such as paying a reasonable fee for an important service-oriented step.';
                Skill8.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill8.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill8.ADVSMS__Overall_Parameters__c = 'Allocate resources only after Action Plan approved.';
                Skill8.ADVSMS__Daily_Actions__c = 'Pre-edit VS. Post-edit of Power Promoter Letters.';
                Skill8.ADVSMS__Weekly_Actions__c = 'Review key steps with sellers prior to execution. Rehearse/role-play key steps prior to execution.';
                Skill8.ADVSMS__Monthly_Actions__c = 'Check Action Plans for completion of key steps.  Look for “stale” opportunities based on completion of key steps (30 days is good measure). Use Pipeline Analyzer™ to check conversions from C to A.';
                Skill8.ADVSMS__Quarterly_Actions__c = 'Assess ability to move through Action Plans.  Assess ability and willingness to disqualify';
                Skill8.ADVSMS__Annual_Actions__c = '';
                Skill8.ADVSMS__Skill_Header_label__c = 'Qualification - Sell Cycle';
                Skill8.ADVSMS__Skill_Help_Table_Header__c = 'Qualification - Sell Cycle';
                Skill8.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill8.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill8.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            ADVSMS__Skill__c Skill9 = new ADVSMS__Skill__c();
                Skill9.ADVSMS__Order__c = 9;
                Skill9.ADVSMS__Skill_Question__c = 'Capability Level';
                Skill9.ADVSMS__Skill_Definition__c = 'If a buyer below the power line denies access to power, capable of negotiating access to power (normally using proof in return for access).  If above power line, capable of negotiating an effective Action Plan with difficult buyers.  When difficulties occur during the execution of an Action Plan, able to successfully negotiate the completion of the step.  At the end of the sell cycle, able to successfully negotiate price, terms, conditions with minimal and appropriate “gives”. At the end of the sell cycle, able to successfully conduct closing event with buying committee.';
                Skill9.ADVSMS__Skill_Analyser_Set__c = SkillAnalyzer.Id;
                Skill9.ADVSMS__Skill_Comment_Title__c = 'Comments';
                Skill9.ADVSMS__Overall_Parameters__c = '';
                Skill9.ADVSMS__Daily_Actions__c = '';
                Skill9.ADVSMS__Weekly_Actions__c = 'Rehearse negotiations & closings. Personally control closings for reps under 100% of quota. Review Negotiation Preparation & Planning Tools. Seller prepares & discusses Negotiation Preparation & Planning Tools w/Manager. Role Play using Planning Tool.';
                Skill9.ADVSMS__Monthly_Actions__c = 'Review Near Win to Win closes against $Actual Vs. $Goal.';
                Skill9.ADVSMS__Quarterly_Actions__c = 'Review Near Win to Win closes against $Actual Vs. $Goal.';
                Skill9.ADVSMS__Annual_Actions__c = '';
                Skill9.ADVSMS__Skill_Header_label__c = 'Negotiating & Closing';
                Skill9.ADVSMS__Skill_Help_Table_Header__c = 'Negotiating & Closing';
                Skill9.ADVSMS__Skill_Help_1_Header__c = 'Cannot do it. Will not do it. Not capable of doing it';
                Skill9.ADVSMS__Skill_Help_2_Header__c = 'Capable of executing the skill but requires assistance from manager';
                Skill9.ADVSMS__Skill_Help_3_Header__c = 'Highly capable of achieving objectives independent of manager. “ACE” performer';

            insert Skill1;
            insert Skill2;
            insert Skill3;
            insert Skill4;
            insert Skill5;
            insert Skill6;
            insert Skill7;
            insert Skill8;
            insert Skill9;

            List<ADVSMS__Skill_Help__c> lstSHelp = new List<ADVSMS__Skill_Help__c>();

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Account plans don’t result in information that can be translated into opportunities'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Hot Lead” means responding to an RFP'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'No real understanding of the buyers and in particular their CBI’s'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not manage account team effectively'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not proactively manage existing relationships'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not proactively develop new relationships'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Revenue almost exclusively from ongoing (Vs. new) business'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Our position with the buyer (how buyer views us) has not improved in 12 or more months'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Generates opportunities from account plan information but does not meet expectations'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Responds to too many RFP’s Vs. being first in and identifying needs'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Identifies buyer CBI’s but they are often incorrect'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Does attempt to proactively manage and develop relationships, but with minimal success, and minimal discovery of CBI’s with those buyers'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Does adequate job managing account teams on regional / national / global basis using both Letters of Understanding and Opportunity Stages'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Revenue from ongoing and new business, but new business goals not met'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Our position on the account has progressed but not to plan'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Account plan information provides excellent foundation for high probability opportunity identification'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Few reactive proposal responses'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Buyer CBI’s provide excellent foundation for proactive identification of opportunities'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Does excellent job proactively managing and developing relationships and discovers CBI’s with those buyers'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Manages account teams on regional / national / global basis using both Letters of Understanding and Opportunity Stages'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill1.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Our position on the account has progressed according to plan'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Few, if any, proactive opportunities created'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Attitude of, “What can I sell you today?”'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'A lot of activity, few opportunities'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Hot Lead” means responding to an RFP'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not use knowledge tools from repository, or, where necessary, develop them to initiate opportunities'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Generates opportunities from account plan but not high quality. Impact Tree, cause/effect relationships, capability statements are not up to par'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Generates opportunities from account plan but a sufficient number'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Uses repository and/or develops tools but not to the level necessary to achieve penetration goals'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Generates high quality opportunities and in sufficient numbers to achieve account goals'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Penetration tactics result in both new opportunities and relationships on the account'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Appropriately scores and prioritizes opportunities'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill2.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Uses repository and/or develops tools where necessary'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Fearful'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Achieves 25% or less of NOC goal'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Little time committed'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Locks up” during practice sessions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Poor telephone technique'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Willing, but low activity level'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Achieves approximately 50% of NOC goal'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Not enough time committed'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Shortcomings in telephone technique'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Fearless'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Consistently achieves 75% of NOC goal or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Commits the time'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill3.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Excellent telephone skills'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Fearful'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Achieves 25% or less of NOC goal'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Little time committed'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Locks up” during practice sessions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Poor telephone technique'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Little to no leverage of internal contacts'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Little to no leverage of your past successes'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Little to no use of referral letters'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Willing, but low activity level'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Achieves approximately 50% of NOC goal'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Not enough time committed'));
                
            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Leverages internal contacts by approximately 2:1 or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Leverages your past successes'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Good use of referral letters'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Fearless'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Consistently achieves 75% of NOC goal or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Commits the time'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Excellent telephone skills'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Leverages internal contacts by 5:1 or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Leverages your past successes'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill4.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Excellent use of referral letters to “open doors”, making leads “warm”'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Infrequent or no use of “Letters of Understanding”'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '"Letters” reflect unimportant items (such as point by point summary of what happened on the call)'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Letters” reflect “product pitch”'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'When participating in a sales call, Sales Manager sees poor execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'During sales call practice sessions, Sales Manager sees poor execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect poor understanding of CBI and/or'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect poor understanding of causes and/or'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect poor understanding of potential solution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'When participating in a sales call, Sales Manager sees adequate execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'During sales call practice sessions, Sales Manager sees adequate execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect high level of understanding of CBI and/or'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect high level of understanding of causes and/or'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = '“Letters of Understanding” reflect high level of understanding of potential solution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'When participating in a sales call, Sales Manager sees excellent execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill5.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'During sales call practice sessions, Sales Manager sees excellent execution'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'A/B ratio 1/8 or worse'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not qualify opportunities out of pipeline'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Promoter” letters reflect no attempt to access Power Promoter'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Poor or not attempt to identify'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not identify impacted individuals'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Power Promoter” letters reflect no attempt to create Action Plan'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'A/B ratio between 1/8 - 1/4'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = '“Promoter” letters reflect unsuccessful attempts to access Power Promoter'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Good but inconsistent identification of impacted individuals'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = '“Power Promoter” letters reflect inconsistent attempt to create Action Plan'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'A/B ratio 1/1 or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = '“Promoter” letters reflect consistent access to Power Promoter'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Consistent identification of impacted individuals'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill6.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = '“Power Promoter” letters reflect consistent ability to create Action Plan'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'No use of Action Plans'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Resources given away'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Sell cycles “out of control” and lack predictability'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'No clear understanding of end dates or next steps'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Poorly set up Action Plans: Stages “out of sync”, steps missing or inappropriate'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Plans favor the buyer'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Resources given away'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Action Plans set up well, Stage 2 reflects calling on key impacted individuals and Stage 3 reflects appropriate proof, legal, technical, administrative steps, financial steps, etc.'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Plans reflect ability to continuously qualify and control sell cycle'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill7.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Fee-based steps'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not qualify opportunities out of pipeline'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Poor or no use of key steps to qualify and does not make right decisions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Probability of A closing is 40% or less'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Probability of A+ closing is 50% or less'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Late sell cycle losses'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Normally one or more Near Losses in pipeline'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Qualifies opportunities out early, preferably Stage 2, but not consistently'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Uses key steps to qualify but inconsistently makes right decisions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Probability of A closing is 50% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Probability of A+ closing is 75% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Few Near Losses in pipeline'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Qualifies opportunities out early, preferably Stage 2'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Uses key steps to qualify and consistently makes right decisions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Probability of A closing is 60% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Probability of A+ closing is 85% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill8.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Opportunities rarely go to Near Loss'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Does not complete steps 6 & 7 of sales call'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Letters of Understanding show no attempt to gain access'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = 'Takes buyer’s side during negotiations or working through difficulties'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '1',
                ADVSMS__Characteristic__c = '“Locks up” during role-plays'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Normally completes steps 6 & 7 of sales call but may not succeed at gaining access'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Letters of Understanding show variable access to power'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Willing and somewhat able to successfully role-play access to power, negotiation of Action Plans, closing at proposal reviews'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Tends to give away too much'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Probability of A closing is 50% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Probability of A+ closing is 75% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '2',
                ADVSMS__Characteristic__c = 'Few Near Losses in pipeline'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Steps 6 & 7 of sales call executed naturally with consistently high results'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Letters of Understanding normally show successful access to power'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Willing and able to role-play access to power, negotiation of Action Plans, closing at proposal reviews'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Does not give away much, even at end of quarter or year'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Qualifies opportunities out early, preferably Stage 2'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Uses key steps to qualify and consistently makes right decisions'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Probability of A closing is 60% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Probability of A+ closing is 85% or greater'));

            lstSHelp.add(new ADVSMS__Skill_Help__c (
                ADVSMS__Skill__c = Skill9.Id,
                ADVSMS__Skill_Help_Level__c = '3',
                ADVSMS__Characteristic__c = 'Opportunities rarely go to Near Loss'));

            insert lstSHelp;
            }
        else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to create records!')); 
        }
    }
}