package dao;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import entity.Cart;
import entity.Product;
import entity.User;
import utils.JpaUtils;

public class CartDAO extends WineMarketDAO<Cart, Integer> {

	@Override
	public void insert(Cart enity) {
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
	public void update(Cart enity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer key) {
		EntityManager em = JpaUtils.getEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try {
			trans.begin();
			Cart cart = em.find(Cart.class, key);
			if (cart != null) {
				em.remove(cart);
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
	public List<Cart> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cart selectById(Integer key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<Cart> selectBySql(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Cart selectByUserIdProductId(int userId, int productId) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT c FROM Cart c where UserId  = :userId and ProductId =:productId";
		TypedQuery<Cart> query = eManager.createQuery(jqplString, Cart.class);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		return query.getSingleResult();
	}
	
	public List<Cart> selectByUserId(int userId) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT c FROM Cart c where UserId  = :userId";
		TypedQuery<Cart> query = eManager.createQuery(jqplString, Cart.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	
	public boolean checkProductExists(int userId, int productId) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT c FROM Cart c where UserId  = :userId and ProductId =:productId";
		TypedQuery<Cart> query = eManager.createQuery(jqplString, Cart.class);
		query.setParameter("userId", userId);
		query.setParameter("productId", productId);
		if (query.getResultList().size() > 0) {
			return true;
		}
		return false;
	}
	
	public void plusProduct(Cart enity) {
		enity.setQuantity(enity.getQuantity()+1);
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
	
	public void removeProduct(Cart enity) {

		EntityManager em = JpaUtils.getEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		if (enity.getQuantity()>0) {
			enity.setQuantity(enity.getQuantity()-1);
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
	}
	
	public void removeEmpty() {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT c FROM Cart c where Quantity=0";
		TypedQuery<Cart> query = eManager.createQuery(jqplString, Cart.class);
		for(Cart cart:query.getResultList()) {
			delete(cart.getCartId());
		}
	}
	
	public double totalCart(List<Cart> list) {
		double total =0;
		ProductDAO daop = new ProductDAO();
		for(Cart cart:list) {
			Product product = daop.selectById(cart.getProductId());
			total += (product.getPrice()*cart.getQuantity());
		}
		return total;
	}
	
	public void deleteAllByUserId(int userId) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "SELECT c FROM Cart c where UserId  = :userId";
		TypedQuery<Cart> query = eManager.createQuery(jqplString, Cart.class);
		query.setParameter("userId", userId);
		for(Cart cart:query.getResultList()) {
			delete(cart.getCartId());
		}
	}
}
