package org.model;

public class DepartmentModel {
	public int dept_id;
	public String dept_name;

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public DepartmentModel(int dept_id, String dept_name) {
		this.dept_id = dept_id;
		this.dept_name = dept_name;
	}

	public DepartmentModel() {

	}

	@Override
	public String toString() {
		return "DepartmentModel [dept_id=" + dept_id + ", dept_name=" + dept_name + "]";
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
}
