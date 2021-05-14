public class RandomContactFactory {
    public static List<Contact>generateRandomContacts(Integer numCts, String newCtsLastName){
        List<Contact> newCts = new List<Contact>();
        
        for(Integer i=0;i<numCts;i++) {
            Contact a = new Contact(FirstName = 'Name' + i, LastName='newCtsLastName');
            newCts.add(a);
        }
        insert newCts;
        
        
        return newCts;
    }
}
