package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Brands database table.
 * 
 */
@Entity
@Table(name="Brands")
@NamedQuery(name="Brand.findAll", query="SELECT b FROM Brand b")
public class Brand implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="BrandId")
	private int brandId;

	@Column(name="CategoryId")
	private int categoryId;

	@Column(name="Name")
	private String name;

	public Brand() {
	}

	public int getBrandId() {
		return this.brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}