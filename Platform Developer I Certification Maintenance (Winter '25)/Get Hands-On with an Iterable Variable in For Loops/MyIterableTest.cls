@IsTest
private class MyIterableTest {
    @IsTest
    static void testIterableForLoop() {
        // Create a list of strings
        List<String> strings = new List<String>{'Hello', 'World'};
        
        // Create an instance of MyIterable
        MyIterable myIterable = new MyIterable(strings);
        
        // Iterate over MyIterable instance using a for loop
        for (String str : myIterable) {
            System.debug(str);
        }
    }
}
