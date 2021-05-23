@isTest
private class AddPrimaryContactTest {
    @testSetup
    static void setup() {
		Integer numOfTestAccs = 50;
        List<Account> newAccounts = new List<Account>();
        for (Integer i=0; i<numOfTestAccs; i++) {
            Account ny = new Account();
            ny.Name = 'Test Account (NY)';
            ny.BillingState = 'NY';
            newAccounts.add(ny);
            Account ca = new Account();
            ca.Name = 'Test Account (CA)';
            ca.BillingState = 'CA';
            newAccounts.add(ca);
        }
        insert newAccounts;
    }

    @isTest
    static void accountTest() {
		Integer numOfTestAccs = 50;
        Contact contactObj = new Contact(
            FirstName = 'California',
            LastName = 'Moody'
        );
        String state = 'CA';

        Test.startTest();
        AddPrimaryContact apc = new AddPrimaryContact(contactObj, state);
        Id jobId = System.enqueueJob(apc);
        Test.stopTest();

        List<Account> accounts = [SELECT Id, (SELECT Contact.Name FROM Account.Contacts) FROM Account WHERE BillingState = 'CA'];
        System.assertEquals(numOfTestAccs, accounts.size());
        for (Account acc : accounts) {
            System.assertEquals(acc.Contacts.size(), 1);
        }
    }
}
