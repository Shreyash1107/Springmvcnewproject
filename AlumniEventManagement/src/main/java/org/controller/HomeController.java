package org.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.model.LoginModel;
import org.service.Adminservice;
import org.service.Alumniregisterservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Autowired
	Adminservice adminservice;
	@Autowired
	Alumniregisterservice alumniservice;
	@RequestMapping(value = "/")
	public String gethomeoage() {
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
	public String getAdminLogin(HttpServletRequest req, LoginModel lmodel) {
	    String username = req.getParameter("Name");
	    String password = req.getParameter("pass");
	    List<LoginModel> list = adminservice.getadminlogin(username, password);
	    if (!list.isEmpty()) {
	    	LoginModel model = list.get(0);
	        String logintype = model.getLogintype();
	        if ("Admin".equals(logintype)) {
	            return "Admindashboard";
	        } else {
	            
	            return "Alumnidashboard";
	        }
	    } else {
	        req.setAttribute("msg", "Invalid username or password.");
	    }
	    
	    return "Adminlogin";
	}
	@RequestMapping(value = "/alumniregister")
	public String registeralumni() {
		return "Alumniregister";
	}
	@RequestMapping(value="/success")
	public String getregistration(LoginModel lmd) {
		boolean b = alumniservice.isAlumniregister(lmd);
		if(b) {
			return "Adminlogin";
		}else {
			return "Alumniregister";
		}
	}
	@RequestMapping(value = "/logout")
	public String logout() {
		return "index";
	}
}
