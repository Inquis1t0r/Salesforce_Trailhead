public class AddPrimaryContact implements Queueable {

    private Contact newContact;
    private String STATE_CODE;

    public AddPrimaryContact(Contact con, String state) {
        this.newContact = con;
        this.STATE_CODE = state;
    }

    public void execute(QueueableContext context) {
        List<Account> currAccounts = [SELECT Id FROM Account WHERE BillingState = :this.STATE_CODE LIMIT 200];

        List<Contact> newContacts = new List<Contact>();
        for (Account acc : currAccounts) {
            Contact con = this.newContact.clone(false, false, false, false);
            con.AccountId = acc.Id;
            newContacts.add(con);
        }

        if (newContacts.size() > 0) {
          insert newContacts;
        }
    }
}
