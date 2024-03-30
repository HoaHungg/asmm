package model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class user {
	@Id
	private String 	email;
	
	private String 	password;
	private Boolean role = false;
	private String 	fullname;
	private String 	username;
	private String 	phone;
	private String 	avata;
	
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<favorites> listF;
	
	@OneToMany(mappedBy = "userId", cascade = CascadeType.ALL)
	private List<shares> listS;
	
	public user() {

	}

	public user(String email, String password, Boolean role, String fullname, String username, String phone,
			String avata) {
		this.email = email;
		this.password = password;
		this.role = role;
		this.fullname = fullname;
		this.username = username;
		this.phone = phone;
		this.avata = avata;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getRole() {
		return role;
	}

	public void setRole(Boolean role) {
		this.role = role;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAvata() {
		return avata;
	}

	public void setAvata(String avata) {
		this.avata = avata;
	}

	public List<favorites> getListF() {
		return listF;
	}

	public void setListF(List<favorites> listF) {
		this.listF = listF;
	}

	public List<shares> getListS() {
		return listS;
	}

	public void setListS(List<shares> listS) {
		this.listS = listS;
	}
}
