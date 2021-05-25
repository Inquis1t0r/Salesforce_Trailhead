@Istest(SeeAllData=true)
public class AccountManagerTest {
    

    
    @IsTest
    public static void testaccountmanager() {
        RestRequest request = new RestRequest();
        request.requestUri = 'https://wise-badger-pkhpd9-dev-ed.lightning.force.com/services/apexrest/Accounts/0010900000MoIAwAAN/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
		system.debug('test account result = '+ AccountManager.getAccount());


        
    }
    

}
