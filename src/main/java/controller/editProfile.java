package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.userDAO;
import model.user;

/**
 * Servlet implementation class editProfile
 */
@MultipartConfig()
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editProfile() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		user u = (user) session.getAttribute("userLogin");
		u.setFullname(request.getParameter("fullname"));
		u.setUsername(request.getParameter("username"));
		u.setPhone(request.getParameter("phone"));
		
		session.setAttribute("userLogin", u);
		session.setAttribute("mess", "Update Success");
		
		File dir = new File(request.getServletContext().getRealPath("/files"));
		if(!dir.exists()) { 
			dir.mkdirs();
		}
		if(!request.getPart("photo_file").getSubmittedFileName().equals("")) {			
			Part img = request.getPart("photo_file"); 
			File photoFile = new File(dir, img.getSubmittedFileName());
			img.write(photoFile.getAbsolutePath());
			String imgLink = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/files/" + img.getSubmittedFileName();
			session.setAttribute("img", imgLink);
			u.setAvata(imgLink);
		}
		
		userDAO.getUserDAO().updateX(u);
		
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/profile-page.jsp");
	}

}
