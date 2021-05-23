@isTest
private class LeadProcessorTest {

    @testSetup
    static void createLeads() {
		Integer numOfTestLeads = 200;
		
        List<Lead> testLeads = new List<Lead>();
        for (Integer i=0; i<numOfTestLeads; i++) {
            Lead l = new Lead();
            l.FirstName = 'Test';
            l.LastName = 'Lead';
            l.Company = 'asdf ' + i;
            testLeads.add(l);
        }
        insert testLeads;
    }

    static TestMethod void myTest() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(numOfTestLeads, [SELECT Count() FROM Lead WHERE Name = 'Test Lead' AND LeadSource = 'Dreamforce']);
    }
}
