trigger CaseTrigger on Case (after update) {
    
    private static boolean isRecursive = false;
    
    if(Trigger.isUpdate && Trigger.isAfter && !isRecursive){
        isRecursive = true;
        List<Case> closedCases = new List<Case>();
        
        for(Case c : Trigger.new){
            if(Trigger.newMap.get(c.Id).Status != Trigger.oldMap.get(c.Id).Status 
               &&  Trigger.newMap.get(c.Id).Status == 'Closed'){
                   closedCases.add(c);
               }
        }
        
        sendEmail(closedCases);
    }
    
    private static void sendEmail(List<Case> cases){
        if(FeatureFlagManagerUtilities.isSendEmailOnCloseCaseEnabled()){
            List<Case> casesToUpdate = new List<Case>();
            for(Case c : cases){
                Case uCase = new Case();
                uCase.Id = c.Id;
                uCase.Subject = 'Email Sent!';
                casesToUpdate.add(uCase);
            }
            if(casesToUpdate.size() > 0){
                system.debug('SEND EMAIL');
                update casesToUpdate;
            }
        }
    }

}