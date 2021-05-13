public class ContactSearch {
    public static Contact searchForContacts(String Name, String MailingPostalCode){
        Contact[] cts = [SELECT Account.Name, Account.MailingPostalCode FROM Contact];
		Contact searchedContact = cts[0];
        return searchedContact;
    }
}
