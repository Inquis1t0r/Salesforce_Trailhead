@IsTest
private class PermissionsTests {
  @TestSetup
  static void testSetup() {
    // GIVEN
    Account acct = TestDataFactory.getAccount('No view For You!', true);
    Private_Object__c privateObj = new Private_Object__c(
      Account__c = acct.id, 
      Notes__c = 'foo'
    );
    insert privateObj;
  }

  @IsTest
  static void testNegativePermissionSet() {
    // GIVEN
    User userNew = TestDataFactory.generateUser('Standard User');
    System.runAs(userNew) {
      // WHEN
      Test.startTest();
      Private_Object__c[] privateObj = [
        SELECT Id, Account__c, Notes__c 
        FROM Private_Object__c
      ];
      Test.stopTest();
      // THEN
      Assert.areEqual(
        0,
        privateObj.size(),
        'A user without the permission set shouldn\'t see any records'
      );
    }
  }

  @IsTest
  static void testPositivePermissionSet() {
    // Create a test user and assign permission set (setup objects)
    User testUser = TestDataFactory.generateUser('Standard User');
    
    // Assign the Private_Object_Access permission set to the test user
    PermissionSet ps = [
      SELECT Id 
      FROM PermissionSet 
      WHERE Name = 'Private_Object_Access' 
      LIMIT 1
    ];
    
    insert new PermissionSetAssignment(
      AssigneeId = testUser.Id,
      PermissionSetId = ps.Id
    );
    
    // Now run as the test user and perform DML on non-setup objects
    System.runAs(testUser) {
      // Create a Private_Object__c record as the test user
      Private_Object__c privateRecord = new Private_Object__c(
        Name = 'Test Private Record'
      );
      insert privateRecord;
      
      Test.startTest();
      // Query for the private record
      List<Private_Object__c> records = [
        SELECT Id, Name 
        FROM Private_Object__c 
        WHERE Id = :privateRecord.Id
      ];
      Test.stopTest();
      
      // Assert that the user can access the record due to the permission set
      Assert.areEqual(
        1, 
        records.size(), 
        'User with Private_Object_Access permission set should be able to view the record'
      );
      Assert.areEqual(
        privateRecord.Id, 
        records[0].Id, 
        'The retrieved record should match the created record'
      );
    }
  }
}
