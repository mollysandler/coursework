package main.part2;

public class EmailService implements MessageService{

	/**
	   * Send email with message to receiver.
	   * @param message message contained in the email (non-null)
	   * @param receiver email address (non-null)
	   */

	@Override
	public String sendMessage(String message, String receiver) {
		return "Email sent to " + receiver + " with Message: "+message;
	}
}
