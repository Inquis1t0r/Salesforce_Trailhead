public class ContactSearch {
    public static List<Contact> searchForContacts(String Name, String MailingPostalCode){
        Contact[] cts = [SELECT Id, Name FROM Contact
                        WHERE LastName = :Name AND MailingPostalCode= :MailingPostalCode];
        return searchedContact;
    }
}
