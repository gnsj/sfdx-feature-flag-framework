@isTest
private class CaseTrigger_TEST {
    
    @isTest
    private static void sendEmailOnClose_TEST(){
        FeatureFlagManagerUtilities.toggleSendEmailOnCloseCase(true);
        Case c = new Case();
        c.Subject = 'Test';
        insert c;
        
        Test.startTest();
            c.Status = 'Closed';
            update c;
        Test.stopTest();
        
        system.assertEquals(1, [SELECT Id FROM Case WHERE Subject = 'Email Sent!'].size());
    }
    
    @isTest
    private static void non_sendEmailOnClose_TEST(){
        FeatureFlagManagerUtilities.toggleSendEmailOnCloseCase(false);
        Case c = new Case();
        c.Subject = 'Test';
        insert c;
        
        Test.startTest();
            c.Status = 'Closed';
            update c;
        Test.stopTest();
        
        system.assertEquals(0, [SELECT Id FROM Case WHERE Subject = 'Email Sent!'].size());
    }

}