public class StringArrayTest {
    public static String[] generateStringArray(Integer numberOfStrings){
        List<String> myArray = new String[numberOfStrings];
        for(Integer i = 0; i < numberOfStrings; ++i)
            myArray.add('Test ' + i);
        return myArray;
    }
}
