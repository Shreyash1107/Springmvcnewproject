package org.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.model.AlumniModel;
import org.model.LoginModel;
import org.service.Adminservice;
import org.service.Alumniregisterservice;
import org.service.Dashboardservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	Adminservice adminservice;
	@Autowired
	Alumniregisterservice alumniservice;
	@Autowired
	Dashboardservice dashservice;

	@RequestMapping(value = "/")
	public String gethomepage() {
		return "index";
	}

	@RequestMapping(value = "/admin")
	public String getadmin() {
		return "Adminlogin";
	}

	@RequestMapping(value = "/redirect")
	public String getlogin() {
		return "Adminlogin";
	}

	@RequestMapping(value = "/adminlogin")
	public String getAdminLogin(HttpServletRequest req, Model md, LoginModel model) {
	    String username = req.getParameter("Name");
	    String password = req.getParameter("pass");
	    List<LoginModel> list = adminservice.getadminlogin(username, password);
	    int departmentCount = dashservice.getdeptcount();
	    md.addAttribute("dash", departmentCount);
	    int alumniCount = dashservice.getalumnicount();
	    md.addAttribute("alumnicount", alumniCount);
	    int eventCount = dashservice.geteventcount();
	    md.addAttribute("eventcount", eventCount);
	    if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
	        md.addAttribute("msg", "Username and Password can't be empty");
	        return "Adminlogin";
	    }

	    if (list != null && !list.isEmpty()) {
	        model = list.get(0);
	        String logintype = model.getLogintype();
	        if ("Admin".equals(logintype)) {
	            return "Admindashboard";
	        } else {
	            return "Alumnidashboard";
	        }
	    } else {
	        md.addAttribute("msg", "Invalid Username or Password");
	        return "Adminlogin";
	    }
	}

	/*
	 * @RequestMapping(value = "/adminlogin", method = RequestMethod.GET) public
	 * ModelAndView getAdminLogin(HttpServletRequest req,
	 * 
	 * @SessionAttribute(value = "uModel", required = false) LoginModel uModel,
	 * AlumniModel amodel) { String username = req.getParameter("Name"); String
	 * password = req.getParameter("pass"); String logintype =
	 * uModel.getLogintype(); ModelAndView mv = new ModelAndView(); if (username ==
	 * null || password == null || username.isEmpty() || password.isEmpty()) {
	 * mv.setViewName("Adminlogin"); mv.addObject("msg",
	 * "Username or password cannot be empty."); return mv; } List<LoginModel> list
	 * = adminservice.getadminlogin(username, password); if (list == null ||
	 * list.isEmpty()) { mv.setViewName("Adminlogin"); mv.addObject("msg",
	 * "Invalid username or password."); return mv; } LoginModel lm = list.get(0);
	 * // Assume first item mv.addObject("uModel", lm); // Adds to session
	 * automatically due to @SessionAttribute mv.setViewName("Admindashboard");
	 * 
	 * 
	 * 
	 * if ("Admin".equals(logintype)) { mv.setViewName("Admindashboard"); return mv;
	 * } else { mv.setViewName("Alumnidashboard"); return mv; }
	 * 
	 * // Check if username or password is empty
	 * 
	 * 
	 * 
	 * // Validate login credentials
	 * 
	 * 
	 * // Set session attribute if login is successful
	 * 
	 * }
	 * 
	 * // LoginModel model = list.get(0); // String logintype =
	 * model.getLogintype(); // int departmentCount = dashservice.getdeptcount(); //
	 * md.addAttribute("dash", departmentCount); // int alumniCount =
	 * dashservice.getalumnicount(); // md.addAttribute("alumnicount", alumniCount);
	 * // int eventCount = dashservice.geteventcount(); //
	 * md.addAttribute("eventcount", eventCount); //
	 * session.setAttribute("alumniId",model.getUserid()); //
	 * session.setAttribute("logintype", logintype); // if
	 * ("Admin".equals(logintype)) { // return "Admindashboard"; // } else { //
	 * return "Alumnidashboard"; // }
	 */
	@RequestMapping(value = "/alumniregister")
	public String registeralumni() {
		return "Alumniregister";
	}

	@RequestMapping(value = "/success")
	public String getregistration(LoginModel lmd) {
		boolean b = alumniservice.isAlumniregister(lmd);
		if (b) {
			return "Adminlogin";
		} else {
			return "Alumniregister";
		}
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Adminlogin";
	}
}