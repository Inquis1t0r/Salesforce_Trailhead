public class AccountUtils {
    public static List<Account> accountsByState(string state) {
        List<Account> accountsWithBillingState = new List<Account>();
        accountsWithBillingState = [SELECT Id, Name FROM Account
                       WHERE BillingState = :state];
        return accountsWithBillingState;
    }
}
