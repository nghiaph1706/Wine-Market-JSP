package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Cart database table.
 * 
 */
@Entity
@NamedQuery(name="Cart.findAll", query="SELECT c FROM Cart c")
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="CartId")
	private int cartId;

	@Column(name="ProductId")
	private int productId;

	@Column(name="Quantity")
	private int quantity;

	@Column(name="UserId")
	private int userId;

	public Cart() {
	}

	public Cart(int productId, int quantity, int userId) {
		this.productId = productId;
		this.quantity = quantity;
		this.userId = userId;
	}



	public int getCartId() {
		return this.cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductId() {
		return this.productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}