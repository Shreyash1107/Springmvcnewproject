package org.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.model.DepartmentModel;
import org.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentService deptservice;
	@RequestMapping(value = "/addview")
	public String getdeptmodeule() {
		return "Department";
	}
	@RequestMapping(value = "/adddept")
	public String adddept() {
		return "AddDepartment";
	}

	@RequestMapping(value = "/savedept")
	public String addepartment(DepartmentModel deptmodel, Map<String, Object> map) {
	    boolean b = deptservice.isDepartmentAded(deptmodel);
	    if (b) {
	        map.put("dept", "Department has been Successfully Added.......");
	        return "AddDepartment";
	    } else {
	        return "Admindashboard";
	    }
	}

	@RequestMapping(value = "/viewdept")
	public String viewdept(Map<String, List<DepartmentModel>> map) {
	    List<DepartmentModel> deptlist = deptservice.getdept();
	    if (deptlist != null) {
	        map.put("d", deptlist);
		    System.out.println(deptlist);
	        return "viewdepartment";
	    } else {
	        return "Admindashboard";
	    }
	}
	@RequestMapping(value = "/delete")
	public String deletrdeptid(@RequestParam("dept_id") Integer dept_id, Map<String, List<DepartmentModel>> map) {
		deptservice.isDepartmentdeleted(dept_id);
		List<DepartmentModel> list = deptservice.getdept();
		if (list != null) {
			map.put("d", list);
			return "viewdepartment";
		}else {
			return "Admindashboard";
		}
	}

	@RequestMapping(value = "/update")
	public String updatedept(@RequestParam("dept_id") Integer deptid, @RequestParam("dept_name") String name,
			Map<String, Object> map) {
		map.put("deptid", deptid);
		map.put("deptname", name);
		return "Updatedept";
	}

	@RequestMapping(value = "/finalupdate")
	public String getupdateddetails(DepartmentModel dmodel1, Map<String, Object> map,HttpServletRequest request) {
		int deptid = (Integer.parseInt(request.getParameter("dept_id")));
		String name = request.getParameter("dept_name");
		dmodel1.setDept_id(deptid);
		dmodel1.setDept_name(name);
		boolean b = deptservice.isupdateDepartment(dmodel1);
		if (b) {
			List<DepartmentModel> updatedlist = deptservice.getdept();
			map.put("d", updatedlist);
		}
		return "viewdepartment";
	}
}
