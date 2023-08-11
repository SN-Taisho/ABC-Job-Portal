package com.abc.jobportal.services;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender jMailSender;
	
	public void sendEmail(String toEmail, String subject, String body) 
			throws UnsupportedEncodingException, MessagingException {
		
		MimeMessage message = jMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("sn.taisho@gmail.com");
		helper.setTo(toEmail);
		helper.setSubject(subject);
		helper.setText(body, true);
		
		jMailSender.send(message);
		
		System.out.println("Email sent successfully");
	}
}
