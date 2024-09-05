package org.model;

public class FeedbackModel {
	public int fid;
	public String details;
	public EventModel emodel;
	public int rating;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	String name;
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
	public EventModel getEmodel() {
		return emodel;
	}
	public void setEmodel(EventModel emodel) {
		this.emodel = emodel;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "FeedbackModel [fid=" + fid + ", details=" + details + ", emodel=" + emodel + ", rating=" + rating
				+ ", name=" + name + "]";
	}
}