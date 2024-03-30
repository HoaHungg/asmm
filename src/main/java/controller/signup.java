package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDAO;
import model.user;

/**
 * Servlet implementation class signup
 */
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signup() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String fullname = this.setpara(request, "fullname");
		String username = this.setpara(request, "username");
		String phone = this.setpara(request, "phone");
		String email = this.setpara(request, "email");
		String password = this.setpara(request, "password");
		String cfpassword = this.setpara(request, "cfpassword");
		String avata = "avatar-square.jpg";
		user u = new user();
		u.setEmail(email);
		
		Boolean err = false;
		if(fullname != null && username != null && phone != null && email != null && password != null && cfpassword != null) {
			String re_email = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
			String re_phone = "^(0\\d{9,10})$";
			if(!email.matches(re_email)) {
				session.setAttribute("emailErr", "Please enter email in correct format!");
				err = true;
			} else if(userDAO.getUserDAO().selectX(u) != null){
				session.setAttribute("emailErr", "This email already exists!");
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
			if(cfpassword.length() < 6) {
				session.setAttribute("cfpasswordErr", "Password confirm must have at least 6 characters!");
				err = true;
			} else if(!password.equals(cfpassword)) {
				session.setAttribute("cfpasswordErr", "Passwords do not match!");
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
			if (cfpassword == null) {
				session.setAttribute("cfpasswordErr", "Please enter password confirm!");
			}
			err = true;
		}
		
		if(!err) {
			u = new user(email, password, false, fullname, username, phone, avata);
			userDAO.getUserDAO().insertX(u);
			session.setAttribute("mess", "Sign-up Success");
		} else {
			session.setAttribute("mess", "Sign-up Fail");
		}
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/signup-page.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public String setpara(HttpServletRequest request, String name) {
		String output = request.getParameter(name) != null ? "" + request.getParameter(name) : null;
		request.getSession().setAttribute(name, output);
		return output;
	}
}
