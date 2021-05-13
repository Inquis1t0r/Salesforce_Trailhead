public class AccountHandler {
    public static Account insertNewAccount(String newAccountName){
        try{
            Account acct = new Account(Name= newAccountName);
            insert acct;
            return acct;
        }catch(DmlException e){
            return null;
        }
    }
}
