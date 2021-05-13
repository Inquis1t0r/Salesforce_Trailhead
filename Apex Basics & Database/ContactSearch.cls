public class ContactSearch {
    public static List<Contact> searchForContacts(String Name, String MailingPostalCode){
        Contact[] cts = [SELECT Account.Name, Account.MailingPostalCode FROM Contact
                        WHERE FirstName = Name AND MailingPostalCode= MailingPostalCode];
        return searchedContact;
    }
}
