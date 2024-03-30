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
 * Servlet implementation class changePassword
 */
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
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
		user u = (user) session.getAttribute("userLogin");
		String npassword = this.setpara(request, "npassword");
		String cfpassword = this.setpara(request, "cfpassword");
		
		Boolean err = false;
		if(npassword != null && cfpassword != null) {
			if(npassword.length() < 6) {
				session.setAttribute("npasswordErr", "Password must have at least 6 characters!");
				err = true;
			}
			if(cfpassword.length() < 6) {
				session.setAttribute("cfpasswordErr", "Password confirm must have at least 6 characters!");
				err = true;
			} else if(!npassword.equals(cfpassword)) {
				session.setAttribute("cfpasswordErr", "Passwords do not match!");
				err = true;
			}
			
		} else {
			if (npassword == null) {
				session.setAttribute("npasswordErr", "Please enter password!");
			} 
			if (cfpassword == null) {
				session.setAttribute("cfpasswordErr", "Please enter password confirm!");
			}
			err = true;
		}
		
		if(!err) {
			u.setPassword(cfpassword);
			userDAO.getUserDAO().updateX(u);
			session.setAttribute("mess", "Update password Success");
		} else {
			session.setAttribute("mess", "Update password Fail");
		}
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/change-password-page.jsp");
	}

	public String setpara(HttpServletRequest request, String name) {
		String output = request.getParameter(name) != null ? "" + request.getParameter(name) : null;
		request.getSession().setAttribute(name, output);
		return output;
	}
}
