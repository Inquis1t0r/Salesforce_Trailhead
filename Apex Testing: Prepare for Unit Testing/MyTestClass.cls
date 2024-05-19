@IsTest
private class MyTestClass {
  
  @IsTest
  static void testMyTestMethod() {
    // code_block
    // GIVEN
    // Part where you create the test data needed for testing your method
    // WHEN
    Test.startTest();
      // Where you call the method being tested
    Test.stopTest();

    // THEN
    // Where you place your assertions - so you can trust the results
  }
}
