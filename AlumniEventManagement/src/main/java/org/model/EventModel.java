package org.model;

public class EventModel {
	private int Eid;
	private String name;
	private String date;
	private String time;
	private AlumniModel amodel;
	@Override
	public String toString() {
		return "EventModel [Eid=" + Eid + ", name=" + name + ", date=" + date + ", time=" + time + ", amodel=" + amodel
				+ "]";
	}
	public AlumniModel getAmodel() {
		return amodel;
	}
	public void setAmodel(AlumniModel amodel) {
		this.amodel = amodel;
	}
	public int getEid() {
		return Eid;
	}
	public void setEid(int eid) {
		Eid = eid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}