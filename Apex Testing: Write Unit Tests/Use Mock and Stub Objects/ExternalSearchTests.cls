@IsTest
private class ExternalSearchTests {
  
  @IsTest
  static void testPositiveMocking() {
    // GIVEN
    Map<String, String> responseHeaders = new Map<String, String>();
    HTTPMockFactory mock = new HTTPMockFactory(
      200,
      'OK',
      '<html>Google Search Results</html>',
      responseHeaders
    );
    Test.setMock(HttpCalloutMock.class, mock);
    
    // WHEN
    Test.startTest();
      String result = ExternalSearch.googleIt('test query');
    Test.stopTest();
    
    // THEN
    Assert.areEqual(
      '<html>Google Search Results</html>',
      result,
      'Expected to receive the mock response body'
    );
  }
  
  @IsTest
  static void testNegativeMocking() {
    // GIVEN
    Map<String, String> responseHeaders = new Map<String, String>();
    HTTPMockFactory mock = new HTTPMockFactory(
      500,
      'Internal Server Error',
      'Server Error',
      responseHeaders
    );
    Test.setMock(HttpCalloutMock.class, mock);
    
    // WHEN
    Test.startTest();
      Boolean exceptionThrown = false;
      try {
        ExternalSearch.googleIt('test query');
      } catch (ExternalSearch.ExternalSearchException e) {
        exceptionThrown = true;
        Assert.isTrue(
          e.getMessage().contains('500'),
          'Exception message should contain status code 500'
        );
      }
    Test.stopTest();
    
    // THEN
    Assert.isTrue(
      exceptionThrown,
      'Expected ExternalSearchException to be thrown for 500 status code'
    );
  }
}
