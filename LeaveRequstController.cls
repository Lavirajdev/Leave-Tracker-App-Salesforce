public without sharing class LeaveRequstController {

    @AuraEnabled(cacheable=true)
    public static List<LeaveRequest__c> getMyLeaves() {
        try {
            return [
                SELECT Id, Name, From_Date__c, To_Date__c,
                       Reason__c, Status__c, Manager_Comment__c
                FROM LeaveRequest__c
                WHERE User__c = :UserInfo.getUserId()
                ORDER BY CreatedDate DESC
            ];
        } catch (Exception e) {
            throw new AuraHandledException(
                'Error fetching your leave records: ' + e.getMessage()
            );
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<LeaveRequest__c> getAllLeaves() {
        try {
            return [
                SELECT Id, Name, User__c, From_Date__c, To_Date__c,
                       Reason__c, Status__c, Manager_Comment__c
                FROM LeaveRequest__c
                ORDER BY CreatedDate DESC
            ];
        } catch (Exception e) {
            throw new AuraHandledException(
                'Error fetching all leave records: ' + e.getMessage()
            );
        }
    }
}