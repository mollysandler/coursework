package main.part2;

public class SMSService implements MessageService{

    @Override
    public String sendMessage(String message, String receiver) {
        return ("SMS sent to " + receiver + " with Message: "+message);
    }
}//end of smsservice
