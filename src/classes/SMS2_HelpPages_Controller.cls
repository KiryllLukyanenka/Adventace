public class SMS2_HelpPages_Controller {
/**
*   {Purpose}   - Controller for any VF page showing help text from a different url
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
    public PageReference showHelp_OppAssessment() {
    	String strUrl = 'http://adventace.com/adventace-crm/opportunity-assessment-for-sales-managers';
        PageReference pageRef = new PageReference(strUrl);
        pageRef.setRedirect(true);
        return pageRef;
    }

}