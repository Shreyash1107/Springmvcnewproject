package org.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.model.BatchModel;
import org.model.DepartmentModel;
import org.service.Batchservice;
import org.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BatchController {
	@Autowired
	Batchservice batchservice;
	@Autowired
	DepartmentService deptservice;

	@RequestMapping(value = "/btchmodel")
	public String batchmodule() {
		return "Batchmodule";
	}

	@RequestMapping(value = "/addbatch")
	public String detchdeptid(Model model, BatchModel bmodel, Map<String, String> map, HttpServletRequest request) {
		List<DepartmentModel> deptlist = deptservice.getdept();
		model.addAttribute("d", deptlist);
		return "Addbatch";
	}

	@RequestMapping(value = "/batch")
	public String addbatches(BatchModel bmodel, HttpServletRequest request, Map<String, String> map) {
		boolean b;
		String btch_year = request.getParameter("batch_year");
		int deptid = Integer.parseInt(request.getParameter("dept_id"));
		bmodel.setBatch_year(btch_year);
		bmodel.setDept_id(deptid);
		b = batchservice.isBatchAdded(bmodel);
		if (b) {
			map.put("batch", "Batch Added Successsfully");
		}
		return "Addbatch";
	}

	@RequestMapping(value = "/view")
	public String viewmodule(Model md) {
		List<BatchModel> list = batchservice.getlist();
		if (list != null) {
			md.addAttribute("v", list);
			return "viewbatch";
		} else {
			return "Admindashboard";
		}
	}

	@RequestMapping(value = "/remove")
	public String removebatch(@RequestParam("bid") Integer bid, Model md) {
		batchservice.deletebatch(bid);
		List<BatchModel> updatedlist = batchservice.getlist();
		if (updatedlist != null) {
			md.addAttribute("v", updatedlist);
			return "viewbatch";
		} else {
			return "Admindashboard";
		}
	}

	@RequestMapping(value = "/updatebatches")
	public String getupdatedbatch(@RequestParam("bid") Integer bid, @RequestParam("batch_year") Integer batch_year,
			@RequestParam("dept_id") Integer dept_id, Map<String, Object> map) {
		map.put("bid", bid);
		map.put("batch_year", batch_year);
		map.put("dept_id", dept_id);
		return "updatebatch";
	}
	@RequestMapping(value = "/finalupdatebatch")
	public String getupdatedlist(BatchModel bmodel,Map<String, Object> map,HttpServletRequest req) {
		int bid = Integer.parseInt(req.getParameter("bid"));
		String batch_year = req.getParameter("batch_year");
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		bmodel.setBid(bid);
		bmodel.setBatch_year(batch_year);
		bmodel.setDept_id(dept_id);
		System.out.println(bmodel);
		boolean b = batchservice.isBatchupdated(bmodel);
		if(b) {
			List<BatchModel> updatedlist = batchservice.getlist();
			System.out.println(updatedlist);
			map.put("v",updatedlist);
		}
		return "viewbatch";
	}
}
