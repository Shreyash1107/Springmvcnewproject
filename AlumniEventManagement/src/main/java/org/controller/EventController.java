package org.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.model.AlumniModel;
import org.model.EventModel;
import org.service.Alumniservice;
import org.service.Eventservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EventController {
	@Autowired
	Alumniservice amservice;
	@Autowired
	Eventservice evservice;
	@RequestMapping(value="/events")
	public String geteventmodule(Model md,AlumniModel amodel) {
		List<EventModel> evlist = evservice.getevents();
		if(evlist!=null) {
			md.addAttribute("e", evlist);
		}
		return "Event";
	}
	@RequestMapping(value="/saveevent")
	public String events(EventModel emodel,Model md,HttpServletRequest req) {
		String evname = req.getParameter("Name");
		String date = req.getParameter("Date");
		String time = req.getParameter("Time");
		emodel.setName(evname);
		emodel.setDate(date);
		emodel.setTime(time);
		boolean b = evservice.isEventAdded(emodel);
		if(b) {
			md.addAttribute("ev", "Event has been Added Successfully.............");
		}
		List<EventModel> evlist = evservice.getevents();
		if(evlist!=null) {
			md.addAttribute("e", evlist);
		}
		return "Event";
	}
	@RequestMapping(value = "/evreg")
	public String geteventwisealumni(Model md) {
		List<AlumniModel> amlist = amservice.getalumni();
		md.addAttribute("aml", amlist);
		return "alumnievent";
	}
	@RequestMapping(value = "/saveeventalumni")
	public String getalumniwiseevent(@RequestParam("aname")int id,Model md) {
		System.out.println("--------------------->:  "+id);
		List<EventModel> evlist = evservice.getalumniwiselist(id);
		md.addAttribute("al", evlist);
		List<AlumniModel> amlist = amservice.getalumni();
		md.addAttribute("aml", amlist);
		System.out.println(evlist);
		return "alumnievent";
	}
	@RequestMapping(value="/delevent")
	public String removeevent(@RequestParam("Eid")Integer Eid,Model md) {
		evservice.deleteevents(Eid);
		List<EventModel> eventlist = evservice.getevents();
		md.addAttribute("e",eventlist);
		return "Event";
	}
	@RequestMapping(value="/updateevent")
	public String updateevent(Model md,@RequestParam("Eid")Integer Eid,@RequestParam(value = "Name")String Name,@RequestParam(value="Date")String Date,@RequestParam(value = "Time")String Time) {
		List<EventModel> evlist = evservice.getevents();
		md.addAttribute("e",evlist);
		md.addAttribute("Eid",Eid);
		md.addAttribute("Name",Name);
		md.addAttribute("Date",Date);
		md.addAttribute("Time",Time);
		return "Updateevent";
	}
	@RequestMapping(value = "/finalupdateevent")
	public String getupdatedevent(HttpServletRequest req,Model md,EventModel evmd) {
		Integer Eid = Integer.parseInt(req.getParameter("Eid"));
		String Name = req.getParameter("Name");
		String date = req.getParameter("Date");
		String Time = req.getParameter("Time");
		evmd.setEid(Eid);
		evmd.setName(Name);
		evmd.setDate(date);
		evmd.setTime(Time);
		boolean b = evservice.isUpdateEvent(evmd);
		if(b) {
			List<EventModel> finallist = evservice.getevents();
			md.addAttribute("e", finallist);
		}
		return "Updateevent";
	}
}
