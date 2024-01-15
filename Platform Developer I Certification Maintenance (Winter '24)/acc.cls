List<Account> acc = [SELECT Id FROM Account WITH USER_MODE];
Account acc = new Account(Name='test');insert as user acc;
