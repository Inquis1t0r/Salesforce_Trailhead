@isTest
private class DailyLeadProcessorTest {

    @testSetup
    static void setup() {
        List<Lead> testLeads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            Lead l = new Lead();
            l.FirstName = 'Test';
            l.LastName = 'Lead ' + i;
            l.Company = 'Test Company ' + i;
            testLeads.add(l);
        }
        insert testLeads;
    }
	
	@isTest
    static TestMethod void leadsTest() {
        String jobName = 'Daily Lead Processor - Test';
        String CRON_EXP = '0 0 0 15 3 ? 2021'; 

        test.startTest();
        DailyLeadProcessor dp = new DailyLeadProcessor();
        String JobId = System.schedule(jobName, CRON_EXP, dp);
        test.stopTest();

        List<Lead> existingLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, existingLeads.size());
    }
}
