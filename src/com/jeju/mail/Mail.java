package com.jeju.mail;

import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mail {

	/**
	 * SendMail
	 */
	
	public void sendMail(String email, String chkNum) {
		// 메일 인코딩
		final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

		String subject = "<제주마루>에서 보내는 인증메일 입니다.";
		String fromEmail = "jejumaru1004@naver.com";
		String fromUsername = "JEJUMARU";
		String toEmail = email; // 콤마(,)로 여러개 나열

		final String username = "jejumaru1004";
		final String password = "jejujoa1234";

		// 메일에 출력할 텍스트
		StringBuffer sb = new StringBuffer();
		sb.append("<h2>제주마루의 회원이 되신것을 환영합니다.</h2>\n");
		sb.append("\n<hr>\n");
		sb.append("<h3>아래 인증번호를 회원가입 창에 입력해주세요.</h3>\n");
		sb.append("<h3>" + chkNum + "</h3>\n");
		sb.append("\n<hr>");
		String html = sb.toString();

		// 메일 옵션 설정
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465"); 	// Naver port "587";
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.quitwait", "false");
		props.put("mail.smtp.socketFactory.port", "465"); 	 // Naver port "587";
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");

		try {
			// 메일 서버 인증 계정 설정
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			};

			// 메일 세션 생성
			Session session = Session.getInstance(props, auth);

			// 메일 송/수신 옵션 설정
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername));
			message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
			message.setSubject(subject);
			message.setSentDate(new Date());

			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();
			MimeBodyPart mFilePart = null;

			// 메일 콘텐츠 - 내용
			mTextPart.setText(html, bodyEncoding, "html");
			mParts.addBodyPart(mTextPart);

			// 메일 콘텐츠 설정
			message.setContent(mParts);

			// MIME 타입 설정
			MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
			MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
			MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
			MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
			MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
			MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
			CommandMap.setDefaultCommandMap(MailcapCmdMap);

			// 메일 발송
			Transport.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendIdMail(String email, String value) {
		// 메일 인코딩
				final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

				String subject = "<제주마루> 회원님의 ID를 확인하세요.";
				String fromEmail = "jejumaru1004@naver.com";
				String fromUsername = "JEJUMARU";
				String toEmail = email; // 콤마(,)로 여러개 나열

				final String username = "jejumaru1004";
				final String password = "jejujoa1234";

				// 메일에 출력할 텍스트
				StringBuffer sb = new StringBuffer();
				sb.append("<h2>제주마루에서 회원님의 ID를 보내드립니다.</h2>\n");
				sb.append("\n<hr>\n");
				sb.append("<h3>회원님의 ID는\t " + value + " \t입니다.</h3>\n");
				sb.append("\n<hr>");
				String html = sb.toString();

				// 메일 옵션 설정
				Properties props = new Properties();
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", "smtp.naver.com");
				props.put("mail.smtp.port", "465"); 	// Naver port "587";
				props.put("mail.smtp.auth", "true");

				props.put("mail.smtp.quitwait", "false");
				props.put("mail.smtp.socketFactory.port", "465"); 	 // Naver port "587";
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.socketFactory.fallback", "false");

				try {
					// 메일 서버 인증 계정 설정
					Authenticator auth = new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					};

					// 메일 세션 생성
					Session session = Session.getInstance(props, auth);

					// 메일 송/수신 옵션 설정
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(fromEmail, fromUsername));
					message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
					message.setSubject(subject);
					message.setSentDate(new Date());

					// 메일 콘텐츠 설정
					Multipart mParts = new MimeMultipart();
					MimeBodyPart mTextPart = new MimeBodyPart();
					MimeBodyPart mFilePart = null;

					// 메일 콘텐츠 - 내용
					mTextPart.setText(html, bodyEncoding, "html");
					mParts.addBodyPart(mTextPart);

					// 메일 콘텐츠 설정
					message.setContent(mParts);

					// MIME 타입 설정
					MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
					MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
					MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
					MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
					MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
					MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
					CommandMap.setDefaultCommandMap(MailcapCmdMap);

					// 메일 발송
					Transport.send(message);

				} catch (Exception e) {
					e.printStackTrace();
				}		
	}


	public void sendPwMail(String email, String value) {
			// 메일 인코딩
			final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

			String subject = "<제주마루> 회원님의 PW를 확인하세요.";
			String fromEmail = "jejumaru1004@naver.com";
			String fromUsername = "JEJUMARU";
			String toEmail = email; // 콤마(,)로 여러개 나열

			final String username = "jejumaru1004";
			final String password = "jejujoa1234";

			// 메일에 출력할 텍스트
			StringBuffer sb = new StringBuffer();
			sb.append("<h2>제주마루에서 회원님의 PW를 보내드립니다.</h2>\n");
			sb.append("\n<hr>\n");
			sb.append("<h3>회원님의 PW는\t " + value + " \t입니다.</h3>\n");
			sb.append("\n<hr>");
			String html = sb.toString();

			// 메일 옵션 설정
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.naver.com");
			props.put("mail.smtp.port", "465"); 	// Naver port "587";
			props.put("mail.smtp.auth", "true");

			props.put("mail.smtp.quitwait", "false");
			props.put("mail.smtp.socketFactory.port", "465"); 	 // Naver port "587";
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");

			try {
				// 메일 서버 인증 계정 설정
				Authenticator auth = new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				};

				// 메일 세션 생성
				Session session = Session.getInstance(props, auth);

				// 메일 송/수신 옵션 설정
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(fromEmail, fromUsername));
				message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
				message.setSubject(subject);
				message.setSentDate(new Date());

				// 메일 콘텐츠 설정
				Multipart mParts = new MimeMultipart();
				MimeBodyPart mTextPart = new MimeBodyPart();
				MimeBodyPart mFilePart = null;

				// 메일 콘텐츠 - 내용
				mTextPart.setText(html, bodyEncoding, "html");
				mParts.addBodyPart(mTextPart);

				// 메일 콘텐츠 설정
				message.setContent(mParts);

				// MIME 타입 설정
				MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
				MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
				MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
				MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
				MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
				MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
				CommandMap.setDefaultCommandMap(MailcapCmdMap);

				// 메일 발송
				Transport.send(message);

			} catch (Exception e) {
				e.printStackTrace();
			}		
	}
}

