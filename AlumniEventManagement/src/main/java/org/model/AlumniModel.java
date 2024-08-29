package org.model;

public class AlumniModel {
	private int Aid;
	private String Name;
	private String Email;
	private String Contact;
	private int Age;
	private String Company;
	private String Gender;
	private int Dept_id;
	private int Bid;
	public int getAid() {
		return Aid;
	}
	public void setAid(int aid) {
		Aid = aid;
	}
	public AlumniModel(int aid, String name, String email, String contact, int age, String company, String gender,
			int dept_id, int bid) {
		Aid = aid;
		Name = name;
		Email = email;
		Contact = contact;
		Age = age;
		Company = company;
		Gender = gender;
		Dept_id = dept_id;
		Bid = bid;
	}
	@Override
	public String toString() {
		return "AlumniModel [Aid=" + Aid + ", Name=" + Name + ", Email=" + Email + ", Contact=" + Contact + ", Age="
				+ Age + ", Company=" + Company + ", Gender=" + Gender + ", Dept_id=" + Dept_id + ", Bid=" + Bid + "]";
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getContact() {
		return Contact;
	}
	public void setContact(String contact) {
		Contact = contact;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getCompany() {
		return Company;
	}
	public void setCompany(String company) {
		Company = company;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public int getDept_id() {
		return Dept_id;
	}
	public void setDept_id(int dept_id) {
		Dept_id = dept_id;
	}
	public int getBid() {
		return Bid;
	}
	public void setBid(int bid) {
		Bid = bid;
	}
}
