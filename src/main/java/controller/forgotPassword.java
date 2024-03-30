package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.userDAO;
import model.user;

/**
 * Servlet implementation class forgotPassword
 */
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPassword() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mess = "";
		String emailErr = "";
		user u = new user();
		u.setEmail(request.getParameter("email"));
		user uDAO = userDAO.getUserDAO().selectX(u);
		if(uDAO != null) {
			try {
				final String tk = "nguyenhoahung1007@gmail.com";
				final String password = "miyadhnqogmurwqu";
				
				Properties p = new Properties();
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.host", "smtp.gmail.com");
				p.put("mail.smtp.port", "587"); 
				p.put("mail.smtp.ssl.protocols", "TLSv1.2");
				
				Authenticator au = new Authenticator() {
					@Override
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(tk, password);
					}
				};
				Session s = Session.getInstance(p, au);
				Message msg = new MimeMessage(s);
				msg.setFrom(new InternetAddress(tk));
				msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(uDAO.getEmail()));
				msg.setSubject("Your Password!");
				msg.setText("Your Password is: " + uDAO.getPassword());
				
				Transport.send(msg);
				
				mess = "Send Mail Success";
			} catch (Exception e) {
				mess = "Send Mail Fail";
				e.printStackTrace();
			}
		} else {
			mess = "Send Mail Fail";
			emailErr = "Email not exit";
		}
		
		request.getSession().setAttribute("mess", mess);
		request.getSession().setAttribute("emailErr", emailErr);
		request.getSession().setAttribute("email", u.getEmail());
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/forgot-password-page.jsp"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
