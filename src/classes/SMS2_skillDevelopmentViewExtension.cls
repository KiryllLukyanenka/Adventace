public with sharing class SMS2_skillDevelopmentViewExtension {

	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	/////////////////////////////////////////
	// Updated 20120424 AAB / DCS
	// andyb@demandchainsystems.com
	/////////////////////////////////////////

    public ADVSMS__TACE_Skill_Analyzer__c ska;
    public List<skillRollUp> allSkills = new List<skillRollUp>();
    public List<Skills__c> theseSkills = new List<Skills__c>();
    
    /////////////////////////
	// Constructor
	/////////////////////////
    
    public SMS2_skillDevelopmentViewExtension(ApexPages.StandardController stdController) {
       
        this.ska = (ADVSMS__TACE_Skill_Analyzer__c)stdController.getRecord();

    }
    
    /////////////////////////
	// GETers
	/////////////////////////
    public List<skillRollUp> getSkills() {
        
        if(allSkills.size() == 0) {
            
            List<Skills__c> theseSkills = [Select Id,Skill_Defeinition_n__c,Personal_Development_Plan__c, Skill_Help_Table_Header__c, Skill__r.Id, Skill__c, Order__c, 
            Skill_Help_1_Header__c, Skill_Help_2_Header__c,Skill_Help_3_Header__c,Skill_Header_Label__c, Skill_question__c,Skill_Comment_Label__c, Skill_Score__c, 
            Skill_Comment__c from ADVSMS__Skills__c Where Skill_Analyzer__c = :ska.id Order By Order__c ASC];
            
            for(ADVSMS__Skills__c  tSk:theseSkills) {
            
                skillRollUp newSRP = new skillRollUp(tSk);
                allSkills.add(newSRP);
            }
        }
        return allSkills;
    }
    
    /////////////////////////
	// Action Methods
	/////////////////////////
    
    public PageReference saveSkills() {

        System.debug('STARTING TO SAVE SKILLS');
        System.debug('SKILL COUNT: ' + allSkills.size());

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Skills__c.fields.Skill_Defeinition_n__c.isUpdateable() ||
          !Schema.sObjectType.ADVSMS__Skills__c.fields.Personal_Development_Plan__c.isUpdateable() ||
          !Schema.sObjectType.ADVSMS__Skills__c.fields.Skill__c.isUpdateable() ||
          !Schema.sObjectType.ADVSMS__Skills__c.fields.Skill_Score__c.isUpdateable() ||
          !Schema.sObjectType.ADVSMS__Skills__c.fields.Skill_Comment__c.isUpdateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            return null;
        }

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__Skill_Help__c.fields.Characteristic__c.isUpdateable() ||
          !Schema.sObjectType.ADVSMS__Skill_Help__c.fields.Skill_Help_Level__c.isUpdateable()) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
            return null;
        }

        
        for(skillRollUp  tSk:allSkills) {
            System.debug('THIS SKILL:' + tSk.thisSkill.Id);
            System.debug('THIS SKILL:' + tSk.thisSkill.Skill_Score__c);
            update tSk.thisSkill;
            
        }
        
        update ska;
        System.debug('THESE SKILLS UPDATED');
        //update this.ska;
        

        PageReference pageRef = new PageReference('/' + ska.id);
        pageRef.setRedirect(true);
        return pageRef;
        
    }
    
    /////////////////////////
	// Helper Classes
	/////////////////////////
   
    public class skillRollUp {
        
       public ADVSMS__Skills__c thisSkill {get; set;}
       public List<ADVSMS__Skill_Help__c> thisSkillHelp1 = new List<ADVSMS__Skill_Help__c>();
       public List<ADVSMS__Skill_Help__c> thisSkillHelp2 = new List<ADVSMS__Skill_Help__c>();
       public List<ADVSMS__Skill_Help__c> thisSkillHelp3 = new List<ADVSMS__Skill_Help__c>();
       public List<ADVSMS__Skill_Help__c> allSkillHelp = new List<ADVSMS__Skill_Help__c>();
       
       public String thisSkillHelp1B = '';
       public String thisSkillHelp2B = '';
       public String thisSkillHelp3B = '';
        
       public skillRollUp(Skills__c skill) {
        
            this.thisSkill = skill;
            System.debug('SKILL ADDED: '+ thisSkill.Id);
            
            allSkillHelp = [Select Characteristic__c, Skill_Help_Level__c From ADVSMS__Skill_Help__c Where Skill__c = :skill.Skill__r.Id Order By CreatedDate];
            
            for(ADVSMS__Skill_Help__c  tSh:allSkillHelp) {
                
                if(tSh.Skill_Help_Level__c == '1') {
                    
                    this.thisSkillHelp1.add(tSh);
                    thisSkillHelp1B += ' - ' +tSh.Characteristic__c + '<br/>';
                }
                
                if(tSh.Skill_Help_Level__c == '2') {
                    
                    this.thisSkillHelp2.add(tSh);
                    thisSkillHelp2B += ' - ' +tSh.Characteristic__c + '<br/>';
                }
                
                if(tSh.Skill_Help_Level__c == '3') {
                    
                    this.thisSkillHelp3.add(tSh);
                    thisSkillHelp3B += ' - ' +tSh.Characteristic__c + '<br/>';
                }
            }
      
      
       }
    
       public String getsh1b() {
        
            return this.thisSkillHelp1B;
       }
       
       public String getsh2b() {
        
            return this.thisSkillHelp2B;
       }
       
       public String getsh3b() {
        
            return this.thisSkillHelp3B;
       }
       public List<ADVSMS__Skill_Help__c> getsh1() {
        
            return this.thisSkillHelp1;
       }
       
       public List<ADVSMS__Skill_Help__c>  getsh2() {
        
            return this.thisSkillHelp2;
       }
       
       public List<ADVSMS__Skill_Help__c>  getsh3() {
        
            return this.thisSkillHelp3;
       }

    } 
}