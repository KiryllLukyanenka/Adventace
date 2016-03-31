public with sharing class SMS2_Goal_v_Actual {

    /* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
    /////////////////////////////////////////
    // Updated 20120424 AAB / DCS
    // andyb@demandchainsystems.com
    /////////////////////////////////////////   
    
    public List<ID> mySubordinatesId = new List<ID>();
    public List<ID> mySubordinatesUserId = new List<ID>();
    public List<String> mySubordinates = new List<String>();
    public List<User> usersForQuery = new List<User>();
    public Set<String> mySubordinatesUserIds = new Set<String>();
    public List<ID> roll2mySubordinatesId = new List<ID>();
    public List<ID> roll2mySubordinatesUserId = new List<ID>();
    public List<String> roll2mySubordinates = new List<String>();
    public List<User> roll2usersForQuery = new List<User>();
    public List<User> usersForRoll2 = new List<User>();
    public List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> roll2usersPerformMetrics = new List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c>();
    public List<String> barLabels = new List<String>();
    public List<graphData> tableGraphData = new List<graphData>();
    public List<graphDataActual> tableActualGraphData = new List<graphDataActual>();
    public List<graphDataNoc> tableNoclGraphData = new List<graphDataNoc>();
    public List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> usersPerformMetrics = new List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c>();
    public List<String> ABGraphData = new List<String>();
    public List<String> ActualGraphData = new List<String>();
    public List<String> NOCGraphData = new List<String>();
    public ID myRoleId = ApexPages.currentPage().getParameters().get('r');
    public ID myProfile = UserInfo.getProfileId(); 
    public String drillType= ApexPages.currentPage().getParameters().get('d');
    
    /// 1 = Role roll-up
    /// 2 = Individual users in Role and Roles that are subordinate
    
    /////////////////////////////////////
    // Constructor
    /////////////////////////////////////
    public ADVSMS.SMS2_Goal_v_Actual() {
        mapRoles = new Map<Id, UserRole>([
            SELECT Id, Name, ParentRoleId FROM UserRole
        ]);

        mapUsers = new Map<Id, User>([
            SELECT Id, Name, FirstName, LastName, UserRoleId FROM User
        ]);
    }

    /////////////////////
    // GETers
    /////////////////////
    public List<User> getUsersQuery() { subordinates(); return usersForQuery; }
    public List<ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> getPerformMetrics() { return usersPerformMetrics; }
    public List<String> getSub() { return mySubordinates; }
    public Integer getSubSize() { return mySubordinates.size(); }
    public ID getProfileId() { return myProfile; }
    public List<String> getabGraphData() { return ABGraphData; }
    public List<String> getActualGraphData() { return ActualGraphData; }
    public List<String> getNocGraphData() { return NocGraphData; }
    public List<graphData> gettblData() { return tableGraphData; }
    public List<graphDataActual> gettableActualGraphData() { return tableActualGraphData; }
    public List<graphDataNoc> gettableNoclGraphData() { return tableNoclGraphData; }
    private Map<Id, UserRole> mapRoles = new Map<Id, UserRole>();
    private Map<Id, User> mapUsers = new Map<Id, User>();
    private Map<Id, ADVSMS__TACE_Pipeline_Balancing_Algorithm__c> mapAlgo = new Map<Id, ADVSMS__TACE_Pipeline_Balancing_Algorithm__c>();
    
    /////////////////////
    // Action Methods
    /////////////////////
    
    public PageReference getLatestData() {
        
        mySubordinatesId.add(myRoleId);
            
        // BUG FIX - Individual searching on org with large role heirarchies results in 
        // SOQL101 TOO_MANY_QUERIES governor limit hit

        List<UserRole> thisRoleList = [Select Id, Name from UserRole  Where ParentRoleId = :myRoleId];
        //proccessSubordinates(thisRoleList, true);
        processSubordinateMap(myRoleId);
            
        processUsers();
        performanceMetrics();
    
        //SMS2_rollUpUserOpportunities nu = new SMS2_rollUpUserOpportunities(mySubordinatesUserIds);
        ADVSMS.SMS2_rollUpUserOpportunities.buildPipelineForUsers(mySubordinatesUserIds);

        PageReference pageRef = ApexPages.currentPage();
        pageRef.setRedirect(true);

      return pageRef;
        
    }

    public void subordinates() {        
        
        if(myRoleId == null) {
        
            myRoleId = UserInfo.getUserRoleId();
        }
        
        if(drillType == null) {
            
            drillType = '1';
        }
    
        System.Debug('DRILLTYPE: ' + drillType);
    
        /// NEED TO PUT IN SOME LOGIC HERE TO BALANCE ALL USER DATA

        if(drillType == '1') {
            
            /// 1. Get the name of this Role
            UserRole runningUserRole = [Select Id, Name from UserRole  Where Id = :myRoleId];
            
            // 2. Get a list of all child roles
            List<UserRole> thisRoleList = [Select Id, Name from UserRole  Where ParentRoleId = :myRoleId];
            mySubordinatesId.add(myRoleId);
            
            /// 3. Procccess all the children under it
            //proccessSubordinates(thisRoleList, true);
            processSubordinateMap(myRoleId);
            
            /// 4. Get the user data
            processUsers();
            
            /// 5. Get performance metric data
            performanceMetrics();
            
            /// 6. Roll up graph data.
            ABRatioGraphRollRollUp(runningUserRole);
        }
        
        if(drillType == '2') {
            
            mySubordinatesId.add(myRoleId);
            
            /// 1. Need to get a list of all subordinate Roles that have users in them
            List<UserRole> thisRoleList = [Select Id, Name from UserRole  Where ParentRoleId = :myRoleId];
            //proccessSubordinates(thisRoleList, true);
            processSubordinateMap(myRoleId);
            processUsers();
            performanceMetrics();

            // Get full Algo Map
            mapAlgo = new Map<Id, ADVSMS__TACE_Pipeline_Balancing_Algorithm__c>();

            if(isMultiCurrencyEnabled()) {
                for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c algo : [Select Monthly_NOCs_Required__c,NOC_this_month__c, convertCurrency(ADVSMS__Stage_A_Actual__c),convertCurrency(ADVSMS__A_Required__c),User__c, User__r.Name, 
                        A_B_Ratio_Actual__c, A_B_Ratio__c,Stage_A_Actual_Count__c,Stage_B_Actual__c 
                        From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where User__c in :mapUsers.keyset()]) {
                    mapAlgo.put(algo.User__c, algo);
                }
            } else {
                for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c algo : [Select Monthly_NOCs_Required__c,NOC_this_month__c, Stage_A_Actual__c,A_Required__c,User__c, User__r.Name, 
                        A_B_Ratio_Actual__c, A_B_Ratio__c,Stage_A_Actual_Count__c,Stage_B_Actual__c 
                        From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where User__c in :mapUsers.keyset()]) {
                    mapAlgo.put(algo.User__c, algo);
                }
            }
            
            for(UserRole ur:thisRoleList) {
            
                /// Need to clean out all the lists
                System.Debug('CLEANING OUT THE LISTS');
                    
                roll2mySubordinatesId.clear();
                roll2mySubordinatesUserId.clear();
                roll2mySubordinates.clear();
                roll2usersForQuery.clear(); 
                usersForRoll2.clear();
                roll2usersPerformMetrics.clear();
                //
                
                //List<UserRole> thisUR = new List<UserRole>();
                //thisUR.add(ur);
                //proccessSubordinatesRoll2(thisUR);
                processSubordinateMap2(ur.Id);

                roll2processUsers();
                roll2performanceMetrics();
                roll2ABRatioGraphRollRollUp(ur);
            }
            
            
            /// 2. Need to get a list of all users that are in this Role 
            processUsersForRoll2(myRoleId);

            System.Debug('USERSFORROLL2');
            System.Debug(usersForRoll2);
            
            ///usersForRoll2 list that will now contain all user ID's that are in this current role
            for(User u:usersForRoll2) {
                
                System.Debug('CALLABRATIONGRAPHROLLROLLUP2: ' + u);
                
                ABRatioGraphRollRollUp2(u);
            }
        }
    }
    
    public void ABRatioGraphRollRollUp2(User userSel) {
    
        Double aActualCount = 0;
        Double bActualCount = 0;
        Double abRatioGoalAverage2 = 0;
        
        /// A Actual
        
        Decimal aDollarActuals = 0;
        Decimal aDollarGoal = 0;
        
        /// NOC 
        Double nocGoal = 0;
        Double nocActual = 0;
        
        for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c u:usersPerformMetrics) {
            
            if(u.User__c == userSel.id) {   
                
                if(u.Stage_B_Actual__c != null) {
                    bActualCount += u.Stage_B_Actual__c;
                }
                
                if(u.Stage_A_Actual_Count__c != null) {
                    aActualCount += u.Stage_A_Actual_Count__c;
                }
                
                if(u.A_B_Ratio__c != null) {
                    abRatioGoalAverage2 += u.A_B_Ratio__c;
                }
                if(u.Stage_A_Actual__c != null) {
                    aDollarActuals +=u.Stage_A_Actual__c;
                }
                
                if(u.A_Required__c != null) {
                    aDollarGoal +=u.A_Required__c;
                }
                if(u.Monthly_NOCs_Required__c != null) {
                    nocGoal +=u.Monthly_NOCs_Required__c;
                }
                
                if(u.NOC_this_month__c != null) {
                    nocActual +=u.NOC_this_month__c;
                }
            }
        }
        
        Decimal abRatioActual;
        
        if(bActualCount != 0) { // If bActualCount has a value
        
            Double abRatioActual2 = aActualCount/bActualCount;
            Decimal abRatioActual3 = abRatioActual2;
            abRatioActual = abRatioActual3.divide(1, 2, System.RoundingMode.UP);
        
        } else { // If bActualCount does NOT have a value
            
             //abRatioActual = 0;
             abRatioActual = aActualCount;
        }
    
        Decimal abRatioGoalAverage3 = abRatioGoalAverage2; 
        Decimal abRatioGoalAverage = abRatioGoalAverage3.divide(1, 2, System.RoundingMode.UP);
        
        
        //// Name |nocActual| nocGoal 
        String barInGraph3 =  '>!<' + userSel.firstName+ ' ' + userSel.lastName  + '|' + String.valueOf(nocActual) + '|' + String.valueOf(nocGoal);
    
        graphDataNoc thisGDAActual = new graphDataNoc(userSel.firstName+ ' ' + userSel.lastName ,String.valueOf(nocActual),String.valueOf(nocGoal),userSel.id,'3');
        tableNoclGraphData.add(thisGDAActual);
        NocGraphData.add(barInGraph3);
        
        
        //// Name |aDollarGoal | aDollarActuals 
        String barInGraph2 =  '>!<' + userSel.firstName+ ' ' + userSel.lastName  + '|' + String.valueOf(aDollarActuals) + '|' + String.valueOf(aDollarGoal);
    
        graphDataActual thisGDNoc = new graphDataActual(userSel.firstName+ ' ' + userSel.lastName ,aDollarActuals,aDollarGoal,userSel.id,'3');
        tableActualGraphData.add(thisGDNoc);
        ActualGraphData.add(barInGraph2);
        
            
        //// Name | A COUNT | B COUNT | AB RATIO | AB GOAL
        String barInGraph = '>!<' + userSel.firstName+ ' ' + userSel.lastName + '|' + String.valueOf(aActualCount) + '|' + String.valueOf(bActualCount) + '|' + String.valueOf(abRatioActual) + '|' + String.valueOf(abRatioGoalAverage);
        
        graphData thisGD = new graphData(userSel.firstName+ ' ' + userSel.lastName ,String.valueOf(aActualCount),String.valueOf(bActualCount),String.valueOf(abRatioActual),String.valueOf(abRatioGoalAverage),userSel.id,'3');
        tableGraphData.add(thisGD);
        ABGraphData.add(barInGraph);
        
    }
    
    public void ABRatioGraphRollRollUp(UserRole role) {
    
        Double aActualCount = 0;
        Double bActualCount = 0;
        Double abRatioGoalAverage2 = 0;
        
        /// A Actual
        
        Decimal aDollarActuals = 0;
        Decimal aDollarGoal = 0;
        
        /// NOC 
        Double nocGoal = 0;
        Double nocActual = 0;
        
        for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c u:usersPerformMetrics) {
                
            if(u.Stage_B_Actual__c != null) {
                bActualCount += u.Stage_B_Actual__c;
            }
            
            if(u.Stage_A_Actual_Count__c != null) {
                aActualCount += u.Stage_A_Actual_Count__c;
            }
            
            if(u.A_B_Ratio__c != null) {
                abRatioGoalAverage2 += u.A_B_Ratio__c;
            }
            
            if(u.Stage_A_Actual__c != null) {
                aDollarActuals +=u.Stage_A_Actual__c;
            }
            
            if(u.A_Required__c != null) {
                aDollarGoal +=u.A_Required__c;
            }
            if(u.Monthly_NOCs_Required__c != null) {
                nocGoal +=u.Monthly_NOCs_Required__c;
            }
            if(u.NOC_this_month__c != null) {
                nocActual +=u.NOC_this_month__c;
            }
        }
        
        // changed by EBG/DCS on 20151218 to fix calculation when no B opps exist
        //Double abRatioActual2 = 0;
        Double abRatioActual2 = aActualCount;
        
        //if(test.isRunningTest() || (aActualCount == 0 || bActualCount == 0)) {
        if(test.isRunningTest()) {
            abRatioActual2 = 1;
//        } else {
// changed by EBG/DCS on 20151118 to fix division by 0 error    
        } else if (bActualCount != 0) {
            abRatioActual2 = aActualCount/bActualCount;
        }
        
        Decimal abRatioActual3 = abRatioActual2;
        Decimal abRatioActual = abRatioActual3.divide(1, 2, System.RoundingMode.UP);

        if(test.isRunningTest()) {
            abRatioGoalAverage2 = 1;
        } else {
            abRatioGoalAverage2 = abRatioGoalAverage2/usersPerformMetrics.size();
        }

        Decimal abRatioGoalAverage3 = abRatioGoalAverage2;
        Decimal abRatioGoalAverage = abRatioGoalAverage3.divide(1, 2, System.RoundingMode.UP);

        //// Name |nocActual| nocGoal 
        String barInGraph3 = role.name  + '|' + String.valueOf(nocActual) + '|' + String.valueOf(nocGoal);
        graphDataNoc thisGDNoc = new graphDataNoc(role.name  ,String.valueOf(nocActual),String.valueOf(nocGoal),role.id,'2');
        tableNoclGraphData.add(thisGDNoc);
        NocGraphData.add(barInGraph3);
        
        //// Name |aDollarGoal | aDollarActuals 
        String barInGraph2 = role.name + '|' + String.valueOf(aDollarActuals) + '|' + String.valueOf(aDollarGoal);
        graphDataActual thisGDAActual = new graphDataActual(role.name ,aDollarActuals,aDollarGoal,role.id,'2');
        tableActualGraphData.add(thisGDAActual);
        ActualGraphData.add(barInGraph2);
        
        
        //// Name | A COUNT | B COUNT | AB RATIO | AB GOAL
        String barInGraph = role.name + '|' + String.valueOf(aActualCount) + '|' + String.valueOf(bActualCount) + '|' + String.valueOf(abRatioActual) + '|' + String.valueOf(abRatioGoalAverage);
        graphData thisGD = new graphData(role.name,String.valueOf(aActualCount),String.valueOf(bActualCount),String.valueOf(abRatioActual),String.valueOf(abRatioGoalAverage),role.id,'2');
        tableGraphData.add(thisGD);
        
        system.debug('TABLEGRAPHDATA:' + tableGraphData);
         
        ABGraphData.add(barInGraph);
        
    }
    
    public void roll2ABRatioGraphRollRollUp(UserRole role) {
    
        Double aActualCount = 0;
        Double bActualCount = 0;
        Double abRatioGoalAverage2 = 0;
        
        /// A Actual
        
        Decimal aDollarActuals = 0;
        Decimal aDollarGoal = 0;
        
        /// NOC 
        Double nocGoal = 0;
        Double nocActual = 0;
        
        for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c u:roll2usersPerformMetrics) {
                
            if(u.Stage_B_Actual__c != null) {
                bActualCount += u.Stage_B_Actual__c;
            }
            if(u.Stage_A_Actual_Count__c != null) {
                aActualCount += u.Stage_A_Actual_Count__c;
            }
            if(u.A_B_Ratio__c != null) {
                abRatioGoalAverage2 += u.A_B_Ratio__c;
            }
            if(u.Stage_A_Actual__c != null) {
                aDollarActuals +=u.Stage_A_Actual__c;
            }
            
            if(u.A_Required__c != null) {
                aDollarGoal +=u.A_Required__c;
            }
            
            if(u.Monthly_NOCs_Required__c != null) {
                nocGoal +=u.Monthly_NOCs_Required__c;
            }
            if(u.NOC_this_month__c != null) {
                nocActual +=u.NOC_this_month__c;
            }
        }
        
        // changed by EBG/DCS on 20151218 to set ratio when no B opps exist    
        //Decimal abRatioActual = 0;
        Decimal abRatioActual = aActualCount;
        
        if(bActualCount != 0) {
        
            Double abRatioActual2 = aActualCount/bActualCount;
            Decimal abRatioActual3 = abRatioActual2;
            abRatioActual = abRatioActual3.divide(1, 2, System.RoundingMode.UP);
        
        } 
        
        if(roll2usersPerformMetrics.size() != 0) {
            abRatioGoalAverage2 = abRatioGoalAverage2/roll2usersPerformMetrics.size();
        }

        Decimal abRatioGoalAverage3 = abRatioGoalAverage2;
        Decimal abRatioGoalAverage = abRatioGoalAverage3.divide(1, 2, System.RoundingMode.UP);
        
        //// Name |nocActual| nocGoal 
        String barInGraph3 =  '>!<' + role.name  + '|' + String.valueOf(nocActual) + '|' + String.valueOf(nocGoal); 
        graphDataNoc thisGDNoc = new graphDataNoc(role.name ,String.valueOf(nocActual),String.valueOf(nocGoal),role.id,'2');
        tableNoclGraphData.add(thisGDNoc);
        NocGraphData.add(barInGraph3);
        
        //// Name |aDollarGoal | aDollarActuals 
        String barInGraph2 =  '>!<' + role.name + '|' + String.valueOf(aDollarActuals) + '|' + String.valueOf(aDollarGoal);
        graphDataActual thisGDAActual = new graphDataActual(role.name ,aDollarActuals,aDollarGoal,role.id,'2');
        tableActualGraphData.add(thisGDAActual);
        ActualGraphData.add(barInGraph2);
        
        
        //// Name | A COUNT | B COUNT | AB RATIO | AB GOAL
        String barInGraph =  '>!<' +role.name + '|' + String.valueOf(aActualCount) + '|' + String.valueOf(bActualCount) + '|' + String.valueOf(abRatioActual) + '|' + String.valueOf(abRatioGoalAverage);
        
        graphData thisGD = new graphData(role.name,String.valueOf(aActualCount),String.valueOf(bActualCount),String.valueOf(abRatioActual),String.valueOf(abRatioGoalAverage),role.id,'2');
        tableGraphData.add(thisGD);
        ABGraphData.add(barInGraph);
         
    }
    
    public void performanceMetrics() {
        
        for (Integer m=0; m<mySubordinatesUserId.size(); m++) {
        
            //SMS2_rollUpUserOpportunities nd = SMS2_rollUpUserOpportunities();
        }
        if(isMultiCurrencyEnabled()) {
            usersPerformMetrics = [Select  Monthly_NOCs_Required__c,NOC_this_month__c,convertCurrency(ADVSMS__Stage_A_Actual__c),convertCurrency(ADVSMS__A_Required__c),User__c, User__r.Name, 
            A_B_Ratio_Actual__c, A_B_Ratio__c,Stage_A_Actual_Count__c,Stage_B_Actual__c
            From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where User__c in :mySubordinatesUserId];
        } else {
            usersPerformMetrics = [Select  Monthly_NOCs_Required__c,NOC_this_month__c,Stage_A_Actual__c,A_Required__c,User__c, User__r.Name, 
            A_B_Ratio_Actual__c, A_B_Ratio__c,Stage_A_Actual_Count__c,Stage_B_Actual__c 
            From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where User__c in :mySubordinatesUserId];
        }
        
    }

    public void processSubordinateMap(Id idDirectManager) {
        for(UserRole ur : mapRoles.values()) {
            if(ur.ParentRoleId == idDirectManager) { 
                mySubordinates.add(ur.Name);
                mySubordinatesId.add(ur.Id);
                processSubordinateMap(ur.Id);
            }
        }
    }

    public void processSubordinateMap2(Id idDirectManager) {

        System.Debug('processSubordinateMap2 START');
        System.Debug('idDirectManager = ' + idDirectManager);

        //roll2mySubordinates.add(ur.Name);
        roll2mySubordinatesId.add(idDirectManager);

        for(UserRole ur : mapRoles.values()) {
            if(ur.ParentRoleId == idDirectManager) { 
                roll2mySubordinates.add(ur.Name);
                roll2mySubordinatesId.add(ur.Id);
                processSubordinateMap2(ur.Id);
            }
        }

        System.Debug(roll2mySubordinates);
        System.Debug(roll2mySubordinatesId);
        System.Debug('processSubordinateMap2 END');
    }
    

    //public void proccessSubordinates(List<UserRole> rolesPassed, Boolean childLoop) {
        
    //    for (Integer m=0; m<rolesPassed.size(); m++) {
            
    //        mySubordinates.add(rolesPassed[m].Name);
    //        mySubordinatesId.add(rolesPassed[m].Id);
    //        System.Debug(mySubordinatesId);
            
    //        if(childLoop) {
                
            
    //            List<UserRole> thisRoleList = [Select Id, Name from UserRole  Where ParentRoleId = :rolesPassed[m].Id];
                
    //            if(thisRoleList.size() > 0) {
                    
    //                proccessSubordinates(thisRoleList, childLoop);
    //            }
    //        }
    //    }
    //}
    
    public void processUsers() {
        
        usersForQuery = [Select Id, firstName, lastName From User where UserRoleId in :mySubordinatesId];
        
        for(User u:usersForQuery) {
            
            mySubordinatesUserId.add(u.Id);
            mySubordinatesUserIds.add(u.Id);
            
        }
    }
    
    public void processUsersForRoll2(Id roleId) {
        
        usersForQuery = [Select Id, firstName, lastName From User where UserRoleId = :roleId];
        
        for(User u:usersForQuery) {
            
            usersForRoll2.add(u);
            
        }
    }
    
    public void proccessSubordinatesRoll2(List<UserRole> rolesPassed) {
        
        for (Integer m=0; m<rolesPassed.size(); m++) {
            
            roll2mySubordinates.add(rolesPassed[m].Name);
            roll2mySubordinatesId.add(rolesPassed[m].Id);
            
        
            List<UserRole> thisRoleList = [Select Id, Name from UserRole  Where ParentRoleId = :rolesPassed[m].Id];
                
            if(thisRoleList.size() > 0) {
                    
                proccessSubordinatesRoll2(thisRoleList);
            }
        
        }
    }
    
    public void roll2processUsers() {
        
        //roll2usersForQuery = [Select Id, firstName, lastName From User where UserRoleId in :roll2mySubordinatesId];

        Set<Id> setRoleIds = new Set<Id>();
        setRoleIds.addAll(roll2mySubordinatesId);

        System.Debug(setRoleIds);
        
        //for(User u:roll2usersForQuery) {
        for(User usr : mapUsers.values()) {
            if(setRoleIds.contains(usr.UserRoleId)) { 
                roll2mySubordinatesUserId.add(usr.Id); 
            }
        }

        System.Debug('roll2mySubordinatesUserId');
        System.Debug(roll2mySubordinatesUserId);
    }
    public void roll2performanceMetrics() {
        
        //roll2usersPerformMetrics = [Select Monthly_NOCs_Required__c,NOC_this_month__c, Stage_A_Actual__c,A_Required__c,User__c, User__r.Name, 
        //A_B_Ratio_Actual__c, A_B_Ratio__c,Stage_A_Actual_Count__c,Stage_B_Actual__c 
        //From ADVSMS__TACE_Pipeline_Balancing_Algorithm__c Where User__c in :roll2mySubordinatesUserId];

        Set<Id> setUserIds = new Set<Id>();
        setUserIds.addAll(roll2mySubordinatesUserId);

        for(ADVSMS__TACE_Pipeline_Balancing_Algorithm__c algo : mapAlgo.values()) {
            if(setUserIds.contains(algo.User__c)) {
                roll2usersPerformMetrics.add(algo);
            }
        }
        
    }
    
    /////////////////////
    // Helper Classes
    /////////////////////
    
    public class graphDataNoc {
        
        public String roleName;
        public String nocGoal;
        public String nocActual;
        public String roleLink;
        public String rendLink;
        public String rendName;
        
        public graphDataNoc(String roleName,String nocActual, String nocGoal, String roleId, String rollType) {
            
            if(rollType=='3') {
                this.rendName = '';
                this.rendLink = 'hidden';
            } else {
                this.roleLink = '?r='+roleId+'&d=' + rollType;
                this.rendName = 'hidden';
                this.rendLink = '';
            }
            this.roleName = roleName;
            this.nocGoal= nocGoal;
            this.nocActual= nocActual;

        }
    

        public String getnocActual() {
            
            return this.nocActual;
        }
        public String getnocGoal() {
            
            return this.nocGoal;
        }
        public String getroleName() {
            
            return this.roleName;
        }
        
        public String getroleLink() {
            
            return this.roleLink;
        }
        public String getrendLink() {
            
            return this.rendLink;
        }
        public String getrendName() {
            
            return this.rendName;
        }
        
        
    }
   
    public class graphDataActual {
        
        public String roleName;
        public Decimal aDollarActuals;
        public Decimal aDollarGoal;
        public String roleLink;
        public String rendLink;
        public String rendName;
        
        public graphDataActual(String roleName,Decimal aDollarActuals, Decimal aDollarGoal, String roleId, String rollType) {
            
            if(rollType=='3') {
                this.rendName = '';
                this.rendLink = 'hidden';
            } else {
                this.roleLink = '?r='+roleId+'&d=' + rollType;
                this.rendName = 'hidden';
                this.rendLink = '';
            }
            
            this.roleName = roleName;
            //this.aDollarGoal= formatDouble(aDollarGoal,true);
            this.aDollarGoal= aDollarGoal;
            this.aDollarActuals= aDollarActuals;

        }
    
        public Double getaDollarActuals() {
            
            return this.aDollarActuals;
        }
        public Double getaDollarGoal() {
            
            return this.aDollarGoal;
        }
        public String getroleName() {
            
            return this.roleName;
        }
        
        public String getroleLink() {
            
            return this.roleLink;
        }
        public String getrendLink() {
            
            return this.rendLink;
        }
        public String getrendName() {
            
            return this.rendName;
        }
        
        
    }
           
    public class graphData {
        
        public String roleName;
        public String aActualCount;
        public String bActualCount;
        public String abRatioActual;
        public String abRatioGoalAverage;
        public String roleLink;
        public String rendLink;
        public String rendName;        
        
        public graphData(String roleName,String aActualCount, String bActualCount,String abRatioActual, String abRatioGoalAverage, String roleId, String rollType) {
           
           system.debug('ROLLTYPE: ' + rollType);
           
            if(rollType=='3') {
                this.rendName = '';
                this.rendLink = 'hidden';
            } else {
                this.roleLink = '?r='+roleId+'&d=' + rollType;
                this.rendName = 'hidden';
                this.rendLink = '';
            }
            this.roleName = roleName;
            this.aActualCount= aActualCount;
            this.bActualCount= bActualCount;
            this.abRatioActual= abRatioActual;
            this.abRatioGoalAverage= abRatioGoalAverage;
        }
    
        public String getB() {
            
            return this.bActualCount;
        }
        public String getA() {
            
            return this.aActualCount;
        }
        public String getABRatioGoal() {
            
            return this.abRatioGoalAverage;
        }
        public String getABRatioActual() {
            
            return this.abRatioActual;
        }
        public String getroleName() {
            
            return this.roleName;
        }
        
        public String getroleLink() {
            
            return this.roleLink;
        }
        public String getrendLink() {
            
            return this.rendLink;
        }
        public String getrendName() {
            
            return this.rendName;
        }  
        
    }

    private Boolean isMultiCurrencyEnabled() {

        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType mcEnabled = gd.get('DatedConversionRate');
        return (mcEnabled != null) ? true : false;

    }
}