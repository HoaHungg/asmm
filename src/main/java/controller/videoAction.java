package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.videoDAO;
import model.video;

/**
 * Servlet implementation class videoAction
 */
public class videoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String videoId = this.setpara(request, "videoId");
		String mess = "Insert Fail";
		
		video v = new video(videoId);
		if(videoDAO.getVideoDAO().selectX(v) == null) {
			if(videoDAO.getVideoDAO().insertX(v)) {
				mess = "Insert Success";
			}
		}
		
		session.setAttribute("mess", mess);
		response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/videoManager.jsp");
	}

	public String setpara(HttpServletRequest request, String name) {
		String output = request.getParameter(name) != null ? "" + request.getParameter(name) : null;
		request.getSession().setAttribute(name, output);
		return output;
	}
}
