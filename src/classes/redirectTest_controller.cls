public class redirectTest_controller {

    public PageReference showPage() {
        PageReference pageRef = new PageReference('http://adventace.com/adventace-crm/opportunity-assessment-for-sales-managers');
        pageRef.setRedirect(true);
        return pageRef;
    }


        
}