@isTest
private class CurrencyCheck_controller_UT {

    static testMethod void unitTest() {
        List<Currency_Check__c> lstCurrencyCheck = new List<Currency_Check__c>();
        Currency_Check__c oRec = new Currency_Check__c();
        oRec.Name = 'Test Rec 1';
        oRec.Amount__c = 100;
        lstCurrencyCheck.add(oRec);
        
        oRec = new Currency_Check__c();
        oRec.Name = 'Test Rec 2';
        oRec.Amount__c = 1000;
        lstCurrencyCheck.add(oRec);
        
        oRec = new Currency_Check__c();
        oRec.Name = 'Test Rec 2';
        oRec.Amount__c = 10000;
        lstCurrencyCheck.add(oRec); 
        
        insert lstCurrencyCheck;  
        
        test.startTest();
        CurrencyCheck_controller oController = new CurrencyCheck_controller();
        lstCurrencyCheck = oController.getCurrencyChecks(); 
        test.stopTest();
    }

}