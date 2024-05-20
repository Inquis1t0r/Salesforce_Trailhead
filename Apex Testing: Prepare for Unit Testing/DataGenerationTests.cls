@IsTest
private class DataGenerationTests {

  @TestSetup
  static void dataCreation() {
    // GIVEN
    Account acct = TestFactory.getAccount('Muddy Waters Inc.', true);
    Contact con = TestFactory.getContact(acct.id, 'Muddy', 'Waters', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1400.00, 1);
    insert opps;
  }

  @IsTest
  static void testBruteForceAccountCreation() {
    // GIVEN
    List<Account> accts;
    Account acct = new Account(name='McTesterson LLC');
    insert acct;
    // WHEN
    Test.startTest();
      accts = [SELECT Id FROM Account];
    Test.stopTest();
    // THEN
    Assert.isTrue(accts.size() > 0, 'Was expecting to find at least one account');
  }

  @IsTest
  static void testUseTestFactoryToCreateAccountsWithContacts() {
    // GIVEN
    List<Account> accts;
    List<Contact> contacts;
    TestFactory.generateAccountWithContacts(5);
    // WHEN
    Test.startTest();
      accts = [SELECT Id FROM Account];
      contacts = [SELECT Id FROM Contact];
    Test.stopTest();
    // THEN
    Assert.isTrue(accts.size() > 0, 'Was expecting to find at least one account');
    Assert.areEqual(5, contacts.size(), 'Was expecting to find 5 contacts');
  }

}
