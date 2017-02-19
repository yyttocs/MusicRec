package com.sh.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	public static void send(String url,String password)
	{
		String userName = "15310859949@163.com";  //邮件用户名
        String pwd="yyt123456";         //邮件密码
        String toMail=url;
	
		         
		Properties props = new Properties();  
		props.setProperty("mail.smtp.host", "smtp.163.com");  
		props.setProperty("mail.smtp.auth", "true");  
		    
		Authenticator authenticator = new MyAuthenticator(userName, pwd);  
		          
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,authenticator);    
		Address from;                       
		try {
			from = new InternetAddress(userName);
			Address to = new InternetAddress(toMail);  
			MimeMessage msg = new MimeMessage(session);  
			msg.setFrom(from);  
			msg.setSubject("Password");  
			msg.setSentDate(new Date());  
			msg.setContent("<h> 密码:" + password + "</h>", "text/html;charset=utf-8");  
			msg.setRecipient(RecipientType.TO, to);  
			Transport.send(msg);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}

	public static void main(String[] args)
	{
		send("15310859949@163.com","1231");
	}
}
