@isTest
public class TestRestrictContactByName {
    Contact ctt = new Contact(LastName='INVALIDNAME');
    insert cct;

    Test.startTest();
    Database.DeleteResult result = Database.delete(cct, false);
    Test.stopTest();
}
