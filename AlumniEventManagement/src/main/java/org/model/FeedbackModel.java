package org.model;

public class FeedbackModel {
    private int Fid;
    private String Name;
    @Override
	public String toString() {
		return "FeedbackModel [Fid=" + Fid + ", Name=" + Name + ", emodel=" + emodel + ", suggestions=" + suggestions
				+ ", Ratings=" + Ratings + "]";
	}
	public int getFid() {
		return Fid;
	}
	public void setFid(int fid) {
		Fid = fid;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public EventModel getEmodel() {
		return emodel;
	}
	public void setEmodel(EventModel emodel) {
		this.emodel = emodel;
	}
	public String getSuggestions() {
		return suggestions;
	}
	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}
	public int getRatings() {
		return Ratings;
	}
	public void setRatings(int ratings) {
		Ratings = ratings;
	}
	private EventModel emodel;
    private String suggestions;
    private int Ratings;
    
 }
