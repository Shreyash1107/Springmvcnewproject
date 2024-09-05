package org.repository;

import java.util.List;

import org.model.FeedbackModel;

public interface Feedbackrepository {
	public boolean issubmitFeedback(FeedbackModel fmodel);
	public List<FeedbackModel> getfeedback();
}