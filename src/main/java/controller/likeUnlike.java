package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.favoritesDAO;
import dao.videoDAO;
import model.favorites;
import model.user;
import model.video;

/**
 * Servlet implementation class likeUnlike
 */
@WebServlet({ "/like-unlike/like", "/like-unlike/unlike", "/like-unlike/unlike/*" })
public class likeUnlike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public likeUnlike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		user u = (user)session.getAttribute("userLogin");
		String movieId = ""+session.getAttribute("movieId");
		if(request.getRequestURI().contains("/unlike/")) {
			if(request.getRequestURI().contains("/unlike/all")) {
				List<favorites> list = favoritesDAO.getVideoDAO().selectAllwithUser(u);
            	for(favorites f : list){
            		favoritesDAO.getVideoDAO().deleteX(f);
            	}
			} else {				
				String uri = request.getRequestURI();
				favorites f = favoritesDAO.getVideoDAO().selectOne(u, uri.substring(uri.lastIndexOf("/")+1).trim());
				favoritesDAO.getVideoDAO().deleteX(f);
			}
			response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/favorites-page.jsp");
		} else if(request.getRequestURI().contains("/unlike")) {
			favorites f = favoritesDAO.getVideoDAO().selectOne(u, movieId);
			favoritesDAO.getVideoDAO().deleteX(f);
			response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/movie-page.jsp?id="+movieId);
		} else {
			video v = new video();
			v.setVideoId(movieId);
			video vDAO = videoDAO.getVideoDAO().selectX(v);
			favorites f = new favorites(null, java.util.Calendar.getInstance().getTime(), u, vDAO);
			favoritesDAO.getVideoDAO().insertX(f);
			response.sendRedirect("/java4_ASM/WEB-VIEW/JSP/movie-page.jsp?id="+movieId);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
