public without sharing class AccountTriggerHandler {
    public static void beforeInsert(List<Account> newList) {
        Set<Id> ownerIds = new Set<Id>();

        for (Account a : newList) {
            ownerIds.add(a.OwnerId);
        }

        Map<Id, User> owners = new Map<Id, User>([SELECT Name FROM User WHERE Id IN :ownerIds]);

        for (Account a : newList) {
            a.Name = owners.get(a.OwnerId).Name + ': ' + a.Name;
        }
    }
}