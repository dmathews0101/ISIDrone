package manager;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MSendMail {
	
	private static String user = "etudiant.isi.java2@gmail.com";
	private static String pwd = "abc123...";

	// qui envoie
	private static String from = "shop@isidrone.com";


	

	
	public static void sendEmail(String msg, String to, String sujet){
		Properties props = new Properties();
		//le smtp de votre serveur web
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						// Adresse mail et password de l emetteur sur le serveur
						// smtp
						return new PasswordAuthentication(user, pwd);
					}
				});

		try {
			Message message = new MimeMessage(session);
			// adresse mail de l emetteur
			message.setFrom(new InternetAddress(from));
			// adresse destinataire
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(sujet);
			message.setContent(msg, "text/html; charset=utf-8");

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}	
	}
	
	
}
