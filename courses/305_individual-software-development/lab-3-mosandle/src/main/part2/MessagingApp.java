package main.part2;

public class MessagingApp {
	private final MessageService messageType;

	/**
	 * The MessagingApp class can currently only send email messages using
	 * an EmailService object that can send emails to a receiver email ID.
	 */
	public MessagingApp(MessageService kindOf) {
		this.messageType = kindOf;
	}
		
	/**
     * Send email with message to receiver.
	 *
     * @param message message contained in the email (non-null)
     * @param receiver email address (non-null)
	 */	
	public String processMessages(String message, String receiver) {
		return this.messageType.sendMessage(message, receiver);
	}

}

