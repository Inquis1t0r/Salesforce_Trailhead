@isTest
public class OtherCSVTests {
    
  @TestSetup
  static void loadTestDataFromStaticResource() {
    List<sObject> accounts = Test.loadData(Account.SObjectType, 'otherAccountData');
  }
    
}
