package dao;

import java.text.NumberFormat;
import java.util.Currency;
import java.util.List;
import java.util.Locale;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import entity.Brand;
import entity.Cart;
import entity.Category;
import entity.Product;
import utils.JpaUtils;

public class ProductDAO extends WineMarketDAO<Product, Integer> {

	@Override
	public void insert(Product enity) {
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
	public void update(Product enity) {
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
			Product product = em.find(Product.class, key);
			if (product != null) {
				em.remove(product);
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
	public List<Product> selectAll() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);
		return query.getResultList();
	}

	@Override
	public Product selectById(Integer key) {
		EntityManager eManager = JpaUtils.getEntityManager();
		Product product = eManager.find(Product.class, key);
		return product;
	}

	@Override
	protected List<Product> selectBySql(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Product> selectAll(int page, int pageSize) {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);
		query.setFirstResult(page * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	public List<Product> selectByBrandIdCategoryId(Integer brandId, Integer categoryId) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "select p from Product p where BrandId  = :brandId and CategoryId = :categoryId";
		TypedQuery<Product> query = eManager.createQuery(jqplString, Product.class);
		query.setParameter("brandId", brandId);
		query.setParameter("categoryId", categoryId);
		return query.getResultList();
	}

	public String formatPrice(double price) {
		Locale vn = new Locale("vi", "VN");
		NumberFormat vnFormat = NumberFormat.getCurrencyInstance(vn);
		return "" + vnFormat.format(price);
	}
	
	public List<Product> searchByKeyWord(String key) {
		EntityManager eManager = JpaUtils.getEntityManager();
		String jqplString = "select p from Product p where Name  like :key";
		TypedQuery<Product> query = eManager.createQuery(jqplString, Product.class);
		query.setParameter("key", "%"+key+"%");
		return query.getResultList();
	}
}
