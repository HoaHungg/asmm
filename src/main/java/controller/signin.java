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
 * Servlet implementation class signin
 */
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email = this.setpara(request, "email");
		String password = this.setpara(request, "password");
		user u = new user();
		u.setEmail(email);
		
		Boolean err = false;
		if(email != null && password != null) {
			if(userDAO.getUserDAO().selectX(u) == null){
				session.setAttribute("emailErr", "This email does not exist yet!");
				err = true;
			} else {
				user uDAO = userDAO.getUserDAO().selectX(u);
				if(!uDAO.getPassword().equals(password)) {
					session.setAttribute("passwordErr", "This password does not exist yet!");
					err = true;
				}
			}
		} else {
			if (email == null) {
				session.setAttribute("emailErr", "Please enter valid email address!");
			}
			if (password == null) {
				session.setAttribute("passwordErr", "Please enter password!");
			} 
			err = true;
		}
		
		if(!err) {
			session.setAttribute("userLogin", userDAO.getUserDAO().selectX(u));
			session.setAttribute("mess", "Sign-in Success");
		} else {
			session.setAttribute("mess", "Sign-in Fail");
		}
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/signin-page.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public String setpara(HttpServletRequest request, String name) {
		String output = request.getParameter(name) != null ? "" + request.getParameter(name) : null;
		request.getSession().setAttribute(name, output);
		return output;
	}
}
