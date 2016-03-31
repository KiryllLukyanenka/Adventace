public without sharing class SMS2_PipelineMethods {
/**
*   {Purpose}   - Performs various actions on the TACE_Pipeline_Balancing_Algorithm__c object
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name             	Description
*   20150601  	EBG/DCS				Created
*   =============================================================================
*/

	///////////////////////////
	// Given a list of records from a trigger, ensure the owner field
	//  matches the seller field
	///////////////////////////
	public static void setOwnerToSeller(List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> lstPipelines) {
		for (ADVSMS__TACE_Pipeline_Balancing_Algorithm__c oPipeline : lstPipelines) {
			if (oPipeline.ADVSMS__User__c != null) {
				oPipeline.OwnerId = oPipeline.ADVSMS__User__c;
			}
		}
	}

	///////////////////////////
	// Determine if multi-currency is enabled by looking for the
	//  CurrencyType object.  If it exists, multi-currency is enabled
	///////////////////////////	
	public static boolean isMultiCurrencyEnabled() {
		Boolean isEnabled = false;
		Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
		Schema.SObjectType mcEnabled = gd.get('CurrencyType');
		if (mcEnabled != null) {
			isEnabled = true;
		}
		system.debug('isMultiCurrencyEnabled: ' + isEnabled);
		return isEnabled;
	}

	///////////////////////////
	// Determine if advanced multi-currency is enabled by looking for the
	//  DatedConversionRate object.  If it exists, query to see if any data exists.
	//  If data exists in the table, then advanced multi-currency is enabled
	///////////////////////////	
	public static boolean isAdvancedCurrencyEnabled() {
		Boolean isEnabled = false;
		Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
		Schema.SObjectType mcEnabled = gd.get('DatedConversionRate');
		if (mcEnabled != null) {
			String soqlStmt = 'Select Id From DatedConversionRate';
			for (SObject dcr : database.query(soqlstmt)) {
				system.debug('Inside isAdvancedCurrencyEnabled. dcr: ' + dcr);
				isEnabled = true;			
    			break;
			}
		}
		system.debug('isAdvancedCurrencyEnabled: ' + isEnabled);
		return isEnabled;
	}	

	////////////////////////////
	// Given a set of owners, find the conversion rate associated to the currency on each owner's pipeline records
	//  Return a map of the owner id and applicable conversion rate
	////////////////////////////
	public static Map<Id, Double> retrievePipelineOwnerConversionRate_Standard(Set<String> setOwnerIds) {
		//find each pipeline's currency and store it in a map where the owner of the pipeline is the key
		Map<Id, String> mapPipelineOwnerCurrency = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerCurrency(setOwnerIds);
		Set<String> setCurrencyCodes = new Set<String>();
		setCurrencyCodes.addAll(mapPipelineOwnerCurrency.values());

		//find the conversion rate for each currency
		Map<String, Double> mapCurrencyConversionRate = ADVSMS.SMS2_PipelineMethods.findCurrentCurrencyRates(setCurrencyCodes);

		//loop through the pipeline records and find the conversion rate for each currency tied to the pipeline
		Map<Id, Double> mapPipelineOwnerConversion = new Map<Id, Double>();
		for (Id ownerId : mapPipelineOwnerCurrency.keySet()) {
			mapPipelineOwnerConversion.put(ownerId
											, mapCurrencyConversionRate.get(mapPipelineOwnerCurrency.get(ownerId)));
		}

		system.debug('Inside retrievePipelineOwnerConversionRate.  mapPipelineOwnerConversion:\n' + mapPipelineOwnerConversion);
		return mapPipelineOwnerConversion;
	}

	////////////////////////////
	// Given a set of owners, find the conversion rate associated to the currency on each owner's pipeline records
	//  for the given dates.  We need this information if we are in a multi-currency org with Advanced Currency Mgmt
	//  enabled.  The amount for won opportunities is calcuated based on the exchange rate at the time the opportunity
	//  was won.
	//  Return a map of the owner id and applicable conversion rates by date
	//
	//  This function has an overloaded version which accepts a map of owner ids and close dates associated to that owner
	////////////////////////////
	public static Map<Id, Map<Date, Double>> retrievePipelineOwnerConversionRate_Dated(Set<String> setOwnerIds
																						, Date startDate
																						, Date endDate) {

		//find each pipeline's currency and store it in a map where the owner of the pipeline is the key
		Map<Id, String> mapPipelineOwnerCurrency = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerCurrency(setOwnerIds);
		Set<String> setCurrencyCodes = new Set<String>();
		setCurrencyCodes.addAll(mapPipelineOwnerCurrency.values());

		Map<String, Map<Date, Double>> mapCurrencyDateRates
			= ADVSMS.SMS2_PipelineMethods.findCurrencyRatesByDate(setCurrencyCodes, startDate, endDate, null);

		Map<Id, Map<Date, Double>> mapOwnerDateConversionRates = new Map<Id, Map<Date, Double>>();
		for (Id ownerId : mapPipelineOwnerCurrency.keySet()) {
			//retrieve the currency rates for the owner's id in the map and store in the new map
			mapOwnerDateConversionRates.put(ownerId, mapCurrencyDateRates.get(mapPipelineOwnerCurrency.get(ownerId)));
		}

		return mapOwnerDateConversionRates;
	}

	//Function overload
	// Given a map of owner id and associated close dates, return a map of conversion rates just for those dates
	public static Map<Id, Map<Date, Double>> retrievePipelineOwnerConversionRate_Dated(Map<String, Set<Date>> mapOwnerCloseDates) {
		//find each pipeline's currency and store it in a map where the owner of the pipeline is the key
		Map<Id, String> mapPipelineOwnerCurrency = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerCurrency(mapOwnerCloseDates.keySet());
		Set<String> setCurrencyCodes = new Set<String>();
		setCurrencyCodes.addAll(mapPipelineOwnerCurrency.values());

		Set<Date> setAllDates = new Set<Date>();
		for (Set<Date> setDate : mapOwnerCloseDates.values()) {
			setAllDates.addAll(setDate);
		}

		Map<String, Map<Date, Double>> mapCurrencyDateRates
			= ADVSMS.SMS2_PipelineMethods.findCurrencyRatesByDate(setCurrencyCodes, setAllDates);

		Map<Id, Map<Date, Double>> mapOwnerDateConversionRates = new Map<Id, Map<Date, Double>>();
		for (Id ownerId : mapPipelineOwnerCurrency.keySet()) {
			//retrieve the currency rates for the owner's id in the map and store in the new map
			mapOwnerDateConversionRates.put(ownerId, mapCurrencyDateRates.get(mapPipelineOwnerCurrency.get(ownerId)));
		}

		return mapOwnerDateConversionRates;
	}


	////////////////////////////
	// Given a set of owners, find the currency associated to each owner's pipeline records;  if we are not 
	//  in a multi-currency org, return 'Default'
	////////////////////////////
	public static Map<Id, String> retrievePipelineOwnerCurrency(Set<String> ownerIds) {
		Map<Id, String> mapPipelineOwnerCurrency = new Map<Id, String>();

		String soqlStmt;
		if (ADVSMS.SMS2_PipelineMethods.isMultiCurrencyEnabled()) {
			soqlStmt = 'Select ADVSMS__User__c, CurrencyIsoCode From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where ADVSMS__User__c in :ownerIds';
		} else {
			soqlStmt = 'Select ADVSMS__User__c From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where ADVSMS__User__c in :ownerIds';
		}
		system.debug('Inside retrievePipelineOwnerCurrency.  soqlstmt:\n' + soqlstmt);
		for (SObject pipeline : Database.query(soqlStmt)) {
			try {
				mapPipelineOwnerCurrency.put((Id)pipeline.get('ADVSMS__User__c'), (String)pipeline.get('CurrencyIsoCode'));
			} catch (Exception ex) {
				mapPipelineOwnerCurrency.put((Id)pipeline.get('ADVSMS__User__c'), 'Default');
			}
		}
		system.debug('Inside retrievePipelineOwnerCurrency.  mapPipelineOwnerCurrency:\n' + mapPipelineOwnerCurrency);
		return mapPipelineOwnerCurrency;
	}

	////////////////////////////
	// Return the conversion rate for the given currencies.
	// Look at the CurrencyType object to determine what the rate should be.  
	//  If multi-currency is not enabled for the org, the CurrencyType object will not exist 
	//  and conversion rate will be set to "1.0".
	//  If advanced currency is enabled, data will exist in the DatedConversionRate object
	////////////////////////////
	public static Map<String, Double> findCurrentCurrencyRates(Set<String> setCurrencyCodes) {
		Map<String, Double> mapCurrencyRates = new Map<String, Double>();
		mapCurrencyRates.put('Default', 1.0);
		for (String curr : setCurrencyCodes) {
			mapCurrencyRates.put(curr, 1.0);
		}

        String soqlStmt = 'Select IsoCode, ConversionRate, DecimalPlaces, IsActive, IsCorporate ';
        soqlStmt += 'From CurrencyType ';
        soqlStmt += 'Where IsoCode in :setCurrencyCodes ';
        soqlStmt += 'And IsActive = true';
        system.debug('mc query: ' + soqlStmt);

		if (ADVSMS.SMS2_PipelineMethods.isMultiCurrencyEnabled()) {
		    for (sObject ct : Database.query(soqlStmt)) {
		    	Double conversionRate = (Double)ct.get('ConversionRate');
		        mapCurrencyRates.put((String)ct.get('IsoCode'), conversionRate);
		        system.debug('***' + ct);
		    }
		}

		system.debug('Inside findCurrentCurrencyRates.  mapCurrencyRates:\n' + mapCurrencyRates);
		return mapCurrencyRates;		
	}

	//////////////////////////////////////
	// Investigate the DatedConversionRate object to find conversion rate for each currency code and 
	//  each day in the given date range.  Fill the map with the conversion rates for each day
	// If a set of dates is provided, only return conversion rates for those specific dates.
	//
	//  This function has an overloaded version as well which accepts a set of currency codes and dates
	//////////////////////////////////////
	public static Map<String, Map<Date, Double>> findCurrencyRatesByDate(Set<String> setCurrencyCodes
																			, Date startDate
																			, Date endDate
																			, Set<Date> setDates) {
		Map<Date, Double> mapDateRates = new Map<Date, Double>();
		Map<String, Map<Date, Double>> mapCurrencyDateRates = new Map<String, Map<Date, Double>>();

		//build a map for each day in the date range provided
		for (Date loopDate=startDate; loopDate<=endDate; loopDate=loopDate.addDays(1)) {
			mapDateRates.put(loopDate, 1);
		}
		mapCurrencyDateRates.put('Default', mapDateRates);
		for (String curr : setCurrencyCodes) {
			mapCurrencyDateRates.put(curr, mapDateRates);
		}

        String strStartDate = DateTime.newInstance(startDate, Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd');
        String strEndDate = DateTime.newInstance(endDate, Time.newInstance(0, 0, 0, 0)).format('yyyy-MM-dd');

        String soqlStmt = 'Select IsoCode, StartDate, NextStartDate, ConversionRate';
        soqlStmt += ' From DatedConversionRate';
        soqlStmt += ' Where IsoCode in :setCurrencyCodes';
        soqlStmt += ' And StartDate <= ' + strEndDate;
        soqlStmt += ' And NextStartDate > ' + strStartDate;
        soqlStmt += ' Order By IsoCode, StartDate';
        system.debug('dcr query: ' + soqlStmt);

		//only execute the query if dated conversion rates are enabled (Advanced Currency)
		if (ADVSMS.SMS2_PipelineMethods.isAdvancedCurrencyEnabled()) {
		    for (sObject dcr : Database.query(soqlStmt)) {
	            system.debug('dcr: ' + dcr);
	            String currencyCode = (String)dcr.get('IsoCode');
		    	Double conversionRate = (Double)dcr.get('ConversionRate');

				//if the start date for the conversion rate comes before the range we are given, set
				// the start of the conversion rate to be the start of our range
				Date conversionStartDate = (Date)dcr.get('StartDate');
	            if (conversionStartDate < startDate) {
	                conversionStartDate = startDate;
	            }
				//if the next start date for the conversion rate comes after the range we are given, set
				// the end of the conversion rate to be the end of our range
				Date conversionEndDate = (Date)dcr.get('NextStartDate');
				conversionEndDate = conversionEndDate.addDays(-1);
	            if (conversionEndDate > endDate) {
	                conversionEndDate = endDate;
	            }
				//retrieve the rates for this currency	            
				mapDateRates = mapCurrencyDateRates.get(currencyCode);

				//populate the dated conversion rates for each day in the date range
				for (Date loopDate=conversionStartDate; loopDate<=conversionEndDate; loopDate=loopDate.addDays(1)) {
					if (setDates == null || setDates.contains(loopDate)) {
						mapDateRates.put(loopDate, conversionRate);
					}
				}
				mapCurrencyDateRates.put(currencyCode, mapDateRates);
		    }
		}
		return mapCurrencyDateRates;
	}


	//Function overload
	// Given a set of currency codes and a set of dates, build a map of currency conversion rates
	//  just for the dates in the provided set
	public static Map<String, Map<Date, Double>> findCurrencyRatesByDate(Set<String> setCurrencyCodes
																			, Set<Date> setDates) {
		//find the earliest and latest dates to process
		Date startDate = Date.today();
		Date endDate = Date.today();
		for (Date processDate : setDates) {
			if (processDate < startDate) {
				startDate = processDate;
			}
			if (processDate > endDate) {
				endDate = processDate;
			}
		}

		Map<String, Map<Date, Double>> mapCurrencyDateRates
			= ADVSMS.SMS2_PipelineMethods.findCurrencyRatesByDate(setCurrencyCodes, startDate, endDate, setDates);

		return mapCurrencyDateRates;
	}


}