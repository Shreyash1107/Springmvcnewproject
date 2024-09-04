package org.model;

public class AlumniModel {
	private Integer Aid;
	private String Name;
	private String Email;
	private String Contact;
	private Integer Age;
	private String Company;
	private String Gender;
	private Integer Dept_id;
	private Integer Bid;
	private DepartmentModel deptmodel;
	private BatchModel bmodel;
	
	public int getAid(){
		return Aid;
	}
	public void setAid(Integer aid) {
		Aid = aid;
	}
	public AlumniModel() {
		
	}
	public AlumniModel(Integer aid, String name, String email, String contact, Integer age, String company, String gender,
			Integer dept_id, Integer bid) {
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
	public void setAge(Integer age) {
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
	public void setDept_id(Integer dept_id) {
		Dept_id = dept_id;
	}
	public int getBid() {
		return Bid;
	}
	public void setBid(Integer bid) {
		Bid = bid;
	}
	public void setdeptmodel(DepartmentModel dmodel) {
		this.deptmodel = dmodel;
	}
	public DepartmentModel getdeptmodel() {
		return deptmodel;
	}
	public void setbatchmodel(BatchModel bmodel) {
		this.bmodel = bmodel;
	}
	public BatchModel getbatchmodel() {
		return bmodel;
	}
}