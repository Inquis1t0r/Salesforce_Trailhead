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
}
