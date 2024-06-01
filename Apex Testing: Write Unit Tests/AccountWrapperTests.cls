@IsTest
private class AccountWrapperTests {
  @TestSetup
  static void loadTestData() {
    // GIVEN
    Account acct = TestFactory.getAccount('ACME', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;
  }
  @IsTest
  static void testPositiveRoundedAveragePrice() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        acctWrapper.getRoundedAvgPriceOfOpps(),
        1000.00,
        'Expected to get 1000.00');
    Test.stopTest();
  }
}
