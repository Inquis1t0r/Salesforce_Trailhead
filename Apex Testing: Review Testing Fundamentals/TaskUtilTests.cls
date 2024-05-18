@IsTest
private class TaskUtilTests {
  
  @IsTest
  static void testTaskPriorityNormal() {
    //GIVEN
    String state = 'NY';
    //WHEN
    Test.startTest();
    String priority = TaskUtil.getTaskPriority(state);
    Test.stopTest();
    //THEN
    Assert.areEqual('Normal', priority);
  }
  
  @IsTest
  static void testTaskPriorityHigh() {
    //GIVEN
    String state = 'CA';
    //WHEN
    Test.startTest();
    String priority = TaskUtil.getTaskPriority(state);
    Test.stopTest();
    //THEN
    Assert.areEqual('High', priority);
  }
  
  @IsTest static void testTaskPriorityInvalid() {
    //GIVEN
    String state = 'Montana';
    //WHEN
    Test.startTest();
    String priority = TaskUtil.getTaskPriority(state);
    Test.stopTest();
    //THEN
    Assert.areEqual(null, priority);
  }
}
