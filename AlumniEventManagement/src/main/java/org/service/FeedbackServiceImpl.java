package org.service;

import java.util.List;

import org.model.FeedbackModel;
import org.repository.Feedbackrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("feedservice")
public class FeedbackServiceImpl implements FeedbackService {

    @Autowired
    Feedbackrepository feedrepo;

    public boolean issubmitFeedback(FeedbackModel fmodel) {
        boolean isSubmitted = feedrepo.issubmitFeedback(fmodel);
        return isSubmitted;
    }
    public List<FeedbackModel> getfeedback(){
    	return feedrepo.getfeedback();
    }
}