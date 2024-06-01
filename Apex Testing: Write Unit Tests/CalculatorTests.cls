@isTest
public class CalculatorTests {
    
    @isTest
    static void testDivideByZero() {
        try {
            // Attempt to divide by zero, which should throw an exception
            Calculator.divide(10, 0);
            System.assert(false, 'Expected a CalculatorException to be thrown');
        } catch (Calculator.CalculatorException e) {
            // Check that the exception message is correct
            System.assert(e.getMessage().contains('You still can\'t divide by zero'), 'Unexpected exception message: ' + e.getMessage());
        }
    }

    @isTest
    static void testAdd() {
        Integer result = Calculator.add(2, 3);
        System.assertEquals(5, result, '2 + 3 should equal 5');
    }
    
    @isTest
    static void testSubtract() {
        Integer result = Calculator.subtract(5, 3);
        System.assertEquals(2, result, '5 - 3 should equal 2');
    }

    @isTest
    static void testMultiply() {
        Integer result = Calculator.multiply(2, 3);
        System.assertEquals(6, result, '2 * 3 should equal 6');
    }

    @isTest
    static void testMultiplyByZero() {
        try {
            Calculator.multiply(2, 0);
            System.assert(false, 'Expected a CalculatorException to be thrown');
        } catch (Calculator.CalculatorException e) {
            // Check that the exception message is correct
            System.assert(e.getMessage().contains('It doesn\'t make sense to multiply by zero'), 'Unexpected exception message: ' + e.getMessage());
        }
    }

    @isTest
    static void testDividePositive() {
        Decimal result = Calculator.divide(6, 2);
        System.assertEquals(3, result, '6 / 2 should equal 3');
    }
}
