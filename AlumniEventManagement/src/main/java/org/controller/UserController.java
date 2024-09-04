package org.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.model.EventModel;
import org.service.Eventservice;
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
	@RequestMapping(value = "/eventview")
	public String viewevetnts(Model md) {
		List<EventModel> eventslist = evservice.getevents();
		md.addAttribute("ev", eventslist);
		return "Viewevents";
	}
	@RequestMapping(value = "/feedback")
	public String getfeedback(Model md) {
		List<EventModel> events = evservice.getevents();
		md.addAttribute("evl",events);
		return "Feedback";
	}
	@RequestMapping(value = "/getfeedback")
	public String addfeedback() {
		return "Feedback";
	}
}