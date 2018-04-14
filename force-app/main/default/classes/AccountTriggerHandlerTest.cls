@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void testAccountTriggerHandler() {
        List<Account> testAccounts = new List<Account>();

        for (Integer i = 0; i < 20; i++) {
            testAccounts.add(new Account(Name = 'Pretend Account ' + String.valueOf(i), OwnerId = UserInfo.getUserId()));
        }

        insert testAccounts;

        User u = [SELECT Name FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];

        testAccounts = [SELECT Name FROM Account ORDER BY Name];

        for (Account a : testAccounts) { 
            System.assert(a.Name.startsWith(u.Name + ': Pretend Account '));
        }
    }
}