package test;

import dao.favoritesDAO;
import dao.userDAO;
import model.user;

public class test {
	public static void main(String[] args) {
		user u = new user();
		u.setEmail("zekoxpop@gmail.com");
		user uDAO = userDAO.getUserDAO().selectX(u);
		System.out.println((favoritesDAO.getVideoDAO().selectAllwithUser(uDAO)));
	}
}
