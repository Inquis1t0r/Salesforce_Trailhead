@isTest
private class AccountProcessorTest {
	
    static TestMethod void contactTest() {
        List<Account> accounts = new List<Account>();
        for (Integer i=0; i<100; i++) {
            Account account = new Account();
            account.Name = 'Test Account ' + i;
            accounts.add(account);
        }
        insert accounts;

        List<Id> accIDs = new List<Id>();
        List<Contact> contacts = new List<Contact>();
        for (Account a : accounts) {
            accIDs.add(a.Id);
			
            for (Integer i=0; i<5; i++) {
                Contact contact = new Contact();
                contact.FirstName = 'Test Contact';
                contact.LastName = String.valueOf(i);
                contact.AccountId = a.Id;
                contacts.add(contact);
            }
        }
        insert contacts;

        Test.startTest();
        AccountProcessor.countContacts(accIDs);
        Test.stopTest();

        List<Account> results = [SELECT Id, Number_of_Contacts__c FROM Account WHERE Id in :accIDs];
								  
        for (Account a : results) {
            System.AssertEquals(5, a.Number_of_Contacts__c);
        }
    }
}
