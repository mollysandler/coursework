package test;

import org.junit.jupiter.api.Test;
import main.part2.EmailService;
import main.part2.MessagingApp;
import main.part2.SMSService;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestMessagingApp {

	@Test
	public void testTexting() {
		SMSService text = new SMSService();
		MessagingApp app = new MessagingApp(text);
		assertEquals("SMS sent to john@abc.com with Message: Hi John",
				app.processMessages("Hi John", "john@abc.com"));
	}

	@Test
	public void testEmailing() {
		EmailService email = new EmailService();
		MessagingApp app = new MessagingApp(email);
		assertEquals("Email sent to john@abc.com with Message: Hi John",
				app.processMessages("Hi John", "john@abc.com"));
	}
}//end of big class