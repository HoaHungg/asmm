package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.userDAO;
import model.user;

/**
 * Servlet implementation class info
 */
@MultipartConfig()
public class info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public info() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String fullname = this.setpara(request, "fullname");
		String username = this.setpara(request, "username");
		String phone = this.setpara(request, "phone");
		String email = this.setpara(request, "email");
		String password = this.setpara(request, "password");
		String avata = "https://cartzilla.createx.studio/img/nft/vendor/avatar-square.jpg";
		
		user u = new user();
		u.setEmail(email);
		user uDAO = userDAO.getUserDAO().selectX(u);
		
		
		File dir = new File(request.getServletContext().getRealPath("/files"));
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		if(!request.getPart("photo_file").getSubmittedFileName().equals("")) {			
			Part img = request.getPart("photo_file"); 
			File photoFile = new File(dir, img.getSubmittedFileName());
			img.write(photoFile.getAbsolutePath());
			String imgLink = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/files/" + img.getSubmittedFileName();
			avata = imgLink;
			session.setAttribute("img", imgLink);
			u.setAvata(imgLink);
		}
		
		
		Boolean err = false;
		if(fullname != null && username != null && phone != null && email != null && password != null) {
			String re_email = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
			String re_phone = "^(0\\d{9,10})$";
			if(!email.matches(re_email)) {
				session.setAttribute("emailErr", "Please enter email in correct format!");
				err = true;
			} 
			if(!phone.matches(re_phone)) {
				session.setAttribute("phoneErr", "Phone number is not valid!");
				err = true;
			}
			if(password.length() < 6) {
				session.setAttribute("passwordErr", "Password must have at least 6 characters!");
				err = true;
			}
		} else {
			if(fullname == null) {
				session.setAttribute("fullnameErr", "Please enter your full name!");
			} 
			if (username == null) {
				session.setAttribute("usernameErr", "Please enter your user name!");
			} 
			if (phone == null) {
				session.setAttribute("phoneErr", "Please enter your phone number!");
			}
			if (email == null) {
				session.setAttribute("emailErr", "Please enter valid email address!");
			}
			if (password == null) {
				session.setAttribute("passwordErr", "Please enter password!");
			} 
			err = true;
		}
		
		if(!err) {
			if(uDAO != null) {
				uDAO.setFullname(fullname);
				uDAO.setUsername(username);
				uDAO.setPhone(phone);
				uDAO.setAvata(avata);
				u.setPassword(password);
				
				session.setAttribute("mess", "Update Success");
				userDAO.getUserDAO().updateX(uDAO);
			} else {
				u.setFullname(fullname);
				u.setPassword(password);
				u.setUsername(username);
				u.setPhone(phone);
				u.setAvata(avata);
				
				session.setAttribute("mess", "Insert Success");
				userDAO.getUserDAO().insertX(u);
			}
		} else {
			if(uDAO != null) {
				session.setAttribute("mess", "Update Fail");
			} else {
				session.setAttribute("mess", "Insert Fail");
			}
		}
		
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/userManager.jsp");
	}

	public String setpara(HttpServletRequest request, String name) {
		String output = request.getParameter(name) != null ? "" + request.getParameter(name) : null;
		request.getSession().setAttribute(name, output);
		return output;
	}
}
