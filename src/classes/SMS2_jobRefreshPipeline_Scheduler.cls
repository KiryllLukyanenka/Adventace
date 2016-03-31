global class SMS2_jobRefreshPipeline_Scheduler implements Schedulable{
	/* Create The High Performance Sales Environment® • ©2010 • Adventace® LLC • All rights reserved • Confidential */
	//////////////////////////////////
	// This class enables scheduling for the batch job SMS2_jobRefreshPipeline
	// Created 20151211 EBG / Demand Chain Systems
	// support@demandchainsystems.com
	//////////////////////////////////	
    global void execute(SchedulableContext ctx) {
       
		SMS2_jobRefreshPipeline job = new SMS2_jobRefreshPipeline();
		ID batchId = Database.executeBatch(job);

    }

}