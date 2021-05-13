public class StringArrayTest {
    public static String[] generateStringArray(Integer numberOfStrings){
        List<String> myArray = new String[numberOfStrings];
        for(Integer i = numberOfStrings; i > 0; i--)
            myArray[i] = 'Test ' + i;
        return myArray;
    }
}
