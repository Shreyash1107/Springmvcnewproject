package org.controller;

import java.util.List;
import java.util.Map;



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

	/*
	 * @RequestMapping(value = "/alumniop" ,method = RequestMethod.GET) public
	 * String addadlumni(AlumniModel amodel, Model md, HttpServletRequest req) {
	 * String name = req.getParameter("Name"); String email =
	 * req.getParameter("Email"); String contact = req.getParameter("Contact"); int
	 * Age = Integer.parseInt(req.getParameter("Age")); String company =
	 * req.getParameter("Company"); String gender = req.getParameter("Gender"); int
	 * dept_id = Integer.parseInt(req.getParameter("dept_id")); int bid =
	 * Integer.parseInt(req.getParameter("bid")); amodel.setName(name);
	 * amodel.setEmail(email); amodel.setContact(contact); amodel.setAge(Age);
	 * amodel.setCompany(company); amodel.setGender(gender);
	 * amodel.setDept_id(dept_id); amodel.setBid(bid); boolean b =
	 * amservice.isAlumniadded(amodel); if (b) { md.addAttribute("a",
	 * "Alumni Added Successfully........."); } else { md.addAttribute("a",
	 * "Alumni Not Added Successfully........."); } return "Alumnimodule"; }
	 */

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveAlumni(
	        @RequestParam("Name") String name,
	        @RequestParam("Email") String email,
	        @RequestParam("Contact") String contact,
	        @RequestParam("Age") Integer age,
	        @RequestParam("Company") String company,
	        @RequestParam("Gender") String gender,
	        @RequestParam("dept_id") Integer dept_id,
	        @RequestParam("Bid") Integer Bid,
	        Model md,AlumniModel amodel) {	   
	    amodel.setName(name);
	    amodel.setEmail(email);
	    amodel.setContact(contact);
	    amodel.setAge(age);
	    amodel.setCompany(company);
	    amodel.setGender(gender);
	    amodel.setDept_id(dept_id);
	    amodel.setBid(Bid);
	    boolean b = amservice.isAlumniadded(amodel);
	    if (b) {
	        md.addAttribute("a", "Alumni Added Successfully.");
	    } else {
	        md.addAttribute("a", "Alumni Not Added Successfully.");
	    }
	    List<AlumniModel> alist = amservice.getalumni();
	    if(alist!=null) {
	    	md.addAttribute("al", alist);
	    }
	    return "Alumnimodule";
	}
}