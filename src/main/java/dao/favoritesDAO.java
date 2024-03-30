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

public class favoritesDAO implements daoInterface<favorites>{
	public static favoritesDAO getVideoDAO() {
		return new favoritesDAO();
	}

	@Override
	public boolean insertX(favorites g) {
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
	public boolean deleteX(favorites g) {
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			
			if(sf != null) {
				Session s = sf.openSession();
				
				try {
					Transaction ts = s.beginTransaction();
					
					s.remove(g);
					
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
	public boolean updateX(favorites g) {
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
	public favorites selectX(favorites g) {
		favorites f = new favorites();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					f = s.get(favorites.class, g.getId());
					
					ts.commit();
				} finally {
					s.close();
				}
				return f;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<favorites> selectAll() {
		List<favorites> list = new ArrayList<>();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM favorites f";
					Query query = s.createQuery(hql);
					list = query.getResultList();
					
					ts.commit();
				} finally {
					s.close();
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public favorites selectOne(user u, String videoId) {
		favorites f = new favorites();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM favorites f WHERE f.user like :user AND f.video.videoId like :video";
					Query query = s.createQuery(hql);
					query.setParameter("user", u);
					query.setParameter("video", videoId);
					f = (favorites) query.getResultList().get(0);
					
					ts.commit();
				} finally {
					s.close();
				}
			}
			return f;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<favorites> selectAllwithUser(user u) {
		List<favorites> list = new ArrayList<>();
		try {
			SessionFactory sf = hibernateUtil.getSessionFactory();
			if(sf != null) {
				Session s = sf.openSession();
				try {
					Transaction ts = s.beginTransaction();
					
					String hql = "FROM favorites f WHERE f.user like :user";
					Query query = s.createQuery(hql);
					query.setParameter("user", u);
					list = query.getResultList();
					
					ts.commit();
				} finally {
					s.close();
				}
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
