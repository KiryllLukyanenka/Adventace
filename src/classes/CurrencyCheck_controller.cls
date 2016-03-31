public class CurrencyCheck_controller {
    public List<Currency_Check__c> lstCurrencyChecks = new List<Currency_Check__c>();

    //constructor
    public CurrencyCheck_controller() {
        if (isMultiCurrencyEnabled()) {
            lstCurrencyChecks = [Select Id, Name, ConvertCurrency(ADVSMS__Amount__c) From ADVSMS__Currency_Check__c];
        } else {
            lstCurrencyChecks = [Select Id, Name, ADVSMS__Amount__c From ADVSMS__Currency_Check__c];
        }
    }
    
    //getter
    public List<Currency_Check__c> getCurrencyChecks() {return lstCurrencyChecks;}
    
    private Boolean isMultiCurrencyEnabled() {

        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType mcEnabled = gd.get('DatedConversionRate');
        return (mcEnabled != null) ? true : false;

    }    
}