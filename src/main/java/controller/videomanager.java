package controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.userDAO;
import dao.videoDAO;
import model.user;
import model.video;

/**
 * Servlet implementation class usermanager
 */
@WebServlet({"/videomanager/delete/*"})
public class videomanager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videomanager() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		video v = new video();
		v.setVideoId(request.getRequestURI().substring(request.getRequestURI().indexOf("/id=") + 4).trim());
		String mess = "Delete Fail";
		if(videoDAO.getVideoDAO().selectX(v) != null) {
			if(videoDAO.getVideoDAO().deleteX(v)) {
				mess = "Delete Success";
			} 
		} 
		session.setAttribute("mess", mess);
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/videoManager.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
