package org.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.model.AlumniModel;
import org.model.BatchModel;
import org.model.DepartmentModel;
import org.model.EventModel;
import org.model.FeedbackModel;
import org.service.Alumniservice;
import org.service.Batchservice;
import org.service.DepartmentService;
import org.service.Eventservice;
import org.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AlumniController {
	@Autowired
	Alumniservice amservice;
	@Autowired
	Batchservice batchservice;
	@Autowired
	DepartmentService deptservice;
	@Autowired
	FeedbackService feedservice;
	@Autowired
	Eventservice evservice;
	@RequestMapping(value = "/alumni")
	public String getalumnimodel(Model md) {
		List<AlumniModel> alist = amservice.getalumni();
		md.addAttribute("al", alist);
		List<DepartmentModel> deptname = deptservice.getdept();
		md.addAttribute("dept", deptname);
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		return "Alumnimodule";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveAlumni(Model model, HttpServletRequest request,AlumniModel amodel) {
	    String name = request.getParameter("Name").toUpperCase();
	    String email = request.getParameter("Email").trim();
	    String contact = request.getParameter("Contact").trim();
	    Integer age = Integer.parseInt(request.getParameter("Age"));
	    String company = request.getParameter("Company");
	    String gender = request.getParameter("Gender");
	    Integer deptid = Integer.parseInt(request.getParameter("dept_id"));
	    Integer bid = Integer.parseInt(request.getParameter("Bid"));
	    List<DepartmentModel> deptname = deptservice.getdept();
	    model.addAttribute("dept", deptname);
	    List<BatchModel> batches = batchservice.getlist();
	    model.addAttribute("b", batches);
	    if (name == null || email == null || contact == null || age == null || company == null || gender == null || deptid == null || bid == null) {
	        model.addAttribute("error", "All fields are required.");
	    } else if (amservice.emailExists(email)) {
	        model.addAttribute("error", "Email already exists.");
	    } else if (amservice.contactExists(contact)) {
	        model.addAttribute("error", "Contact already exists.");
	    } else {
	        amodel.setName(name);
	        amodel.setEmail(email);
	        amodel.setContact(contact);
	        amodel.setAge(age);
	        amodel.setCompany(company);
	        amodel.setGender(gender);
	        amodel.setDept_id(deptid);
	        amodel.setBid(bid);
	        boolean success = amservice.isAlumniadded(amodel);
	        if (success) {
	            model.addAttribute("a", "Alumni Added Successfully.");
	        } else {
	            model.addAttribute("a", "Alumni Not Added Successfully.");
	        }
	    }
	    List<AlumniModel> alist = amservice.getalumni();
	    model.addAttribute("al", alist);
	    return "Alumnimodule";  
	}
	@RequestMapping(value = "/deptalumni")
	public String deptwisealumni(HttpServletRequest req, Model md) {
		List<DepartmentModel> deptname = deptservice.getdept();
		md.addAttribute("dept", deptname);
		return "deptalumni";
	}
	@RequestMapping(value = "/viewdeptalumni")
	public String getdeptalumni(@RequestParam("dept_name") String dept_name, Model md) {
		List<DepartmentModel> deptname = deptservice.getdept();
		md.addAttribute("dept", deptname);
		List<AlumniModel> amlist = amservice.getdeptwiseAlumni(dept_name);
		if (amlist != null) {
			md.addAttribute("amdept", amlist);
		}
		return "deptalumni";
	}
	@RequestMapping(value = "/batchalumni")
	public String getalumnibatch(Model md) {
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		return "Alumnibatch";
	}
	@RequestMapping(value = "/viewbatchalumni")
	public String getalumnibatchwise(@RequestParam("batch_year") String batch_year, Model md) {
		List<AlumniModel> alumnibatch = amservice.getalumnibatches(batch_year);
		if (alumnibatch != null) {
			md.addAttribute("c", alumnibatch);
		}
		return "Alumnibatch";
	}
	@RequestMapping(value = "/del")
	public String removealumni(@RequestParam("aid") Integer aid, Model md) {
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		List<DepartmentModel> deptname = deptservice.getdept();
		md.addAttribute("dept", deptname);
		amservice.deletealumni(aid);
		List<AlumniModel> amlist = amservice.getalumni();
		if (amlist != null) {
			md.addAttribute("al", amlist);
		}
		return "Alumnimodule";
	}
	@RequestMapping(value = "/updatealumni")
	public String updatealumni(@RequestParam("aid") Integer aid,
	                            @RequestParam("name") String name,
	                            @RequestParam("email") String email,
	                            @RequestParam("Contact") String contact,
	                            @RequestParam("Age") Integer age,
	                            @RequestParam("Company") String company,
	                            @RequestParam("Bid") Integer bid,
	                            @RequestParam("Gender") String gender,
	                            @RequestParam("dept_id") Integer deptId,
	                            Model md) {
	    List<AlumniModel> alumni = amservice.getalumni();
	    md.addAttribute("al", alumni);
	    List<DepartmentModel> deptlist = deptservice.getdept();
	    md.addAttribute("deptname", deptlist);
	    List<BatchModel> batches = batchservice.getlist();
	    md.addAttribute("b", batches);
	    md.addAttribute("aid", aid);
	    md.addAttribute("name", name);
	    md.addAttribute("email", email);
	    md.addAttribute("Contact", contact);
	    md.addAttribute("Age", age);
	    md.addAttribute("Company", company);
	    md.addAttribute("Bid", bid);
	    md.addAttribute("Gender", gender);
	    md.addAttribute("dept_id", deptId);
	    return "updatealumni";
	}
	@RequestMapping(value = "/finalupdatealumni")
	public String getupdatedalumni(Model md, AlumniModel amodel, HttpServletRequest req) {
	    List<DepartmentModel> deptlist = deptservice.getdept();
	    md.addAttribute("deptname", deptlist);
	    List<BatchModel> batches = batchservice.getlist();
	    md.addAttribute("b", batches);

	    String email = req.getParameter("Email").trim();
	    String contact = req.getParameter("Contact").trim();
	    if (amservice.emailExists(email)) {
	        md.addAttribute("error", "Email already exists.");
	        return "updatealumni";
	    }
	    else if (amservice.contactExists(contact)) {
	        md.addAttribute("error", "Contact already exists.");
	        return "updatealumni";
	    }
	    else {
	        boolean updateSuccess = amservice.isUpdatealumni(amodel);
	        if (updateSuccess) {
	            md.addAttribute("success", "Alumni updated successfully.");
	            List<AlumniModel> updatedList = amservice.getalumni();
	            md.addAttribute("al", updatedList);
	        } else {
	            md.addAttribute("error", "Alumni update failed.");
	        }
	        return "updatealumni";
	    }
	}


	@RequestMapping(value="/feedbackpage")
	public String getfeedback(Model md) {
		List<EventModel> events = evservice.getevents();
		md.addAttribute("ev", events);
		List<FeedbackModel> feedlist = feedservice.getfeedback();
		md.addAttribute("fdview", feedlist);
		return "Viewfeedback";
	}
}