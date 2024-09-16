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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BatchController {

	@Autowired
	Batchservice batchservice;

	@Autowired
	DepartmentService deptservice;

	@RequestMapping(value = "/btchmodel")
	public String batchmodule(Map<String, Object> map, Model model) {
		List<BatchModel> updatedList = batchservice.getlist();
		map.put("viewbtch", updatedList);
		List<DepartmentModel> deptlist = deptservice.getdept();
		model.addAttribute("d", deptlist);
		return "Batchmodule";
	}

	@RequestMapping(value = "/addbatch")
	public String showAddBatchPage(Model model) {
		return "Batchmodule";
	}

	@RequestMapping(value = "/batch", method = RequestMethod.GET)
	public String addBatch(BatchModel bmodel, HttpServletRequest request, Model model, Map<String, Object> map) {
		String batchYear = request.getParameter("batch_year").trim();
		int deptId = Integer.parseInt(request.getParameter("dept_id"));
		bmodel.setBatch_year(batchYear);
		bmodel.setDept_id(deptId);
		if (batchservice.isBatchAdded(bmodel)) {
			map.put("message", "Batch added successfully.");
		} else {
			map.put("message", "Failed to add batch because the batch year already exists.");
		}
		List<BatchModel> batchList = batchservice.getlist();
		List<DepartmentModel> deptList = deptservice.getdept();
		model.addAttribute("viewbtch", batchList);
		model.addAttribute("d", deptList);
		return "Batchmodule";
	}

	@RequestMapping(value = "/view")
	public String viewBatchModule(Model model) {
		List<BatchModel> list = batchservice.getlist();
		System.out.println(list);
		if (list != null) {
			model.addAttribute("viewbtch", list);
		} else {
			model.addAttribute("v", "No batches available");
		}
		return "Batchmodule";
	}

	@RequestMapping(value = "/remove")
	public String removeBatch(@RequestParam("bid") Integer bid, Model model) {
		batchservice.deletebatch(bid);
		List<DepartmentModel> deptlist = deptservice.getdept();
	
		model.addAttribute("d", deptlist);
		List<BatchModel> updatedList = batchservice.getlist();
		if (updatedList != null && !updatedList.isEmpty()) {
			model.addAttribute("viewbtch", updatedList);
		} else {
			model.addAttribute("message", "No batches available");
		}
		return "Batchmodule";
	}

	@RequestMapping(value = "/updatebatches", method = RequestMethod.GET)
    public String getUpdateBatch(@RequestParam("bid") Integer bid, @RequestParam("batch_year") Integer batch_year,
            @RequestParam("dept_id") String dept_id, Map<String, Object> map) {
		List<DepartmentModel> list = deptservice.getdept();
		map.put("dl", list);
        List<DepartmentModel> deptlist = deptservice.getdeptName(bid);
        if (deptlist != null) {
            map.put("d", deptlist);
        }
        List<BatchModel> batchlist = batchservice.getlist();
        if (batchlist != null) {
            map.put("viewbtch", batchlist);
        }
        map.put("bid", bid);
        map.put("batch_year", batch_year);
        map.put("dept_id", dept_id);
        map.put("showTable", false);
        return "updatebatch";
    }

	@RequestMapping(value = "/finalupdatebatches")
	public String updateBatch(BatchModel bmodel, HttpServletRequest req, Map<String, Object> map) {
		int bid = Integer.parseInt(req.getParameter("bid"));
		String batch_year = req.getParameter("batch_year");
		int dept_id = Integer.parseInt(req.getParameter("id")); 
		if (batchservice.isBatchYearExist(batch_year)) {
			map.put("message", "Failed to Update Batch. The Passout year already exists.");
			map.put("showTable", false);
			return "updatebatch";
		}
		bmodel.setBid(bid);
		bmodel.setBatch_year(batch_year);
		bmodel.setDept_id(dept_id);
		if (batchservice.isBatchupdated(bmodel)) {
			List<BatchModel> updatedList = batchservice.getlist();
			map.put("v", updatedList);
			System.out.println("*****************" + updatedList);
			map.put("message", "Batch updated successfully.");
			map.put("showTable", true);
		} else {
			map.put("message", "Failed to Update Batch.");
			map.put("showTable", false);
		}
		return "updatebatch";
	}
}