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
}
