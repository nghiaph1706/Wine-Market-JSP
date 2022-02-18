package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import entity.Brand;
import entity.Category;
import utils.JpaUtils;

public class BrandDAO extends WineMarketDAO<Brand, Integer> {

	@Override
	public void insert(Brand enity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Brand enity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer key) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Brand> selectAll() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<Brand> query = em.createNamedQuery("Brand.findAll", Brand.class);
		return query.getResultList();
	}

	@Override
	public Brand selectById(Integer key) {
		EntityManager em = JpaUtils.getEntityManager();
		Brand brand = em.find(Brand.class, key);
		return brand;
	}

	@Override
	protected List<Brand> selectBySql(String sql, Object... args) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Brand> selectByCategoryId(Integer categoryId) {
		EntityManager em = JpaUtils.getEntityManager();
		String jqplString = "select b from Brand b where CategoryId  = :categoryId";
		TypedQuery<Brand> query = em.createQuery(jqplString, Brand.class);
		query.setParameter("categoryId", categoryId);
		return query.getResultList();
	}
}
