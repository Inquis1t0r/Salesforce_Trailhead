@isTest
public class TaskUtilTests {
    private static final String NORMAL_PRIORITY = 'Normal';
    private static final String HIGH_PRIORITY = 'High';
    
    @isTest
    static void testGetTaskPriorityNormal(){ //shouldReturnTaskPriorityNormal
        
        //GIVEN
        String testLeadState = 'TX';
        
        //WHEN
        Test.startTest();
        String currentPriority = TaskUtil.getTaskPriority(testLeadState);
        Test.stopTest();
        
        //THEN
        Assert.areEqual(NORMAL_PRIORITY, currentPriority, 'Task priority is set to: ' + NORMAL_PRIORITY);
    }
    
    @isTest
    static void testGetTaskPriorityHigh(){ //shouldReturnTaskPriorityHigh
        //GIVEN
        String testLeadState = 'CA';
        
        //WHEN
        Test.startTest();
        String currentPriority = TaskUtil.getTaskPriority(testLeadState);
        Test.stopTest();
        
        //THEN
        Assert.areEqual(HIGH_PRIORITY, currentPriority, 'Task priority is set to: ' + HIGH_PRIORITY);
    }
    
    @isTest
    static void shouldReturnNullForEmptyLeadstate(){
        //GIVEN
        String testLeadState = '';
        
        //WHEN
        Test.startTest();
        String currentPriority = TaskUtil.getTaskPriority(testLeadState);
        Test.stopTest();
        
        //THEN
        Assert.areEqual(null, currentPriority, 'Null returned for empty Lead State');
    }

}
