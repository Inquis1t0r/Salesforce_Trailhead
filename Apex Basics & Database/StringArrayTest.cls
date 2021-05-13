public class StringArrayTest {
    public static String[] generateStringArray(Integer numberOfStrings){
        List<String> myArray = new List<String>();
        for(Integer i = numberOfStrings; i > 0; i--)
            myArray.add('Test ' + i);
        return myArray;
    }
}
