@isTest
public class TestRestrictContactByName {
    
    @isTest
    public static void testRestrictContactByNameTrigger(){
        Contact ctt = new Contact(LastName='INVALIDNAME');
        insert ctt;
    
        Test.startTest();
        Database.DeleteResult result = Database.delete(ctt, false);
        Test.stopTest();
    
        System.assertEquals(!result.isSuccess());
    }
}
