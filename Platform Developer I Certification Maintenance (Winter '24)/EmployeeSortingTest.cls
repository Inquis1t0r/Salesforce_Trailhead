@isTest
private class EmployeeSortingTest {
    @isTest
    static void sortWithComparators() {        
        List<Employee> empList = new List<Employee>();
        empList.add(new Employee(101,'Joe Smith', 2020));
        empList.add(new Employee(102,'J. Smith', 2020));
        empList.add(new Employee(25,'Caragh Smith', 2021));
        empList.add(new Employee(105,'Mario Ruiz', 2019));
        // Sort by name
        NameCompare nameCompare = new NameCompare();
        empList.sort(nameCompare);
        // Expected order: Caragh Smith, J. Smith, Joe Smith, Mario Ruiz
        Assert.areEqual('Caragh Smith', empList.get(0).getName());
        // Sort by year joined
        YearCompare yearCompare = new YearCompare();
        empList.sort(yearCompare);
        // Expected order: Mario Ruiz, J. Smith, Joe Smith, Caragh Smith
        Assert.areEqual('Mario Ruiz', empList.get(0).getName());
    }

@IsTest
    static void userLocaleSort() {
        string userLocale = 'fr_FR';
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
        EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
        LocaleSidKey=userLocale, TimeZoneSidKey='America/Los_Angeles',
        ProfileId = [SELECT Id FROM Profile WHERE Name='Standard User'].Id,
        UserName='standarduser' + DateTime.now().getTime() + '@testorg.com');
        System.runAs(u) {
            List<String> shoppingList = new List<String> {
                'épaule désosé Agneau',
                'Juice',
                'à la mélasse Galette 5 kg',
                'Bread',
                'Grocery'
            };
            // Default sort
            shoppingList.sort();
            Assert.areEqual('Bread', shoppingList[0]);
            // Sort based on user Locale
            Collator myCollator = Collator.getInstance();
            shoppingList.sort(myCollator);
            Assert.areEqual('à la mélasse Galette 5 kg', shoppingList[0]);
            Assert.areEqual('Bread', shoppingList[1]);
            Assert.areEqual('épaule désosé Agneau', shoppingList[2]);
            Assert.areEqual('Grocery', shoppingList[3]);
            Assert.areEqual('Juice', shoppingList[4]);
        }
    }
}
