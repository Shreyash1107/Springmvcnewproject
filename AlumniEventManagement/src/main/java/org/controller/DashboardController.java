package org.controller;

import org.service.Dashboardservice;
import org.service.Dashboardservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @Autowired
    private Dashboardservice dashservice;

    @GetMapping("/departmentCount")
    public String getDepartmentCount(Model model) {
        // Fetch the department count from the service
        int departmentCount = dashservice.getdeptcount();
        model.addAttribute("deptcount", departmentCount);
        return "Admindashboard"; // JSP page name
    }
}
