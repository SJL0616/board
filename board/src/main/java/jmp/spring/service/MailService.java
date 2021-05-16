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
	 
	
	public void welcomeMailSend(String tpwd) {
		// 메일 설정 정보
		/*
		Properties prop = System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true"); // 로그인시 TLS를 사용할 것인지 설정
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");	
		prop.put("mail.smtp.host", "smtp.gmail.com");// SMTP서버
		prop.put("mail.smtp.auth", "true");// SMTP 서버의 인증 사용
		prop.put("mail.smtp.port", "587");// TLS 포트번호= 587, SSL 포트번호= 465
*/
		
		/*
		 * nasajang2020@gmail.com/dhcsbwasnqezhzwh "niccemjtbqyiejja";
		 */	System.out.println(props);
		String mail_id = props.getProperty("mail.id");
				/*"ehfcmtorl3@gmail.com";"ikrqcjkeytseggad";*/
		String mail_pw= props.getProperty("mail.pw");
			

		
		
		
		// 구글 계정 인증용 ID/PW 세팅
		Authenticator auth = new MailAuth(mail_id, mail_pw);
		// 세션 및 메세지 생성 (프로퍼티, 인증)
		Session session = Session.getDefaultInstance(props, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// 보내는 날짜 지정
			msg.setSentDate(new Date());
			// 발송자 설정 (발송자의 메일, 발송자명)
			msg.setFrom(new InternetAddress("ehfcmtorl3@gmail.com", "sangjun"));
             // 수신자 설정 
			// Message.RecipientType.TO : 받는 사람 
			InternetAddress to = new InternetAddress("nasajang2020@gmail.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			
            // 메일 제목
			msg.setSubject("이상준 과제 임시 비밀번호 메일.", "UTF-8");
			// 메일 내용
			msg.setText("가입을 축하드립니다.\n임시 비밀번호는 "+tpwd+"입니다.", "UTF-8");
			System.out.println("===============================");
            // 메일 발송
			Transport.send(msg);
			System.out.println("===============================");
		} catch (AddressException ae) {// 주소를 입력하지 않았을 경우
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {// 메세지에 이상이 있을 경우
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
}




class MailAuth extends Authenticator {

	PasswordAuthentication pa;
	
	public MailAuth(String mail_id, String mail_pw) {
		// 사용자 인증 정보를 담아서 반환
		pa = new PasswordAuthentication(mail_id, mail_pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
