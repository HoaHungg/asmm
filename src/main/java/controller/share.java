package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.sharesDAO;
import dao.videoDAO;
import model.shares;
import model.user;
import model.video;

/**
 * Servlet implementation class share
 */
public class share extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public share() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		user u = (user)session.getAttribute("userLogin");
		String movieId = ""+session.getAttribute("movieId");
		String email = request.getParameter("email");
		String mess = "Share Fail";
		
		video v = new video();
		v.setVideoId(movieId);
		video vDAO = videoDAO.getVideoDAO().selectX(v);
		
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
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setSubject("Share Video!");
			msg.setText("Video: " + request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/WEB-VIEW/JSP/movie-page.jsp?id="+movieId);
			
			Transport.send(msg);
			
			shares sh = new shares(null, email, java.util.Calendar.getInstance().getTime(), u, vDAO);
			sharesDAO.getSharesDAO().insertX(sh);
			mess = "Share Success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("mess", mess);
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/movie-page.jsp?id="+movieId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
