/**
*   {Purpose}   - Test class for controller SMS2_HelpPages_Controller
*
*   {Contact}   - support@demandchainsystems.com
*                 www.demandchainsystems.com
*                 612-424-0032                  
*/

/**
*   CHANGE  HISTORY
*   =============================================================================
*   Date    	Name             	Description
*   20151215  	EBG/DCS				Created
*   =============================================================================
*/
@isTest
private class SMS2_HelpPages_Controller_UT {
	
	@isTest static void testOppAssessment() {
		PageReference pgRef = Page.SMS2_OppAssesmentHelp;
		Test.setCurrentPage(pgRef);

		SMS2_HelpPages_Controller cntlr = new SMS2_HelpPages_Controller();
		pgRef = cntlr.showHelp_OppAssessment();
	}
	

}