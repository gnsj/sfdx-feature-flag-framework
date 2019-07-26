public class FeatureFlagManagerUtilities {

    public static Boolean isSendEmailOnCloseCaseEnabled(){
        Feature_Flag_Manager__c fm = Feature_Flag_Manager__c.getInstance();
        return fm.Send_Email_on_Close_Case__c;
    }
    
    public static void toggleSendEmailOnCloseCase(boolean featureStatus){
        Feature_Flag_Manager__c fm = Feature_Flag_Manager__c.getInstance();
		fm.Send_Email_on_Close_Case__c = featureStatus;
        upsert fm;
    }
    
}