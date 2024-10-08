package org.model;

public class LoginModel {
	private int userid;
	private String username;
	private String Password;
	private String email;
	private String Contact;
	private String Logintype;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return Contact;
	}

	public void setContact(String contact) {
		Contact = contact;
	}

	public String getLogintype() {
		return Logintype;
	}

	public void setLogintype(String logintype) {
		Logintype = logintype;
	}

	public LoginModel(int userid, String username, String password, String email, String contact, String logintype) {
		this.userid = userid;
		this.username = username;
		Password = password;
		this.email = email;
		Contact = contact;
		Logintype = logintype;
	}

	public LoginModel() {

	}

	@Override
	public String toString() {
		return "LoginModel [userid=" + userid + ", username=" + username + ", Password=" + Password + ", email=" + email
				+ ", Contact=" + Contact + ", Logintype=" + Logintype + "]";
	}

}
