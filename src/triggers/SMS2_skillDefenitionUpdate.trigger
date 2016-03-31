trigger SMS2_skillDefenitionUpdate on ADVSMS__Skill__c (after update) {
/**
*   {Purpose}  �  This trigger handles the ADVSMS__Skill__c object
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date        Name                     Description
*   20140117    Andy Boettcher DCS        Created
*   =============================================================================
*/

    List<ADVSMS__Skills__c> lstLinkedSkills = [SELECT Skill__c, Skill_Defeinition_n__c FROM ADVSMS__Skills__c WHERE Skill__c IN :trigger.newMap.keySet()];

    for(ADVSMS__Skills__c skLinked : lstLinkedSkills) {
    	skLinked.Skill_Defeinition_n__c = trigger.newMap.get(skLinked.Skill__c).Skill_Definition__c;
    }

    if(lstLinkedSkills.size() > 0) {
    	update lstLinkedSkills;
    }

}