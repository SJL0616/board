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

	public void changePwd(String pwd) {
		// 硫붿씪 �꽕�젙 �젙蹂�
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true"); // 濡쒓렇�씤�떆 TLS瑜� �궗�슜�븷 寃껋씤吏� �꽕�젙
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");	
		prop.put("mail.smtp.host", "smtp.gmail.com");// SMTP�꽌踰�
		prop.put("mail.smtp.auth", "true");// SMTP �꽌踰꾩쓽 �씤利� �궗�슜
		prop.put("mail.smtp.port", "587");// TLS �룷�듃踰덊샇= 587, SSL �룷�듃踰덊샇= 465

		String mail_id = "ehfcmtorl3@gmail.com";
		String mail_pw = "ikrqcjkeytseggad";
		
		// 援ш� 怨꾩젙 �씤利앹슜 ID/PW �꽭�똿
		Authenticator auth = new MailAuth(mail_id, mail_pw);
		// �꽭�뀡 諛� 硫붿꽭吏� �깮�꽦 (�봽濡쒗띁�떚, �씤利�)
		Session session = Session.getDefaultInstance(prop, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// 蹂대궡�뒗 �궇吏� 吏��젙
			msg.setSentDate(new Date());
			// 諛쒖넚�옄 �꽕�젙 (諛쒖넚�옄�쓽 硫붿씪, 諛쒖넚�옄紐�)
			msg.setFrom(new InternetAddress("rmarnftks@gmail.com", "源��삎�썝"));
             // �닔�떊�옄 �꽕�젙 
			// Message.RecipientType.TO : 諛쏅뒗 �궗�엺 
			InternetAddress to = new InternetAddress("guddnjs010@naver.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // 硫붿씪 �젣紐�
			msg.setSubject("鍮꾨�踰덊샇 李얘린 �씤利앸쾲�샇�엯�땲�떎.", "UTF-8");
			// 硫붿씪 �궡�슜
			msg.setText("�씤利앸쾲�샇瑜� �젙�솗�엳 �엯�젰�빐二쇱꽭�슂\n�씤利앸쾲�샇�뒗 "+ pwd +" �엯�땲�떎.", "UTF-8");
			
            // 硫붿씪 諛쒖넚
			Transport.send(msg);

		} catch (AddressException ae) {// 二쇱냼瑜� �엯�젰�븯吏� �븡�븯�쓣 寃쎌슦
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {// 硫붿꽭吏��뿉 �씠�긽�씠 �엳�쓣 寃쎌슦
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
	
	public boolean changePwd2(String pwd, String email) {
		// 硫붿씪 �꽕�젙 �젙蹂�
				Properties prop = System.getProperties();
				prop.put("mail.smtp.starttls.enable", "true"); // 濡쒓렇�씤�떆 TLS瑜� �궗�슜�븷 寃껋씤吏� �꽕�젙
				prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");	
				prop.put("mail.smtp.host", "smtp.gmail.com");// SMTP�꽌踰�
				prop.put("mail.smtp.auth", "true");// SMTP �꽌踰꾩쓽 �씤利� �궗�슜
				prop.put("mail.smtp.port", "587");// TLS �룷�듃踰덊샇= 587, SSL �룷�듃踰덊샇= 465

				String mail_id = "ehfcmtorl3@gmail.com";
				String mail_pw = "ikrqcjkeytseggad";
				
				// 援ш� 怨꾩젙 �씤利앹슜 ID/PW �꽭�똿
				Authenticator auth = new MailAuth(mail_id, mail_pw);
				// �꽭�뀡 諛� 硫붿꽭吏� �깮�꽦 (�봽濡쒗띁�떚, �씤利�)
				Session session = Session.getDefaultInstance(prop, auth);
				MimeMessage msg = new MimeMessage(session);

				try {
					// 蹂대궡�뒗 �궇吏� 吏��젙
					msg.setSentDate(new Date());
					// 諛쒖넚�옄 �꽕�젙 (諛쒖넚�옄�쓽 硫붿씪, 諛쒖넚�옄紐�)
					msg.setFrom(new InternetAddress("rmarnftks@gmail.com", "김형원"));
		             // �닔�떊�옄 �꽕�젙 
					// Message.RecipientType.TO : 諛쏅뒗 �궗�엺 
					InternetAddress to = new InternetAddress(email);
					msg.setRecipient(Message.RecipientType.TO, to);
					
		            // 硫붿씪 �젣紐�
					msg.setSubject("비밀번호 재설정 메일입니다.", "UTF-8");
					// 硫붿씪 �궡�슜
					msg.setText("재설정 된 비밀번호는 "+ pwd +"입니다. 정확히 입력하여 주십시오", "UTF-8");
					
		            // 硫붿씪 諛쒖넚
					Transport.send(msg);
					return true;
				} catch (AddressException ae) {// 二쇱냼瑜� �엯�젰�븯吏� �븡�븯�쓣 寃쎌슦
					System.out.println("AddressException : " + ae.getMessage());
					return false;
				} catch (MessagingException me) {// 硫붿꽭吏��뿉 �씠�긽�씠 �엳�쓣 寃쎌슦
					System.out.println("MessagingException : " + me.getMessage());
					return false;
				} catch (UnsupportedEncodingException e) {
					System.out.println("UnsupportedEncodingException : " + e.getMessage());
					return false;
				}
			}
	}





class MailAuth extends Authenticator {

	PasswordAuthentication pa;
	
	public MailAuth(String mail_id, String mail_pw) {
		// �궗�슜�옄 �씤利� �젙蹂대�� �떞�븘�꽌 諛섑솚
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
	
}

