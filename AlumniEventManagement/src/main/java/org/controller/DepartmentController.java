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

	@RequestMapping(value = "/department", method = RequestMethod.GET)
	public String getDepartmentPage(Map<String, Object> map) {
		List<DepartmentModel> deptlist = deptservice.getdept();
		map.put("deptlist", deptlist);
		return "Department";
	}

	@RequestMapping(value = "/department", method = RequestMethod.POST)
	public String saveDepartment(DepartmentModel deptmodel, Map<String, Object> map) {
		boolean b = deptservice.isDepartmentAded(deptmodel);
		if (b) {
			map.put("message", "Department has been successfully added.");
		} else {
			map.put("message", "Failed to add department.");
		}

		List<DepartmentModel> deptlist = deptservice.getdept();
		map.put("deptlist", deptlist);

		return "Department";
	}

	@RequestMapping(value = "/delete")
	public String deleteDepartment(@RequestParam("dept_id") Integer dept_id, Map<String, Object> map) {
		deptservice.isDepartmentdeleted(dept_id);
		List<DepartmentModel> deptlist = deptservice.getdept();
		map.put("deptlist", deptlist);
		return "Department";
	}

	@RequestMapping(value = "/update")
	public String updateDepartment(@RequestParam("dept_id") Integer deptid, @RequestParam("dept_name") String name,
			Map<String, Object> map) {
		List<DepartmentModel> deptlist = deptservice.getdept();
		if(deptlist!=null) {
			map.put("v", deptlist);
		}
		map.put("deptid", deptid);
		map.put("deptname", name);
		return "Updatedept"; 
	}

	@RequestMapping(value = "/finalupdate")
	public String getupdateddept(HttpServletRequest req, DepartmentModel dmodel, Map<String, Object> map) {
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		String dept_name = req.getParameter("dept_name");
		dmodel.setDept_id(dept_id);
		dmodel.setDept_name(dept_name);
		boolean b = deptservice.isupdateDepartment(dmodel);
		if (b) {
			List<DepartmentModel> list = deptservice.getdept();
			map.put("v", list);
		}
		return "Updatedept";
	}
}