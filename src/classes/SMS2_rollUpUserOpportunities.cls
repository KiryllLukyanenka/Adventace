public with sharing class SMS2_rollUpUserOpportunities {

    /* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
    /////////////////////////////////////////
    // Updated 20120424 AAB / DCS
    // andyb@demandchainsystems.com
    /////////////////////////////////////////
    
    /////////////////////////
    // Constructor
    /////////////////////////
    public SMS2_rollUpUserOpportunities(Set<string> ownerIds) {
            
        /// FIGURE START AND END TO THIS MONTH
        
        Date tdy = System.today();
        Date startOfMonth = tdy.toStartOfMonth();
        Date endStartOfMonth = tdy.addMonths(1).toStartOfMonth();
    
        /// Figure start and end of next month
        
        Date startOfNextmonth = startOfMonth.addMonths(1);
        Date endOfNextmonth =  endStartOfMonth.addMonths(1);
        
        /// Figure Start and End of two months
        
        Date startOfTwomonth = startOfNextmonth.addMonths(1);
        Date endOfTwomonth =endOfNextmonth.addMonths(1); 
        
        System.debug('startOfNextmonth: ' + startOfNextmonth);
        System.debug('endOfNextmonth: ' + endOfNextmonth);
        System.debug('startOfTwomonth: ' + startOfTwomonth);
        System.debug('endOfTwomonth: ' + endOfTwomonth);

/*
        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NOC_this_month__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.User__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_A_Actual_Count__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_B_Currency__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_C_Currency__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_NW_Actual_Count__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NW_and_W_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NL_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_C_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_B_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_A_Actual__c.isUpdateable()) {

           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           return;
        }
        
        
        
        List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> performMetrics = 
            [Select Two_Months_Out_W_Expected__c, Two_Months_Out_Total_Expected__c, Two_Months_Out_NW_Expected__c, Two_Months_Out_A_Plus_Expected__c, 
                Two_Months_Out_A_Expected__c, Next_Month_W_Expected__c, Next_Month_Total_Expected__c, Next_Month_NW_Expected__c, Next_Month_A_Plus_Expected__c, 
                Next_Month_A_Expected__c,Two_Months_Out_W_Amount__c, Two_Months_Out_Total_Amount__c, Two_Months_Out_NW_Amount__c, Two_Months_Out_A_Plus_Amount__c, 
                Two_Months_Out_A_Amount__c, Next_Month_W_Amount__c, Next_Month_Total_Amount__c, Next_Month_NW_Amount__c, Next_Month_A_Plus_Amount__c, Next_Month_A_Amount__c, 
                Current_Month_W_Expected__c, Current_Month_W_Amount__c, Current_Month_Total_Expected__c, Current_Month_Total_Amount__c, Current_Month_NW_Expected__c, 
                Current_Month_NW_Amount__c, Current_Month_A_Plus_Expected__c, Current_Month_A_Plus_Amount__c, Current_Month_A_Expected__c, Current_Month_A_Amount__c, 
                NOC_this_month__c, User__c, Stage_A_Actual_Count__c, Stage_B_Currency__c ,Stage_C_Currency__c,Stage_NW_Actual_Count__c, NW_and_W_Actual__c,NL_Actual__c,Stage_C_Actual__c, 
                Stage_B_Actual__c, Stage_A_Actual__c 
            From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c 
            Where User__c in :ownerIds 
            Limit 1000];
            
        //Changed by EBG/DCS on 20151002 - added additional filter 
        List<Opportunity> allOpportunitiesThisYear =[Select Name
                                                            , ADVSMS__NOC_Date__c
                                                            , CreatedDate
                                                            , ExpectedRevenue
                                                            , OwnerId
                                                            , StageName
                                                            , Amount
                                                            , CloseDate 
                                                    from Opportunity 
                                                    Where OwnerId  in :ownerIds 
                                                        AND ADVSMS__NOC_Date__c != null 
                                                        AND (IsClosed = false 
                                                            Or (CloseDate >= :startOfMonth 
                                                                    And CloseDate < :endStartOfMonth))
                                                    Limit 1000];
        List<Opportunity> allOpportunitiesThisYear2 =[Select Name
                                                            , ADVSMS__NOC_Date__c
                                                            , CreatedDate
                                                            , ExpectedRevenue
                                                            , OwnerId
                                                            , StageName
                                                            , Amount
                                                            , CloseDate 
                                                        from Opportunity 
                                                        Where closeDate >= :startOfMonth 
                                                            AND closeDate < :endOfTwomonth 
                                                            AND OwnerId  in :ownerIds 
                                                            AND ADVSMS__NOC_Date__c != null 
                                                        Limit 1000];
        
        
        for (ADVSMS__TACE_Pipeline_Balancing_Algorithm__c pm : performMetrics) {

            //TACE_Pipeline_Balancing_Algorithm__c thisUserPerformanceMetric  = performMetrics[0];
                            
            //// STEP 2
            //// Go get a list of all opportunities for this year owned by
            //// this userId
                    
            /// WHAT DATE SHOULD I BE USING??? ALL OPEN OPPORTUNITIES??
                                        
            System.Debug('allOpportunitiesThisYear.size(): ' + allOpportunitiesThisYear.size());
                    
                    /// Step 1 
                    /// Loop through them and total up all the fields
                    //// Stage_A_Actual__c - Currency
                    ///  Stage_B_Actual__c = Count
                    ///  Stage_C_Actual__c = count
                                
                    Double stageAacualCurrency = 0;
                    Integer stageAacualCount = 0;
                    
                    Double stageBacualCurrency = 0;
                    Integer stageBacualCount = 0;
                    
                    Double stageCacualCurrency = 0;
                    Integer stageCacualCount = 0;
                    
                    Double stageNLacualCurrency = 0;
                    Integer stageNLacualCount = 0;
                    
                    Double stageNWacualCurrency = 0;
                    Integer stageNWacualCount = 0;
                    
                    Integer NOCthisMonth = 0;
                    
                    /// STAGE NAMES
                    // (A+) Power Promoter
                    // (A) Power Promoter
                    // (B) Promoter
                    // (C) Candidate
                    // (W) Win
                    // (NW) Near Win
                    // (NL) Near Loss
                    
                    
                    Double thisMonthAactual = 0;
                    Double thisMonthAplusActual = 0;
                    Double thisMonthNWActual = 0;
                    Double thisMonthWActual = 0;
                    Double thisMonthTotalActual = 0;
                    
                    Double nextMonthAactual = 0;
                    Double nextMonthAplusActual = 0;
                    Double nextMonthNWActual = 0;
                    Double nextMonthWActual = 0;
                    Double nextMonthTotalActual = 0;
                    
                    Double twoMonthAactual = 0;
                    Double twoMonthAplusActual = 0;
                    Double twoMonthNWActual = 0;
                    Double twoMonthWActual = 0;
                    Double twoMonthTotalActual = 0;
                    
                    ///
                    
                    Double thisMonthAexpec = 0;
                    Double thisMonthAplusexpec = 0;
                    Double thisMonthNWexpec = 0;
                    Double thisMonthWexpec = 0;
                    Double thisMonthTotalexpec = 0;
                    
                    Double nextMonthAexpec= 0;
                    Double nextMonthAplusexpec = 0;
                    Double nextMonthNWexpec = 0;
                    Double nextMonthWexpec = 0;
                    Double nextMonthTotalexpec = 0;
                    
                    Double twoMonthAexpec = 0;
                    Double twoMonthAplusexpec = 0;
                    Double twoMonthNWexpec = 0;
                    Double twoMonthWexpec = 0;
                    Double twoMonthTotalexpec = 0;
                    
                    for(Opportunity  thisOpp:allOpportunitiesThisYear2) {
                    
                        if(thisOpp.ownerId == pm.user__c) { 
                            
                            Date closeDate = date.newinstance(thisOpp.CloseDate.year(), thisOpp.CloseDate.month(), thisOpp.CloseDate.day());
                            if(closeDate >= startOfMonth && closeDate < endStartOfMonth) {
                        
                                /// THIS IS WHERE
                                /// I WILL ROLL UP ALL THE FORECAST NUMBERS FOR 
                                /// THIS MONTH
                                
                                if( thisOpp.StageName == '(A) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        thisMonthAactual += thisOpp.Amount;
                                        thisMonthTotalActual += thisOpp.Amount;
                                    }
                                    
                                    if(thisOpp.ExpectedRevenue != null) {
                                        thisMonthAexpec += thisOpp.ExpectedRevenue;
                                        thisMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }
                                }
                                
                                if(thisOpp.StageName == '(A+) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        thisMonthAplusActual += thisOpp.Amount;
                                        thisMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        thisMonthAplusexpec += thisOpp.ExpectedRevenue;
                                        thisMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }   
                                }
                                    
                                if(thisOpp.StageName == '(NW) Near Win' ){
                                    if(thisOpp.Amount != null) {
                                        thisMonthNWActual += thisOpp.Amount;
                                        thisMonthNWActual += thisOpp.Amount;
                                        thisMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        thisMonthNWexpec += thisOpp.ExpectedRevenue;
                                        thisMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }   
                                }

                                    
                                if(thisOpp.StageName == '(W) Win' ){
                                    if(thisOpp.Amount != null) {
                                        thisMonthWActual += thisOpp.Amount;
                                        thisMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        thisMonthWexpec += thisOpp.ExpectedRevenue;
                                        thisMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }                       
                                }
                                            
                            } /// THIS MONTH
                        
                            /// NEXT MONTH                                
                            if(closeDate >= startOfNextmonth && closeDate < endOfNextmonth) {
                                
                                /// THIS IS WHERE
                                /// I WILL ROLL UP ALL THE FORECAST NUMBERS FOR 
                                /// THIS MONTH
                                
                                if( thisOpp.StageName == '(A) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        nextMonthAactual += thisOpp.Amount;
                                        nextMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        nextMonthAexpec += thisOpp.ExpectedRevenue;
                                        nextMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }
                                }
                                
                                if(thisOpp.StageName == '(A+) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        nextMonthAplusActual += thisOpp.Amount;
                                        nextMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        nextMonthAplusexpec += thisOpp.ExpectedRevenue;
                                        nextMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }       
                                }
                                    
                                if(thisOpp.StageName == '(NW) Near Win' ){
                                    if(thisOpp.Amount != null) {
                                        nextMonthNWActual += thisOpp.Amount;
                                        nextMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        nextMonthNWexpec += thisOpp.ExpectedRevenue;
                                        nextMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }   
                                }

                                    
                                if(thisOpp.StageName == '(W) Win' ){
                                    if(thisOpp.Amount != null) {
                                        nextMonthWActual += thisOpp.Amount;
                                        nextMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        nextMonthWexpec += thisOpp.ExpectedRevenue;
                                        nextMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }                       
                                }
                                            
                            }
                            ///// TWO MONTHS
                            
                            if(closeDate >= startOfTwomonth && closeDate < endOfTwomonth) {
                                
                                /// THIS IS WHERE
                                /// I WILL ROLL UP ALL THE FORECAST NUMBERS FOR 
                                /// THIS MONTH
                                
                                if( thisOpp.StageName == '(A) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        twoMonthAactual += thisOpp.Amount;
                                        twoMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        twoMonthAexpec += thisOpp.ExpectedRevenue;
                                        twoMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }   
                                    
                                }
                                
                                if(thisOpp.StageName == '(A+) Power Promoter'){
                                    if(thisOpp.Amount != null) {
                                        twoMonthAplusActual += thisOpp.Amount;
                                        twoMonthTotalActual += thisOpp.Amount;
                                    }   
                                    if(thisOpp.ExpectedRevenue != null) {
                                        twoMonthAplusexpec += thisOpp.ExpectedRevenue;
                                        twoMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }       
                                }
                                    
                                if(thisOpp.StageName == '(NW) Near Win' ){
                                    if(thisOpp.Amount != null) {
                                        twoMonthNWActual += thisOpp.Amount;
                                        twoMonthTotalActual += thisOpp.Amount;
                                    }
                                    if(thisOpp.ExpectedRevenue != null) {
                                        twoMonthNWexpec += thisOpp.ExpectedRevenue;
                                        twoMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }       
                                }

                                    
                                if(thisOpp.StageName == '(W) Win' ){
                                    if(thisOpp.Amount != null) {
                                        twoMonthWActual += thisOpp.Amount;
                                        twoMonthTotalActual += thisOpp.Amount;
                                    }   
                                    if(thisOpp.ExpectedRevenue != null) {
                                        twoMonthWexpec += thisOpp.ExpectedRevenue;
                                        twoMonthTotalexpec  += thisOpp.ExpectedRevenue;
                                    }                   
                                }
                                            
                            }
                        }
                    }
                    for(Opportunity  thisOpp:allOpportunitiesThisYear) {

                        System.Debug('Checking Opp ' + thisOpp.Id + ' by ' + thisOpp.ownerId + ' to see if ' + pm.user__c + ' and NOCthisMonth = ' + NOCthisMonth);
                        
                        if(thisOpp.ownerId == pm.user__c) { 
                            System.Debug('Yup, we\'re in the conditional');
                            //Date cd = date.newinstance(thisOpp.CreatedDate.year(), thisOpp.CreatedDate.month(), thisOpp.CreatedDate.day());
                            Date cd = thisOpp.ADVSMS__NOC_Date__c;
                            //if(thisOpp.ADVSMS__NOC_Date__c != null) { cd = thisOpp.ADVSMS__NOC_Date__c; }

                            System.Debug('Comparison Date = ' + cd);
                                                        
                            if(cd >= startOfMonth && cd < endStartOfMonth) { NOCthisMonth++; }

                            System.Debug('New NOCthisMonth = ' + NOCthisMonth);

                            //// EOF TWO MONTH
                            
                            if(thisOpp.StageName == '(A+) Power Promoter' || thisOpp.StageName == '(A) Power Promoter'){
                                if(thisOpp.Amount != null) {
                                    stageAacualCurrency += thisOpp.Amount;
                                }
                                stageAacualCount += 1;
                            }
                            
                            if(thisOpp.StageName == '(NW) Near Win' || thisOpp.StageName == '(W) Win'){
                                if(thisOpp.Amount != null) {
                                    stageNWacualCurrency += thisOpp.Amount;
                                }
                                stageNWacualCount += 1;
                            }
                            
                            if(thisOpp.StageName == '(B) Promoter'){
                                if(thisOpp.Amount != null) {
                                    stageBacualCurrency += thisOpp.Amount;
                                }
                                stageBacualCount += 1;
                            }
                            
                            if(thisOpp.StageName == '(C) Candidate' ){
                                if(thisOpp.Amount != null) {
                                    stageCacualCurrency += thisOpp.Amount;
                                }
                                stageCacualCount += 1;
                            }
                            
                            if(thisOpp.StageName == '(NL) Near Loss' ){
                                if(thisOpp.Amount != null) {
                                    stageNLacualCurrency += thisOpp.Amount;
                                }
                                stageNLacualCount += 1;
                            }
                        }

                        //System.Debug('stageAacualCurrency: ' + stageAacualCurrency);
                        //System.Debug('stageAacualCount: ' + stageAacualCount);
                        
                        //System.Debug('stageBacualCurrency: ' + stageBacualCurrency);
                        //System.Debug('stageBacualCount: ' + stageBacualCount);
                        
                        //System.Debug('stageCacualCurrency: ' + stageCacualCurrency);
                        //System.Debug('stageCacualCount: ' + stageCacualCount);
                        
                        //System.Debug('stageNWacualCurrency: ' + stageNWacualCurrency);
                        //System.Debug('stageNWacualCount: ' + stageNWacualCount);
                        
                        //System.Debug('stageNLacualCurrency: ' + stageNLacualCurrency);
                        //System.Debug('stageNLacualCount: ' + stageNLacualCount);

                        
                        //// UPDATE THIER PERFORMANCE METRICS
                        
                        pm.Stage_A_Actual__c = stageAacualCurrency; 
                        pm.Stage_A_Actual_Count__c =stageAacualCount;
                        pm.Stage_B_Actual__c = stageBacualCount;
                        pm.Stage_B_Currency__c = stageBacualCurrency;
                        pm.Stage_C_Actual__c = stageCacualCount;
                        pm.Stage_C_Currency__c = stageCacualCurrency;
                        pm.NW_and_W_Actual__c =stageNWacualCurrency+thisMonthWActual;
                        pm.Stage_NW_Actual_Count__c = stageNWacualCount;
                        pm.NOC_this_month__c = NOCthisMonth;
                        pm.Current_Month_W_Amount__c = thisMonthWActual;
                        pm.Current_Month_Total_Amount__c = thisMonthTotalActual;
                        pm.Current_Month_NW_Amount__c = thisMonthNWActual;
                        pm.Current_Month_A_Plus_Amount__c = thisMonthAplusActual;                       
                        pm.Current_Month_A_Amount__c =thisMonthAactual;
                        
                        pm.Two_Months_Out_W_Amount__c =twoMonthWActual;
                        pm.Two_Months_Out_Total_Amount__c = twoMonthTotalActual;
                        pm.Two_Months_Out_NW_Amount__c = twoMonthNWActual;
                        pm.Two_Months_Out_A_Plus_Amount__c = twoMonthAplusActual;
                        pm.Two_Months_Out_A_Amount__c = twoMonthAactual;
                        
                        pm.Next_Month_W_Amount__c = nextMonthWActual;
                        pm.Next_Month_Total_Amount__c = nextMonthTotalActual;
                        pm.Next_Month_NW_Amount__c = nextMonthNWActual;
                        pm.Next_Month_A_Plus_Amount__c = nextMonthAplusActual;
                        pm.Next_Month_A_Amount__c = nextMonthAactual;
    
                        pm.Current_Month_W_Expected__c = thisMonthWexpec;
                        pm.Current_Month_Total_Expected__c = thisMonthTotalexpec;
                        pm.Current_Month_NW_Expected__c = thisMonthNWexpec;
                        pm.Current_Month_A_Plus_Expected__c = thisMonthAplusexpec;
                        pm.Current_Month_A_Expected__c = thisMonthAexpec;
                        
                        pm.Two_Months_Out_W_Expected__c = twoMonthWexpec;
                        pm.Two_Months_Out_Total_Expected__c = twoMonthTotalexpec;
                        pm.Two_Months_Out_NW_Expected__c =twoMonthNWexpec;
                        pm.Two_Months_Out_A_Plus_Expected__c =twoMonthAplusexpec;
                        pm.Two_Months_Out_A_Expected__c =twoMonthAexpec;
                        
                        pm.Next_Month_W_Expected__c = nextMonthWexpec;
                        pm.Next_Month_Total_Expected__c = nextMonthTotalexpec;
                        pm.Next_Month_NW_Expected__c = nextMonthNWexpec;
                        pm.Next_Month_A_Plus_Expected__c = nextMonthAplusexpec;
                        pm.Next_Month_A_Expected__c = nextMonthAexpec;
        
                    }
        }
                    
        if(performMetrics.size() > 0) {update performMetrics;}
*/        
    }


    //created by EBG/DCS on 20151118 to help streamline summary process
    // converted existing code to a future method and opportunity queries
    // to be aggregates.  Helper class for maps in future method
    //helper class
    public class hclsOppSum {
        Decimal Amount;
        Decimal ExpectedRevenue;
        Integer OpportunityCount;

        //constructor to pre-load fields
        public hclsOppSum(Decimal a, Decimal exp, Integer cnt) {
            this.Amount = a;
            this.ExpectedRevenue = exp;
            this.OpportunityCount = cnt;
        }
    }

    @future
    public static void buildPipelineForUsers_Future(Set<String> ownerIds) {
        ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers(ownerIds);
    }

    public static void buildPipelineForUsers(Set<string> ownerIds) {
            
        /// FIGURE START AND END TO THIS MONTH
        Date tdy = System.today();
        Date startOfThisMonth = tdy.toStartOfMonth();
        Date startOfNextMonth = startOfThisMonth.addMonths(1);
        Date startOfTwoMonthsFromNow = startOfThisMonth.addMonths(2);
        Date startOfThreeMonthsFromNow = startOfThisMonth.addMonths(3);
        Date startOfThisYear = Date.newInstance(tdy.year(), 1, 1);
        Date startOfNextYear = startOfThisYear.addYears(1);
        
        system.debug('*** Inside buildPipelineForUsers.\nstartOfThisMonth: ' + startOfThisMonth 
                     								+ '\nstartOfNextMonth: ' + startOfNextMonth 
                     								+ '\nstartOfTwoMonthsFromNow: ' + startOfTwoMonthsFromNow 
                     								+ '\nstartOfThreeMonthsFromNow: ' + startOfThreeMonthsFromNow);

        // Check for CRUD/FLS
        if(!Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_W_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_Total_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_NW_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Two_Months_Out_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_W_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_Total_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Next_Month_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_NW_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Plus_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Plus_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Expected__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Current_Month_A_Amount__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NOC_this_month__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.User__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_A_Actual_Count__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_B_Currency__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_C_Currency__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_NW_Actual_Count__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NW_and_W_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.NL_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_C_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_B_Actual__c.isUpdateable() ||
            !Schema.sObjectType.ADVSMS__TACE_Pipeline_Balancing_Algorithm__c.fields.Stage_A_Actual__c.isUpdateable()) {

           system.debug('*** Insufficient access to update record!'); 
           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, 'Insufficient access to update record!')); 
           return;
        }
                
        //retrieve the pipeline records for the provided owners
        List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> performMetrics = 
            [Select Two_Months_Out_W_Expected__c, Two_Months_Out_Total_Expected__c, Two_Months_Out_NW_Expected__c, 
                    Two_Months_Out_A_Plus_Expected__c, Two_Months_Out_A_Expected__c, 
                    Next_Month_W_Expected__c, Next_Month_Total_Expected__c, Next_Month_NW_Expected__c, 
                    Next_Month_A_Plus_Expected__c, Next_Month_A_Expected__c,
                    Two_Months_Out_W_Amount__c, Two_Months_Out_Total_Amount__c, Two_Months_Out_NW_Amount__c, 
                    Two_Months_Out_A_Plus_Amount__c, Two_Months_Out_A_Amount__c, 
                    Next_Month_W_Amount__c, Next_Month_Total_Amount__c, Next_Month_NW_Amount__c, 
                    Next_Month_A_Plus_Amount__c, Next_Month_A_Amount__c, 
                    Current_Month_W_Expected__c, Current_Month_W_Amount__c, Current_Month_Total_Expected__c, 
                    Current_Month_Total_Amount__c, Current_Month_NW_Expected__c, Current_Month_NW_Amount__c, 
                    Current_Month_A_Plus_Expected__c, Current_Month_A_Plus_Amount__c, Current_Month_A_Expected__c, 
                    Current_Month_A_Amount__c, NOC_this_month__c, User__c, Stage_A_Actual_Count__c, Stage_B_Currency__c,
                    Stage_C_Currency__c,Stage_NW_Actual_Count__c, NW_and_W_Actual__c, NL_Actual__c, Stage_C_Actual__c, 
                    Stage_B_Actual__c, Stage_A_Actual__c, Id
            From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c 
            Where User__c in :ownerIds];
        system.debug('*** Pipeline Count: ' + performMetrics.size()); 

        //Added by EBG/DCS on 20151204
        // Find the currency conversion rate for each pipeline owner.  If we are not in a multi-currency org, the conversion
        //  rate will be 1
        Map<Id, Double> mapOwnerConversionRate_Standard 
            = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerConversionRate_Standard(ownerIds);
/*
        // Find the dated currency conversion rates for each pipeline owner
        Map<Id, Map<Date, Double>> mapOwnerConversionRate_Dated
            = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerConversionRate_Dated(ownerIds
                                                                            , startOfThisMonth
                                                                            , startOfThreeMonthsFromNow.addDays(-1));
*/
        Map<Id, Map<Date, Double>> mapOwnerConversionRate_Dated = new Map<Id, Map<Date, Double>>();
        Boolean blnAdvancedCurrencyEnabled = ADVSMS.SMS2_PipelineMethods.isAdvancedCurrencyEnabled();

        //create a series of maps which summarize opportunities by owner, date and stage
        // Maps are used to reduce number of loops through the opportunities when we
        // start processing the pipelines
        
        //helper class variable
        ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum hlpOppSum 
            = new ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum(0.0, 0.0, 0);

        //map of stage and helper class
        Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum> mapOwnerDateStageSummary
            = new Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>();

        //map of date with map of stage and helper class
        Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>> mapOwnerDateSummary =
            new Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>();

        //map of owner id with map defined above where date is the close date of opportunities
        Map<Id, Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>> mapOwnerSummary_CloseDate =
            new Map<Id, Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>>();

        //map of owner id with map defined above where date is the NOC date of opportunities
        Map<Id, Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>> mapOwnerSummary_NocDate =
            new Map<Id, Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>>();


        //if advanced multi-currency is enabled, we need to find the conversion rate for the close
        // date of every opportunity that is open or won this year
        Map<String, Set<Date>> mapOwnerCloseDates = new Map<String, Set<Date>>();
        Set<Date> setCloseDates = new Set<Date>();
        if (blnAdvancedCurrencyEnabled == true) {
            for (AggregateResult ar : [Select OwnerId
                                                , CloseDate
                                                , COUNT(Id) Opp_COUNT
                                        From Opportunity
                                        Where OwnerId  in :ownerIds 
                                            AND ADVSMS__NOC_Date__c != null 
                                            AND (IsClosed = false 
                                                Or (IsWon = true
                                                    And CloseDate >= :startOfThisYear 
                                                    And CloseDate < :startOfNextYear))                           
                                        Group By OwnerId
                                                , CloseDate
                                        Order By OwnerId
                                                , CloseDate]) {
                system.debug('***Results for Advanced Currency Close Date:\n' + ar);            
                setCloseDates = new Set<Date>();
                if (mapOwnerCloseDates.containsKey((String)ar.get('OwnerId'))) {
                    setCloseDates = mapOwnerCloseDates.get((String)ar.get('OwnerId'));
                }
                setCloseDates.add((Date)ar.get('CloseDate'));
                mapOwnerCloseDates.put((String)ar.get('OwnerId'), setCloseDates);
            }

            mapOwnerConversionRate_Dated = ADVSMS.SMS2_PipelineMethods.retrievePipelineOwnerConversionRate_Dated(mapOwnerCloseDates);
        }


        //Close Date specific - load maps as we loop through the summarized opportunities
        // find all opportunities with a NOC date that are either open or were won this year
        for (AggregateResult ar : [Select OwnerId
                                            , StageName
                                            , IsWon
                                            , CloseDate
                                            , CALENDAR_YEAR(CloseDate) CloseYear
                                            , CALENDAR_MONTH(CloseDate) CloseMonth
                                            , SUM(Amount) Amount_SUM
                                            , SUM(ExpectedRevenue) Revenue_SUM
                                            , COUNT(Id) Opp_COUNT
                                    From Opportunity
                                    Where OwnerId  in :ownerIds 
                                        AND ADVSMS__NOC_Date__c != null 
                                        AND (IsClosed = false 
                                            Or (IsWon = true
                                                And CloseDate >= :startOfThisYear 
                                                And CloseDate < :startOfNextYear))                           
                                    Group By OwnerId
                                            , StageName
                                            , IsWon
                                            , CloseDate
                                            , CALENDAR_YEAR(CloseDate)
                                            , CALENDAR_MONTH(CloseDate)]) {
            system.debug('***Results for Close Date:\n' + ar);

            Id oppOwnerId = (Id)ar.get('OwnerId');
            String oppStageName = (String)ar.get('StageName');
            Boolean oppIsWon = (Boolean)ar.get('IsWon');
            Date oppCloseDate = (Date)ar.get('CloseDate');
            //create a date for the first of the month of the close date
            Date dateFirstOfCloseMonth = Date.newinstance(Integer.valueOf(ar.get('CloseYear'))
                                                            , Integer.valueOf(ar.get('CloseMonth'))
                                                            , 1);

            //for each pipeline owner, create a series of maps breaking the data down by date and stage
            hlpOppSum = new ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum(0.0, 0.0, 0);
            mapOwnerDateStageSummary = new Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>();
            mapOwnerDateSummary = new Map<Date, Map<String, hclsOppSum>>();
            if (mapOwnerSummary_CloseDate.containsKey(oppOwnerId)) {
                mapOwnerDateSummary = mapOwnerSummary_CloseDate.get(oppOwnerId);
                if (mapOwnerDateSummary.containsKey(dateFirstOfCloseMonth)) {
                    mapOwnerDateStageSummary = mapOwnerDateSummary.get(dateFirstOfCloseMonth);
                    if (mapOwnerDateStageSummary.containsKey(oppStageName)) {
                        hlpOppSum = mapOwnerDateStageSummary.get(oppStageName);
                    }
                }
            }
            //update the amount, expected revenue, and opportunity count for this owner, stage, and month
            // Calculate the amount by applying the conversion rate for the owner.  If an org has advanced currency
            //  turned on, we need to apply a dated conversion rate based on the close date of the opportunity
            if (blnAdvancedCurrencyEnabled == true) {
                hlpOppSum.Amount += (Double)ar.get('Amount_SUM') * mapOwnerConversionRate_Dated.get(oppOwnerId).get(oppCloseDate);
                hlpOppSum.ExpectedRevenue += (Double)ar.get('Revenue_SUM') * mapOwnerConversionRate_Dated.get(oppOwnerId).get(oppCloseDate);
                system.debug('Converted Amount: ' + hlpOppSum.Amount + ' Conversion Rate: ' + mapOwnerConversionRate_Dated.get(oppOwnerId).get(oppCloseDate));
            } else {
                hlpOppSum.Amount += (Double)ar.get('Amount_SUM') * mapOwnerConversionRate_Standard.get(oppOwnerId);
                hlpOppSum.ExpectedRevenue += (Double)ar.get('Revenue_SUM') * mapOwnerConversionRate_Standard.get(oppOwnerId);
            }
            hlpOppSum.OpportunityCount += (Integer)ar.get('Opp_COUNT');

            //push the update values back into the maps
            mapOwnerDateStageSummary.put((String)ar.get('StageName'), hlpOppSum);
            mapOwnerDateSummary.put(dateFirstOfCloseMonth, mapOwnerDateStageSummary);
            mapOwnerSummary_CloseDate.put((Id)ar.get('OwnerId'), mapOwnerDateSummary);
        }


        //NOC DATE specific code.  Same as above except from perspective of NOC Date instead of Close Date
        // find all open opportunities with a NOC date
        for (AggregateResult ar : [Select OwnerId
                                            , StageName
                                            , IsWon
                                            , CloseDate
                                            , CALENDAR_YEAR(ADVSMS__NOC_Date__c) NocYear
                                            , CALENDAR_MONTH(ADVSMS__NOC_Date__c) NocMonth
                                            , SUM(Amount) Amount_SUM
                                            , SUM(ExpectedRevenue) Revenue_SUM
                                            , COUNT(Id) Opp_COUNT
                                    From Opportunity
                                    Where OwnerId  in :ownerIds 
                                        AND ADVSMS__NOC_Date__c != null 
                                        AND (IsClosed = false
                                            OR (IsWon = true
                                                And CloseDate >= :startOfThisYear
                                                And CloseDate < :startOfNextYear))
                                    Group By OwnerId
                                            , StageName
                                            , IsWon
                                            , CloseDate
                                            , CALENDAR_YEAR(ADVSMS__NOC_Date__c)
                                            , CALENDAR_MONTH(ADVSMS__NOC_Date__c)]) {
            system.debug('***Results for NOC Date:\n' + ar);

            Id oppOwnerId = (Id)ar.get('OwnerId');
            String oppStageName = (String)ar.get('StageName');
            Boolean oppIsWon = (Boolean)ar.get('IsWon');
            Date oppCloseDate = (Date)ar.get('CloseDate');
            //create a date for the first of the month of the close date
            Date dateFirstOfNocMonth = Date.newinstance(Integer.valueOf(ar.get('NocYear'))
                                                            , Integer.valueOf(ar.get('NocMonth'))
                                                            , 1);

            hlpOppSum = new ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum(0.0, 0.0, 0);
            mapOwnerDateStageSummary = new Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>();
            mapOwnerDateSummary = new Map<Date, Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum>>();
            if (mapOwnerSummary_NocDate.containsKey(oppOwnerId)) {
                mapOwnerDateSummary = mapOwnerSummary_NocDate.get(oppOwnerId);
                if (mapOwnerDateSummary.containsKey(dateFirstOfNocMonth)) {
                    mapOwnerDateStageSummary = mapOwnerDateSummary.get(dateFirstOfNocMonth);
                    if (mapOwnerDateStageSummary.containsKey(oppStageName)) {
                        hlpOppSum = mapOwnerDateStageSummary.get(oppStageName);
                    }
                }
            }
            //update the amount, expected revenue, and opportunity count for this owner, stage, and month
            // Calculate the amount by applying the conversion rate for the owner.  If an org has advanced currency
            //  turned on, we need to apply a dated conversion rate based on the close date of the opportunity
            if (blnAdvancedCurrencyEnabled == true) {
                hlpOppSum.Amount += (Double)ar.get('Amount_SUM') * mapOwnerConversionRate_Dated.get(oppOwnerId).get(oppCloseDate);
                hlpOppSum.ExpectedRevenue += (Double)ar.get('Revenue_SUM') * mapOwnerConversionRate_Dated.get(oppOwnerId).get(oppCloseDate);
            } else {
                hlpOppSum.Amount += (Double)ar.get('Amount_SUM') * mapOwnerConversionRate_Standard.get(oppOwnerId);
                hlpOppSum.ExpectedRevenue += (Double)ar.get('Revenue_SUM') * mapOwnerConversionRate_Standard.get(oppOwnerId);
            }
            hlpOppSum.OpportunityCount += (Integer)ar.get('Opp_COUNT');

            //push the update values back into the maps
            mapOwnerDateStageSummary.put((String)ar.get('StageName'), hlpOppSum);
            mapOwnerDateSummary.put(dateFirstOfNocMonth, mapOwnerDateStageSummary);
            mapOwnerSummary_NocDate.put((Id)ar.get('OwnerId'), mapOwnerDateSummary);
        }
        
        //loop through the pipeline records and update based on maps loaded above
        for (ADVSMS__TACE_Pipeline_Balancing_Algorithm__c pm : performMetrics) {
                   
            //clear out variables for each new pipeline record             
                    
            /// STAGE NAMES
            // (A+) Power Promoter
            // (A) Power Promoter
            // (B) Promoter
            // (C) Candidate
            // (W) Win
            // (NW) Near Win
            // (NL) Near Loss
                        
            Double thisMonthAactual = 0;
            Double thisMonthAplusActual = 0;
            Double thisMonthNWActual = 0;
            Double thisMonthWActual = 0;
            Double thisMonthTotalActual = 0;
            
            Double nextMonthAactual = 0;
            Double nextMonthAplusActual = 0;
            Double nextMonthNWActual = 0;
            Double nextMonthWActual = 0;
            Double nextMonthTotalActual = 0;
            
            Double twoMonthAactual = 0;
            Double twoMonthAplusActual = 0;
            Double twoMonthNWActual = 0;
            Double twoMonthWActual = 0;
            Double twoMonthTotalActual = 0;
                    
            ///
                    
            Double thisMonthAexpec = 0;
            Double thisMonthAplusexpec = 0;
            Double thisMonthNWexpec = 0;
            Double thisMonthWexpec = 0;
            Double thisMonthTotalexpec = 0;
            
            Double nextMonthAexpec= 0;
            Double nextMonthAplusexpec = 0;
            Double nextMonthNWexpec = 0;
            Double nextMonthWexpec = 0;
            Double nextMonthTotalexpec = 0;
            
            Double twoMonthAexpec = 0;
            Double twoMonthAplusexpec = 0;
            Double twoMonthNWexpec = 0;
            Double twoMonthWexpec = 0;
            Double twoMonthTotalexpec = 0;

            //retrieve data for Close Date related items
            if (mapOwnerSummary_CloseDate.containsKey(pm.User__c)) {
                mapOwnerDateSummary = mapOwnerSummary_CloseDate.get(pm.User__c);
                //this month
                if (mapOwnerDateSummary.containsKey(startOfThisMonth)) {
                    mapOwnerDateStageSummary = mapOwnerDateSummary.get(startOfThisMonth);

                    if (mapOwnerDateStageSummary.containsKey('(A) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A) Power Promoter');
                        thisMonthAactual += hlpOppSum.Amount;
                        thisMonthTotalActual += hlpOppSum.Amount;
                        thisMonthAexpec += hlpOppSum.ExpectedRevenue;
                        thisMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(A+) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A+) Power Promoter');
                        thisMonthAplusActual += hlpOppSum.Amount;
                        thisMonthTotalActual += hlpOppSum.Amount;
                        thisMonthAplusexpec += hlpOppSum.ExpectedRevenue;
                        thisMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                    if (mapOwnerDateStageSummary.containsKey('(NW) Near Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(NW) Near Win');
                        thisMonthNWActual += hlpOppSum.Amount;
                        thisMonthTotalActual += hlpOppSum.Amount;
                        thisMonthNWexpec += hlpOppSum.ExpectedRevenue;
                        thisMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(W) Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(W) Win');
                        thisMonthWActual += hlpOppSum.Amount;
                        thisMonthTotalActual += hlpOppSum.Amount;
                        thisMonthWexpec += hlpOppSum.ExpectedRevenue;
                        thisMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                }

                //next month
                if (mapOwnerDateSummary.containsKey(startOfNextMonth)) {
                    mapOwnerDateStageSummary = mapOwnerDateSummary.get(startOfNextMonth);

                    if (mapOwnerDateStageSummary.containsKey('(A) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A) Power Promoter');
                        nextMonthAactual += hlpOppSum.Amount;
                        nextMonthTotalActual += hlpOppSum.Amount;
                        nextMonthAexpec += hlpOppSum.ExpectedRevenue;
                        nextMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(A+) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A+) Power Promoter');
                        nextMonthAplusActual += hlpOppSum.Amount;
                        nextMonthTotalActual += hlpOppSum.Amount;
                        nextMonthAplusexpec += hlpOppSum.ExpectedRevenue;
                        nextMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                    if (mapOwnerDateStageSummary.containsKey('(NW) Near Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(NW) Near Win');
                        nextMonthNWActual += hlpOppSum.Amount;
                        nextMonthTotalActual += hlpOppSum.Amount;
                        nextMonthNWexpec += hlpOppSum.ExpectedRevenue;
                        nextMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(W) Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(W) Win');
                        nextMonthWActual += hlpOppSum.Amount;
                        nextMonthTotalActual += hlpOppSum.Amount;
                        nextMonthWexpec += hlpOppSum.ExpectedRevenue;
                        nextMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                }
                                    
                //two months from now
                if (mapOwnerDateSummary.containsKey(startOfTwoMonthsFromNow)) {
                    mapOwnerDateStageSummary = mapOwnerDateSummary.get(startOfTwoMonthsFromNow);

                    if (mapOwnerDateStageSummary.containsKey('(A) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A) Power Promoter');
                        twoMonthAactual += hlpOppSum.Amount;
                        twoMonthTotalActual += hlpOppSum.Amount;
                        twoMonthAexpec += hlpOppSum.ExpectedRevenue;
                        twoMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(A+) Power Promoter')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(A+) Power Promoter');
                        twoMonthAplusActual += hlpOppSum.Amount;
                        twoMonthTotalActual += hlpOppSum.Amount;
                        twoMonthAplusexpec += hlpOppSum.ExpectedRevenue;
                        twoMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                    if (mapOwnerDateStageSummary.containsKey('(NW) Near Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(NW) Near Win');
                        twoMonthNWActual += hlpOppSum.Amount;
                        twoMonthTotalActual += hlpOppSum.Amount;
                        twoMonthNWexpec += hlpOppSum.ExpectedRevenue;
                        twoMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }
                    if (mapOwnerDateStageSummary.containsKey('(W) Win')) {
                        hlpOppSum = mapOwnerDateStageSummary.get('(W) Win');
                        twoMonthWActual += hlpOppSum.Amount;
                        twoMonthTotalActual += hlpOppSum.Amount;
                        twoMonthWexpec += hlpOppSum.ExpectedRevenue;
                        twoMonthTotalexpec  += hlpOppSum.ExpectedRevenue;
                    }                    
                }
            }

            Double stageAacualCurrency = 0;
            Integer stageAacualCount = 0;
            
            Double stageBacualCurrency = 0;
            Integer stageBacualCount = 0;
            
            Double stageCacualCurrency = 0;
            Integer stageCacualCount = 0;
            
            Double stageNLacualCurrency = 0;
            Integer stageNLacualCount = 0;
            
            Double stageNWacualCurrency = 0;
            Integer stageNWacualCount = 0;
            
            Integer NOCthisMonth = 0;            

            if (mapOwnerSummary_NocDate.containsKey(pm.User__c)) {
                //loop through all records for this month and sum the number of opportunities regardless of stage
                mapOwnerDateSummary = mapOwnerSummary_NocDate.get(pm.User__c);
                if (mapOwnerDateSummary.containsKey(startOfThisMonth)) {
                    for (ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum summary : mapOwnerDateSummary.get(startOfThisMonth).values()) {
                        NOCthisMonth += summary.OpportunityCount;
                    }
                }

                for (Map<String, ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum> mStageSummary : mapOwnerSummary_NocDate.get(pm.User__c).values()) {
                    ADVSMS.SMS2_rollUpUserOpportunities.hclsOppSum summary;
                    if (mStageSummary.containsKey('(A+) Power Promoter')) {
                        summary = mStageSummary.get('(A+) Power Promoter');
                        stageAacualCurrency += summary.Amount;
                        stageAacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(A) Power Promoter')) {
                        summary = mStageSummary.get('(A) Power Promoter');
                        stageAacualCurrency += summary.Amount;
                        stageAacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(NW) Near Win')) {
                        summary = mStageSummary.get('(NW) Near Win');
                        stageNWacualCurrency += summary.Amount;
                        stageNWacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(W) Win')) {
                        summary = mStageSummary.get('(W) Win');
                        stageNWacualCurrency += summary.Amount;
                        stageNWacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(B) Promoter')) {
                        summary = mStageSummary.get('(B) Promoter');
                        stageBacualCurrency += summary.Amount;
                        stageBacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(C) Candidate')) {
                        summary = mStageSummary.get('(C) Candidate');
                        stageCacualCurrency += summary.Amount;
                        stageCacualCount += summary.OpportunityCount;
                    }
                    if (mStageSummary.containsKey('(NL) Near Loss')) {
                        summary = mStageSummary.get('(NL) Near Loss');
                        stageNLacualCurrency += summary.Amount;
                        stageNLacualCount += summary.OpportunityCount;
                    }
                }
            }

            //// UPDATE THEIR PERFORMANCE METRICS
            pm.Stage_A_Actual__c = stageAacualCurrency; 
            pm.Stage_A_Actual_Count__c =stageAacualCount;
            pm.Stage_B_Actual__c = stageBacualCount;
            pm.Stage_B_Currency__c = stageBacualCurrency;
            pm.Stage_C_Actual__c = stageCacualCount;
            pm.Stage_C_Currency__c = stageCacualCurrency;
            pm.NW_and_W_Actual__c = stageNWacualCurrency;
            pm.Stage_NW_Actual_Count__c = stageNWacualCount;
            pm.Stage_NL_Currency__c = stageNLacualCurrency;
            pm.NL_Actual__c = stageNLacualCount;

            pm.NOC_this_month__c = NOCthisMonth;
            pm.Current_Month_W_Amount__c = thisMonthWActual;
            pm.Current_Month_Total_Amount__c = thisMonthTotalActual;
            pm.Current_Month_NW_Amount__c = thisMonthNWActual;
            pm.Current_Month_A_Plus_Amount__c = thisMonthAplusActual;
            pm.Current_Month_A_Amount__c =thisMonthAactual;
            
            pm.Two_Months_Out_W_Amount__c = twoMonthWActual;
            pm.Two_Months_Out_Total_Amount__c = twoMonthTotalActual;
            pm.Two_Months_Out_NW_Amount__c = twoMonthNWActual;
            pm.Two_Months_Out_A_Plus_Amount__c = twoMonthAplusActual;
            pm.Two_Months_Out_A_Amount__c = twoMonthAactual;
            
            pm.Next_Month_W_Amount__c = nextMonthWActual;
            pm.Next_Month_Total_Amount__c = nextMonthTotalActual;
            pm.Next_Month_NW_Amount__c = nextMonthNWActual;
            pm.Next_Month_A_Plus_Amount__c = nextMonthAplusActual;
            pm.Next_Month_A_Amount__c = nextMonthAactual;

            pm.Current_Month_W_Expected__c = thisMonthWexpec;
            pm.Current_Month_Total_Expected__c = thisMonthTotalexpec;
            pm.Current_Month_NW_Expected__c = thisMonthNWexpec;
            pm.Current_Month_A_Plus_Expected__c = thisMonthAplusexpec;
            pm.Current_Month_A_Expected__c = thisMonthAexpec;
            
            pm.Two_Months_Out_W_Expected__c = twoMonthWexpec;
            pm.Two_Months_Out_Total_Expected__c = twoMonthTotalexpec;
            pm.Two_Months_Out_NW_Expected__c =twoMonthNWexpec;
            pm.Two_Months_Out_A_Plus_Expected__c =twoMonthAplusexpec;
            pm.Two_Months_Out_A_Expected__c =twoMonthAexpec;
            
            pm.Next_Month_W_Expected__c = nextMonthWexpec;
            pm.Next_Month_Total_Expected__c = nextMonthTotalexpec;
            pm.Next_Month_NW_Expected__c = nextMonthNWexpec;
            pm.Next_Month_A_Plus_Expected__c = nextMonthAplusexpec;
            pm.Next_Month_A_Expected__c = nextMonthAexpec;

            system.debug('***Updating Pipeline:\n' + pm);       
        }

        if(performMetrics.size() > 0) {
            update performMetrics;
        }
    }
                        

}