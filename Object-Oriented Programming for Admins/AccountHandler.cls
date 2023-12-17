public class AccountHandler {
    private final string AccNumberPrefix = '';
    
    public static void insertAccount(Integer numOfAccs){
        List<Account> addAccounts = new List<Account>();
        
        for(Integer i = numOfAccs; i > 0; i--){
            Account acc = new Account();
            acc.Name = 'Acme Inc n ' + i;
            acc.AccountNumber = 'A000n' + i;
            addAccounts.add(acc);
        }
        
        if(addAccounts.size() > 0){
            insert addAccounts;
        }
        
    }
}
