package chuongnh.com.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ContactUtils {

	public ContactUtils() {
		// TODO Auto-generated constructor stub
	}
	public static void sendEmail(String host, String port, final String userName, final String password,
			String toAddress, String subject, String message) throws AddressException, MessagingException {

		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("chuongnhh@gmail.com", "14110013");
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		MimeMessage msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(userName));

		String[] recipientSends = toAddress.split(",");
		for (String to : recipientSends) {
			InternetAddress[] toAddresses = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);

			msg.setHeader("Content-Type", "text/html; charset=UTF-8");
			msg.setContent(message, "text/html; charset=UTF-8");
			msg.setSubject(subject, "UTF-8");
			msg.setSentDate(new Date());

			// sends the e-mail
			Transport.send(msg);
		}

	}

}
