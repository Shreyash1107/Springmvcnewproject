package org.controller;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.model.LoginModel;
import org.service.Adminservice;
import org.service.Alumniregisterservice;
import org.service.Dashboardservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String getAdminLogin(HttpServletRequest req,Model md,LoginModel model) {
	    String username = req.getParameter("Name");
	    String password = req.getParameter("pass");
	    List<LoginModel> list = adminservice.getadminlogin(username, password);
	    int departmentCount = dashservice.getdeptcount();
	    md.addAttribute("dash", departmentCount);
	    int alumniCount = dashservice.getalumnicount();
	    md.addAttribute("alumnicount", alumniCount);
	    int eventCount = dashservice.geteventcount();
	    md.addAttribute("eventcount", eventCount);
		/* System.out.println(departmentCount); */
	    if (!list.isEmpty()) {
	    	model = list.get(0);
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
	@RequestMapping(value="/logout")
	public String logout() {
		return "Adminlogin";
	}
	/*
	 * @RequestMapping("/logout") public String logout(HttpServletRequest request,
	 * HttpServletResponse response) { HttpSession session =
	 * request.getSession(false); if (session != null) { session.invalidate(); }
	 * response.addCookie(new Cookie("JSESSIONID", null)); return "Adminlogin"; }
	 */
}