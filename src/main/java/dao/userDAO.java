package dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.favorites;
import model.user;
import model.video;
import util.hibernateUtil;

public class userDAO implements daoInterface<user> {
	public static userDAO getUserDAO() {
		return new userDAO();
	}
	
	@Override
	public boolean insertX(user g) {
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				
				try {
					Transaction ts = s.beginTransaction();
					
					s.save(g);
					
					ts.commit();
				
				} finally {
					s.close();
				}
				
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean deleteX(user g) {
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					s.delete(g);
					
					ts.commit();
				} finally {
					s.close();
				}
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateX(user g) {
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					s.update(g);
					
					ts.commit();
				} finally {
					s.close();
				}
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public user selectX(user g) {
		user u = new user();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					u = s.get(user.class, g.getEmail());
					
					ts.commit();
				} finally {
					s.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<user> selectAll() {
		List<user> list = new ArrayList<>();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM user u";
					Query query = s.createQuery(hql);
					list = query.getResultList();
					
					ts.commit();
				} finally {
					s.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<user> selectByRole(boolean role){
		List<user> list = new ArrayList<>();
		
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM user u WHERE u.admin = :role";
					Query query = s.createQuery(hql);
					query.setParameter("role", role);
					list = query.getResultList();
					
					ts.commit();
				} finally {
					s.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public user selectOne(user g){
		user user = new user();
		List<user> list = new ArrayList<>();
		
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM user u WHERE u.email = :email AND u.password = :password";
					Query query = s.createQuery(hql);
					query.setParameter("email", g.getEmail());
					query.setParameter("password", g.getPassword());
					list = query.getResultList();
					if(!list.isEmpty()) {
						user = list.get(0);
					} else {
						user = null;
					}
					
					ts.commit();
				} finally {
					s.close();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public user selectExit(user g){
		user user = new user();
		List<user> list = new ArrayList<>();
		
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM user u WHERE u.email = :email";
					Query query = s.createQuery(hql);
					query.setParameter("email", g.getEmail());
					list = query.getResultList();
					if(!list.isEmpty()) {
						user = list.get(0);
					} else {
						user = null;
					}
					
					ts.commit();
				} finally {
					s.close();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public List<user> selectKeyWord(String str){
		List<user> list = new ArrayList<>();
		
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM user u WHERE u.fullname like :fullname";
					Query query = s.createQuery(hql);
					query.setParameter("fullname", "%" + str + "%");
					list = query.getResultList();
					
					ts.commit();
				} finally {
					s.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public user selectAllX(user g) {
		user u = new user();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					u = s.get(user.class, g.getEmail());
					if(u != null) {						
						u.getListF().size();
					}
					
					ts.commit();
				} finally {
					s.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
//	public List<user> selectUserLikeVideo(video v){
//		List<user> list = new ArrayList<>();
//		
//		try {
//			SessionFactory sf = hibernateUtil.getSessionFactory();
//			
//			if(sf != null) {
//				Session s = sf.openSession();
//				
//				try {
//					Transaction ts = s.beginTransaction();
//					
//					video vi = videoDAO.getVideoDAO().selectAllX(v);
//					
//					for (favorites f : vi.getListF()) {
//						list.add(f.getUser());
//					}
//					
//					ts.commit();
//				} finally {
//					s.close();
//				}
//			}
//			
//			return list;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return null;
//	}
}
