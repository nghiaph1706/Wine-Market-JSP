package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Products database table.
 * 
 */
@Entity
@Table(name="Products")
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="ProductId" , updatable = false, nullable = false)
	private int productId;

	@Column(name="Alcohol")
	private double alcohol;

	@Column(name="BrandId")
	private int brandId;

	@Column(name="CategoryId")
	private int categoryId;

	@Column(name="Image")
	private String image;

	@Column(name="Name")
	private String name;

	@Column(name="Origin")
	private String origin;

	@Column(name="Price")
	private double price;

	@Column(name="Volume")
	private double volume;

	public Product() {
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public double getAlcohol() {
		return this.alcohol;
	}

	public void setAlcohol(double alcohol) {
		this.alcohol = alcohol;
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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrigin() {
		return this.origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getVolume() {
		return this.volume;
	}

	public void setVolume(double volume) {
		this.volume = volume;
	}

}