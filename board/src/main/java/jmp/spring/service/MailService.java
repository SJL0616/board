package jmp.spring.service;

import java.io.UnsupportedEncodingException;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MailService {	
	

	
	  @Autowired Properties props;
	 
	
	public void welcomeMailSend() {
		// ���� ���� ����
		/*
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true"); // �α��ν� TLS�� ����� ������ ����
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");	
		prop.put("mail.smtp.host", "smtp.gmail.com");// SMTP����
		prop.put("mail.smtp.auth", "true");// SMTP ������ ���� ���
		prop.put("mail.smtp.port", "587");// TLS ��Ʈ��ȣ= 587, SSL ��Ʈ��ȣ= 465
*/
		
		/*
		 * nasajang2020@gmail.com/dhcsbwasnqezhzwh "niccemjtbqyiejja";
		 */	System.out.println(props);
		String mail_id = props.getProperty("mail.id");
				/*"ehfcmtorl3@gmail.com";"ikrqcjkeytseggad";*/
		String mail_pw= props.getProperty("mail.pw");
			

		
		
		
		// ���� ���� ������ ID/PW ����
		Authenticator auth = new MailAuth(mail_id, mail_pw);
		// ���� �� �޼��� ���� (������Ƽ, ����)
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// ������ ��¥ ����
			msg.setSentDate(new Date());
			// �߼��� ���� (�߼����� ����, �߼��ڸ�)
			msg.setFrom(new InternetAddress("ehfcmtorl3@gmail.com", "sangjun"));
             // ������ ���� 
			// Message.RecipientType.TO : �޴� ��� 
			InternetAddress to = new InternetAddress("ehfcmtorl3@gmail.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // ���� ����
			msg.setSubject("ȯ���մϴ�.", "UTF-8");
			// ���� ����
			msg.setText("������ ���ϵ帳�ϴ�.\n������ȣ�� 1234 �Դϴ�.", "UTF-8");
			System.out.println("===============================");
            // ���� �߼�
			Transport.send(msg);
			System.out.println("===============================");
		} catch (AddressException ae) {// �ּҸ� �Է����� �ʾ��� ���
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {// �޼����� �̻��� ���� ���
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
}




class MailAuth extends Authenticator {

	PasswordAuthentication pa;
	
	public MailAuth(String mail_id, String mail_pw) {
		// ����� ���� ������ ��Ƽ� ��ȯ
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}