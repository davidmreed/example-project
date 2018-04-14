@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void testAccountTriggerHandler() {
        List<Account> testAccounts = new List<Account>();

        for (Integer i = 0; i < 20; i++) {
            testAccounts.add(new Account(Name = 'Dummy Account ' + String.valueOf(i), OwnerId = UserInfo.getUserId()));
        }

        AccountTriggerHandler.beforeInsert(testAccounts);

        User u = [SELECT Name FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];

        for (Integer i = 0; i < 20; i++) { 
            System.assertEquals(u.Name + ': Dummy Account ' + String.valueOf(i), testAccounts[i].Name);
        }
    }
}