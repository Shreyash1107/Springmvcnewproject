package org.model;

public class FeedbackModel {
	private int fid;
	private String details;
	private AlumniModel amidel;
	private EventModel emodel;
	private double rating;
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public AlumniModel getAmidel() {
		return amidel;
	}
	public void setAmidel(AlumniModel amidel) {
		this.amidel = amidel;
	}
	public EventModel getEmodel() {
		return emodel;
	}
	public void setEmodel(EventModel emodel) {
		this.emodel = emodel;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "FeedbackModel [fid=" + fid + ", details=" + details + ", amidel=" + amidel + ", emodel=" + emodel
				+ ", rating=" + rating + "]";
	}
}
