package entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Users database table.
 * 
 */
@Entity
@Table(name="Users")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	@Column(name="UserId")
	private int userId;

	@Column(name="Email")
	private String email;

	@Column(name="Password")
	private String password;

	@Column(name="Role")
	private boolean role;

	@Column(name="Username")
	private String username;

	public User() {
	}
	
	public User(String username, String password, String email, boolean role) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
	}

	public int getUserId() {
		return this.userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getRole() {
		return this.role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}