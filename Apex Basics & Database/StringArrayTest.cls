public class StringArrayTest {
    public static String[] generateStringArray(Integer numberOfStrings){
       // List<String> myArray = new String[numberOfStrings];
        String[] myArray = new List<String>(Integer numberOfStrings);
        for(Integer i = numberOfStrings; i > 0; i--){
            myArray[i] = 'Test ' + i;
            System.debug(myArray[i]);
        }
        return myArray;
    }
}
