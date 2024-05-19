@isTest
public class TaskUtilTests {
    private static final String NORMAL_PRIORITY = 'Normal';
    private static final String HIGH_PRIORITY = 'High';
    
    @isTest
    static void testGetTaskPriorityNormal(){ //shouldReturnTaskPriorityNormal
        
        //GIVEN
        String testLeadState = 'TX';
        
        //WHEN
        String currentPriority = TaskUtil.getTaskPriority(testLeadState);
        
        //THEN
        Assert.areEqual(NORMAL_PRIORITY, currentPriority, 'Task priority is set to: ' + NORMAL_PRIORITY);
    }
    
    @isTest
    static void testGetTaskPriorityHigh(){ //shouldReturnTaskPriorityHigh
        //GIVEN
        String testLeadState = 'CA';
        
        //WHEN
        String currentPriority = TaskUtil.getTaskPriority(testLeadState);
        
        //THEN
        Assert.areEqual(HIGH_PRIORITY, currentPriority, 'Task priority is set to: ' + HIGH_PRIORITY);
    }

}
