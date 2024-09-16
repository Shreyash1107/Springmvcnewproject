package org.service;

import java.util.List;

import org.model.FeedbackModel;

public interface FeedbackService {
	public boolean issubmitFeedback(FeedbackModel fmodel);
	public List<FeedbackModel> getfeedback();
}