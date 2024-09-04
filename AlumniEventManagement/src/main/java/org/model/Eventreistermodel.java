package org.model;

public class Eventreistermodel {
	private int eid;
	private int Aid;
	private EventModel emodel;
	private AlumniModel amodel;
	public EventModel getEmodel() {
		return emodel;
	}
	public void setEmodel(EventModel emodel) {
		this.emodel = emodel;
	}
	public AlumniModel getAmodel() {
		return amodel;
	}
	public void setAmodel(AlumniModel amodel) {
		this.amodel = amodel;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getAid() {
		return Aid;
	}
	public void setAid(int aid) {
		Aid = aid;
	}
	@Override
	public String toString() {
		return "Eventreistermodel [eid=" + eid + ", Aid=" + Aid + "]";
	}
}
