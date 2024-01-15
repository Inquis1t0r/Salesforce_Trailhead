// Class to compare Employees by name
    public class NameCompare implements Comparator<Employee> {
        public Integer compare(Employee e1, Employee e2) {
            if(e1?.getName() == null && e2?.getName() == null) {
                return 0;
            } else if(e1?.getName() == null) { 
                return -1; 
            } else if(e2?.getName() == null) {
                return 1;
            }        
            return e1.getName().compareTo(e2.getName());
        }
    }
    // Class to compare Employees by year joined
    public class YearCompare implements Comparator<Employee> {
        public Integer compare(Employee e1, Employee e2) {
            // Guard against null operands for ‘<’ or ‘>’ operators because
            // they will always return false and produce inconsistent sorting
            Integer result;
            if(e1?.getYear() == null && e2?.getYear() == null) {
                result = 0;
            } else if(e1?.getYear() == null) { 
                  result = -1; 
            } else if(e2?.getYear() == null) {
                  result = 1;
            } else if (e1.getYear() < e2.getYear()) {
                  result = -1;
            } else if (e1.getYear() > e2.getYear()) {
                  result = 1;
            } else {
                  result = 0;  
            } 
            return result;
        }
    }
