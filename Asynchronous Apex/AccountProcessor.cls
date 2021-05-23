public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accIDs) {
        List<Account> accs = [SELECT Id, Name, Number_of_Contacts__c,(SELECT Contact.Id FROM Contacts) FROM Account WHERE Id in :accIDs];
                                         					   
        for (Account acc : accs) {
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }
		
        update accs;
    }
}
