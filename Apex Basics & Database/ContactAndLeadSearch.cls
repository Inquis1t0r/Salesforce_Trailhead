public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String firstOrLastName){
        List<List< SObject>> searchContactsAndLeadslist = [FIND :firstOrLastName IN ALL FIELDS
                                                          RETURNING 
                                                          Contact(),Lead()];
        
        return searchContactsAndLeadslist;
    }
}
