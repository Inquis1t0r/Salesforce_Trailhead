@isTest
public class TestRestrictContactByName {
    
    @isTest
    public static void testRestrictContactByNameTrigger(){
        Contact ctt = new Contact(LastName='INVALIDNAME');
        insert ctt;
    
        Test.startTest();
        Database.SaveResult result = Database.insert(ctt, false);
        Test.stopTest();
    
        System.assertEquals(!result.isSuccess());
    }
}
