trigger SMS_AssignSkillsToSkillDevelopmentPlan on ADVSMS__TACE_Skill_Analyzer__c (after insert) {
      /* Create The High Performance Sales Environment®  • ©2010 • Adventace® LLC • All rights reserved • Confidential*/
    ADVSMS.SMS2_AssignSkillsToSkillDevelopmenrPlan  sms = new ADVSMS.SMS2_AssignSkillsToSkillDevelopmenrPlan(Trigger.new);
}