public class AccountHandler {
    public static Account insertNewAccount(String newAccountName){
        Account acct = new Account(Name= newAccountName);
		insert acct;
        return acct;
    }
}
