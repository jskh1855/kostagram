<%@page import="model.Gmail"%>
<%@page import="model.SHA256"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>

<%
		String host = "http://localhost:8888/semiproject/";		
		String from = "kosta215555@gmail.com";
		String to = request.getParameter("email");
		String code = SHA256.getEncrypt(to, "cos");

		//사용자에게 보낼 메시지
		String subject = "회원가입을 위한 이메일 인증 메일입니다.";
		String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요. " 
		        + "<a href='" + host + "register/gmailCheckAction.jsp?code=" + code
				+ "'>이메일 인증하기</a>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.sockerFactory.fallback", "false");
		
		if (MemberDAO.getInstance().isExist(to) == true){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일이 이미 존재합니다')");
			script.println("history.back();");
			script.println("</script>");
		}
		else{
			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html; charset=UTF8");
				Transport.send(msg);
			} catch (Exception e) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이메일 인증 오류')");
				script.println("history.back();");
				script.println("</script>");
			}
		}
	%>	
<script type="text/javascript">
	location.href = "${pageContext.request.contextPath}/index.jsp";
</script>