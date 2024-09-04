package org.model;

public class BatchModel {
	private int Bid;
	private String batch_year;
	private int dept_id;
	private String deptname;
	public BatchModel(int Bid, String batch_year, int dept_id) {
		this.Bid = Bid;
		this.batch_year = batch_year;
		this.dept_id = dept_id;
	}

	public BatchModel() {
	}

	@Override
	public String toString() {
		return "BatchModel [Bid=" + Bid + ", batch_year=" + batch_year + ", dept_id=" + dept_id + "]";
	}

	public int getBid() {
		return Bid;
	}

	public void setBid(int Bid) {
		this.Bid = Bid;
	}

	public String getBatch_year() {
		return batch_year;
	}

	public void setBatch_year(String batch_year) {
		this.batch_year = batch_year;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	
	public void setdeptname(String dept_name) {
		this.deptname = dept_name;
	}
	public String getdeptname() {
		return deptname;
	}
}