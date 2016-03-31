trigger SMS2_createPersonalDevelopmentPlan on ADVSMS__Skills__c (after update) {
      /* Create The High Performance Sales Environment®  • ©2010 • Adventace® LLC • All rights reserved • Confidential*/
    ADVSMS.SMS2_createPersonalDevelopmentPlan np = new ADVSMS.SMS2_createPersonalDevelopmentPlan(Trigger.New,Trigger.Old);
    
}