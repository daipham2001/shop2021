package com.project.ecommerce.tool;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class Mail {
	public static void main(String[] args) {
//		if(sendMail("tranthanhhiep207@gmail.com", "active", messageForgot())) {
//			System.out.print("ha");
//		}

	}
	public static String messageDelivery() {
		String string = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"    <meta charset=\"utf-8\">\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"    <title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"    <div style=\"width:500px; margin:auto\">\r\n" + 
				"    <div>\r\n" + 
				"        <p style=\"font-size: 36px; text-align: center; margin-bottom: 0px\">ĐƠN HÀNG CỦA BẠN ĐÃ ĐƯỢC GIAO</p>\r\n" + 
				"        <hr>\r\n" + 
				"    </div>\r\n" + 
				"    \r\n" + 
				"    <div>\r\n" + 
				"        <p>Cám ơn quý khách hàng đã mua sản phẩm của chúng tôi.</p>\r\n" + 
				"        <div style=\"text-align: center; margin: 50px 0px\">\r\n" + 
				"        <a class=\"btn btn-success\" style=\"color: #fff; background-color: #28a745; border-color: #28a745;text-decoration: none;border-radius: 5px; padding: 10px\" "
				+ "href=\"http://localhost:8090/ShopSmartPhone/Views/Home.jsp"
				+"\">WELCOME TO SMARTSHOP</a>\r\n" +
				"        </div>\r\n" + 
				"        \r\n" + 
				"    </div>\r\n" + 
				"    <div>\r\n" + 
				"    </div>\r\n" + 
				"</div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		return string;
	}
	public static String messageForgot(String email) {
		String urlString="http://localhost:8090/ShopSmartPhone/admin/ForgotPassword.jsp?email="+email;
		String string = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"    <meta charset=\"UTF-8\">\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"    <title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"    <div style=\"width:500px; margin:auto\">\r\n" + 
				"    <div>\r\n" + 
				"        <p style=\"font-size: 36px; text-align: center; margin-bottom: 0px\">Thay đổi Mật khẩu</p>\r\n" + 
				"        <hr>\r\n" + 
				"    </div>\r\n" + 
				"    \r\n" + 
				"    <div>\r\n" + 
				"        <p>Chào mừng bạn tới với ShopSmartPhone. Để thay đổi mật khẩu bạn hãy click vào nút phía dưới.</p>\r\n" + 
				"        <div style=\"text-align: center; margin: 50px 0px\">\r\n" + 
				"        <a class=\"btn btn-success\" style=\"color: #fff; background-color: #28a745; border-color: #28a745;text-decoration: none;border-radius: 5px; padding: 10px\" href=\""
				+urlString+"\">Bấm vào đây để thay đổi mật khẩu</a>\r\n" + 
				"        </div>\r\n" + 
				"        \r\n" + 
				"    </div>\r\n" + 
				"    <div>\r\n" + 
				"        <p>Sau khi click, bạn sẽ được đưa tới trang web để thay đổi mật khẩu</p>\r\n" + 
				"    </div>\r\n" + 
				"</div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		return string;
	}
	public static String messageForgotForCustomer(String email) {
		String urlString="http://localhost:8090/ShopSmartPhone/Views/ForgotPassword.jsp?email="+email;
		String string = "<!DOCTYPE html>\r\n" + 
				"<html lang=\"en\">\r\n" + 
				"<head>\r\n" + 
				"    <meta charset=\"UTF-8\">\r\n" + 
				"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
				"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\r\n" + 
				"    <title>Document</title>\r\n" + 
				"</head>\r\n" + 
				"<body>\r\n" + 
				"    <div style=\"width:500px; margin:auto\">\r\n" + 
				"    <div>\r\n" + 
				"        <p style=\"font-size: 36px; text-align: center; margin-bottom: 0px\">Thay đổi Mật khẩu</p>\r\n" + 
				"        <hr>\r\n" + 
				"    </div>\r\n" + 
				"    \r\n" + 
				"    <div>\r\n" + 
				"        <p>Chào mừng bạn tới với ShopSmartPhone. Để thay đổi mật khẩu bạn hãy click vào nút phía dưới.</p>\r\n" + 
				"        <div style=\"text-align: center; margin: 50px 0px\">\r\n" + 
				"        <a class=\"btn btn-success\" style=\"color: #fff; background-color: #28a745; border-color: #28a745;text-decoration: none;border-radius: 5px; padding: 10px\" href=\""
				+urlString+"\">Bấm vào đây để thay đổi mật khẩu</a>\r\n" + 
				"        </div>\r\n" + 
				"        \r\n" + 
				"    </div>\r\n" + 
				"    <div>\r\n" + 
				"        <p>Sau khi click, bạn sẽ được đưa tới trang web để thay đổi mật khẩu</p>\r\n" + 
				"    </div>\r\n" + 
				"</div>\r\n" + 
				"</body>\r\n" + 
				"</html>";
		return string;
	}
	 public static boolean sendMail(String to, String subject, String message){
			
		 try{
	         String host ="smtp.gmail.com" ;
	         String user = "buihongngoc306@gmail.com";
	         String pass = "hongngoc306";
	         String from = "buihongngoc306@gmail.com";
	       //  String messageText = "Your Is Test Email :";
	         boolean sessionDebug = false;

	         Properties props = System.getProperties();

	         props.put("mail.smtp.starttls.enable", "true");
	         props.put("mail.smtp.host", host);
	         props.put("mail.smtp.port", "587");
	         props.put("mail.smtp.auth", "true");
	         props.put("mail.smtp.starttls.required", "true");

	         java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	         Session mailSession = Session.getDefaultInstance(props, null);
	         mailSession.setDebug(sessionDebug);
	         Message msg = new MimeMessage(mailSession);
	         msg.setFrom(new InternetAddress(from));
	         InternetAddress[] address = {new InternetAddress(to)};
	         msg.setRecipients(Message.RecipientType.TO, address);
	         msg.setSubject(subject); msg.setSentDate(new Date());
	         msg.setContent(message,"text/html; charset=utf-8");

	        Transport transport=mailSession.getTransport("smtp");
	        transport.connect(host, user, pass);
	        transport.sendMessage(msg, msg.getAllRecipients());
	        transport.close();
	        return true;
	     }catch(Exception ex)
	     {
	         System.out.println(ex);
	     }
		 return false;
		 }
}
