package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import entity.Product;
import entity.User;
import utils.JpaUtils;

public class UserDAO extends WineMarketDAO<User, Integer> {

	@Override
	public void insert(User enity) {
		EntityManager em = JpaUtils.getEntityManager();

		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			em.persist(enity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void update(User enity) {
EntityManager em = JpaUtils.getEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try {
			trans.begin();
			em.merge(enity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void delete(Integer key) {
		EntityManager em = JpaUtils.getEntityManager();

		EntityTransaction trans = em.getTransaction();

		try {
			trans.begin();
			User user = em.find(User.class, key);
			if (user != null) {
				em.remove(user);
			} else {
				throw new Exception("not found");
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			em.close();
		}
	}

	@Override
	public List<User> selectAll() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	@Override
	public User selectById(Integer key) {
		EntityManager eManager = JpaUtils.getEntityManager();
		User user = eManager.find(User.class, key);
		return user;
	}

	@Override
	protected List<User> selectBySql(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public boolean checkLogin(String username, String password) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT u FROM User u where Username  = :username and Password = :password";
		TypedQuery<User> query = eManager.createQuery(jqplString, User.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<User> list = query.getResultList();
		if(list.size()>=1) {
			return true;
		}
		return false;
	}
	
	public boolean checkUsername(String username) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT u FROM User u where Username  = :username";
		TypedQuery<User> query = eManager.createQuery(jqplString, User.class);
		query.setParameter("username", username);
		List<User> list = query.getResultList();
		if(list.size()>=1) {
			return true;
		}
		return false;
	}
	
	public User selectByUsername(String username) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT u FROM User u where Username  = :username";
		TypedQuery<User> query = eManager.createQuery(jqplString, User.class);
		query.setParameter("username", username);
		return query.getSingleResult();
	}

}
