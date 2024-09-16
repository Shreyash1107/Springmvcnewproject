package org.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.model.AlumniModel;
import org.model.EventModel;
import org.model.FeedbackModel;
import org.service.Eventservice;
import org.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired
	Eventservice evservice;
	@Autowired
	FeedbackService fservice;
	@RequestMapping(value = "/eventview")
	public String viewevetnts(Model md) {
		List<EventModel> eventslist = evservice.getevents();
		md.addAttribute("ev", eventslist);
		return "Viewevents";
	}

	@RequestMapping(value = "/feedback")
	public String getfeedback(Model md) {
		List<EventModel> events = evservice.getevents();
		md.addAttribute("evl", events);
		return "Feedback";
	}

	@RequestMapping(value = "/getfeedback")
	public String getfeedback(FeedbackModel fmodel, Model md, HttpServletRequest req, EventModel evmodel) {
		List<EventModel> events = evservice.getevents();
		md.addAttribute("evl", events);
		String name = req.getParameter("Name").trim().toUpperCase();
		int evid = Integer.parseInt(req.getParameter("eventid"));
		String details = req.getParameter("feedbackDetails");
		int ratings = Integer.parseInt(req.getParameter("rating"));
		fmodel.setSuggestions(details);
		evmodel.setEid(evid);
		fmodel.setRatings(ratings);
		fmodel.setEmodel(evmodel);
		fmodel.setName(name);
		/* System.out.println(fmodel); */
		boolean b = fservice.issubmitFeedback(fmodel);
		if (b) {
			md.addAttribute("fd", "Feedback Submitted,Thank you for your response..............");
		}
		return "Feedback";
	}
}