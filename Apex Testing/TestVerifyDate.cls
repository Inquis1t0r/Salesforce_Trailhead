@isTest
public class TestVerifyDate {
    @isTest 
    public static void testCheckDates(){
        Date testDate1 = date.newInstance(2021, 04, 14);
        Date testDate2 = date.newInstance(2021, 05, 04);
        Date result = VerifyDate.CheckDates(testDate1, testDate2);
        
        System.assertEquals(testDate2, result);
    }
}
