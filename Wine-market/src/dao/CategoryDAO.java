package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import entity.Brand;
import entity.Category;
import utils.JpaUtils;

public class CategoryDAO extends WineMarketDAO<Category, Integer> {

	@Override
	public void insert(Category enity) {
		
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
	public void update(Category enity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer key) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Category> selectAll() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Category> query = em.createNamedQuery("Category.findAll", Category.class);
		return query.getResultList();
	}

	@Override
	public Category selectById(Integer key) {
		EntityManager em = JpaUtils.getEntityManager();
		Category category = em.find(Category.class, key);
		return category;
	}

	@Override
	protected List<Category> selectBySql(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}

}
