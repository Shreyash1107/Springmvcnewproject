package org.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.model.AlumniModel;
import org.model.BatchModel;
import org.model.DepartmentModel;
import org.service.Alumniservice;
import org.service.Batchservice;
import org.service.DepartmentService;
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

	@RequestMapping(value = "/save")
	public String saveAlumni(@RequestParam("Name") String name, @RequestParam("Email") String email,
			@RequestParam("Contact") String contact, @RequestParam("Age") Integer age,
			@RequestParam("Company") String company, @RequestParam("Gender") String Gender,
			@RequestParam("dept_id") Integer dept_id, @RequestParam("Bid") Integer Bid, Model md, AlumniModel amodel,
			HttpServletRequest req, DepartmentModel dmodel) {
		amodel.setName(name);
		amodel.setEmail(email);
		amodel.setContact(contact);
		amodel.setAge(age);
		amodel.setCompany(company);
		amodel.setGender(Gender);
		amodel.setDept_id(dept_id);
		amodel.setBid(Bid);
		boolean b = amservice.isAlumniadded(amodel);
		if (b) {
			md.addAttribute("a", "Alumni Added Successfully.");
		} else {
			md.addAttribute("a", "Alumni Not Added Successfully.");
		}
		List<DepartmentModel> deptname = deptservice.getdept();
		md.addAttribute("dept", deptname);
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		List<AlumniModel> alist = amservice.getalumni();
		if (alist != null) {
			md.addAttribute("al", alist);
		}
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
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		List<AlumniModel> alumnibatch = amservice.getalumnibatches(batch_year);
		if (alumnibatch != null) {
			md.addAttribute("c", alumnibatch);
		}
		return "Alumnibatch";
	}

	@RequestMapping(value = "/del")
	public String removealumni(@RequestParam("aid") Integer aid, Model md) {
		amservice.deletealumni(aid);
		List<AlumniModel> amlist = amservice.getalumni();
		if (amlist != null) {
			md.addAttribute("al", amlist);
		}
		return "Alumnimodule";
	}

	@RequestMapping(value = "/updatealumni")
	public String updatealumni(@RequestParam("aid") Integer aid, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("Contact") String contact,
			@RequestParam("Age") Integer Age, @RequestParam("Company") String company, @RequestParam("Bid") Integer Bid,
			@RequestParam("Gender") String Gender, @RequestParam("dept_id") Integer dept_id, Model md) {
		List<AlumniModel> alumni = amservice.getalumni();
		md.addAttribute("al", alumni);
		List<DepartmentModel> deptlist = deptservice.getdept();
		md.addAttribute("deptname", deptlist);
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		/* System.out.println(batches); */
		md.addAttribute("aid", aid);
		md.addAttribute("name", name);
		md.addAttribute("email", email);
		md.addAttribute("Contact", contact);
		md.addAttribute("Age", Age);
		md.addAttribute("Company", company);
		md.addAttribute("Bid", Bid);
		md.addAttribute("Gender", Gender);
		md.addAttribute("dept_id", dept_id);
		return "updatealumni";
	}

	@RequestMapping(value = "/finalupdatealumni")
	public String getupdatedalumni(Model md, AlumniModel amodel, HttpServletRequest req) {
		List<AlumniModel> alumni = amservice.getalumni();
		md.addAttribute("al", alumni);
		List<DepartmentModel> deptlist = deptservice.getdept();
		md.addAttribute("deptname", deptlist);
		List<BatchModel> batches = batchservice.getlist();
		md.addAttribute("b", batches);
		boolean b = amservice.isUpdatealumni(amodel);
		if(b) {
			List<AlumniModel> updatedlist	= amservice.getalumni();
			md.addAttribute("al", updatedlist);
			return "updatealumni";
		}
		Integer aid = Integer.parseInt(req.getParameter("Aid"));
		String name = req.getParameter("Name");
		String email = req.getParameter("Email");
		String Contact = req.getParameter("Contact");
		String company = req.getParameter("Company");
		Integer Age = Integer.parseInt(req.getParameter("Age"));
		Integer dept_id = Integer.parseInt(req.getParameter("dept_id"));
		Integer Bid = Integer.parseInt(req.getParameter("Bid"));
		amodel.setAid(aid);
		amodel.setName(name);
		amodel.setEmail(email);
		amodel.setContact(Contact);
		amodel.setCompany(company);
		amodel.setAge(Age);
		amodel.setDept_id(dept_id);
		amodel.setBid(Bid);
		return "updatealumni";
	}
}