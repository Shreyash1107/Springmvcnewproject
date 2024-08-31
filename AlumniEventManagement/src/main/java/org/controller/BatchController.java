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
    public String batchmodule(Map map,Model model) {
    	  List<BatchModel> updatedList = batchservice.getlist();
          System.out.println(updatedList);
          map.put("v", updatedList);
          List<DepartmentModel> deptlist = deptservice.getdept();
          model.addAttribute("d", deptlist);
        return "Batchmodule";
    }

    @RequestMapping(value = "/addbatch")
    public String showAddBatchPage(Model model) {
        return "Batchmodule";
    }

    @RequestMapping(value = "/batch")
    public String addBatch(BatchModel bmodel, HttpServletRequest request,Model model, Map<String, Object> map) {
        boolean isAdded;
      
        isAdded = batchservice.isBatchAdded(bmodel);
        String btch_year = request.getParameter("batch_year");
        int deptid = Integer.parseInt(request.getParameter("dept_id"));
        bmodel.setBatch_year(btch_year);
        bmodel.setDept_id(deptid);
        if (isAdded) {
            map.put("batch", "Batch Added Successfully");
        } else {
            map.put("batch", "Failed to Add Batch");
        }
        List<BatchModel> list = batchservice.getlist();
        if (list != null) {
            model.addAttribute("v", list);
        } else {
            model.addAttribute("v", "No batches available");
        }
        return "Batchmodule";
    }

    @RequestMapping(value = "/view")
    public String viewBatchModule(Model model) {
        List<BatchModel> list = batchservice.getlist();
        if (list != null) {
            model.addAttribute("v", list);
        } else {
            model.addAttribute("v", "No batches available");
        }
        return "Batchmodule";
    }

    @RequestMapping(value = "/remove")
    public String removeBatch(@RequestParam("bid") Integer bid, Map<String, Object> map) {
        batchservice.deletebatch(bid);
        List<BatchModel> updatedList = batchservice.getlist();
        if (updatedList != null) {
            map.put("v", updatedList);
        } else {
            map.put("v", "No batches available");
        }
        return "Batchmodule";
    }

    @RequestMapping(value = "/updatebatches")
    public String getUpdateBatch(@RequestParam("bid") Integer bid, @RequestParam("batch_year") Integer batch_year,
            @RequestParam("dept_id") Integer dept_id, Map<String, Object> map) {
        map.put("bid", bid);
        map.put("batch_year", batch_year);
        map.put("dept_id", dept_id);
        return "updatebatch";
    }

    @RequestMapping(value = "/finalupdatebatch")
    public String updateBatch(BatchModel bmodel, HttpServletRequest req, Map<String, Object> map) {
        int bid = Integer.parseInt(req.getParameter("bid"));
        String batch_year = req.getParameter("batch_year");
        int dept_id = Integer.parseInt(req.getParameter("dept_id"));
        bmodel.setBid(bid);
        bmodel.setBatch_year(batch_year);
        bmodel.setDept_id(dept_id);
        
        boolean isUpdated = batchservice.isBatchupdated(bmodel);
        if (isUpdated) {
            List<BatchModel> updatedList = batchservice.getlist();
            map.put("v", updatedList);
        } else {
            map.put("v", "Failed to Update Batch");
        }
        return "updatebatch";
    }
}