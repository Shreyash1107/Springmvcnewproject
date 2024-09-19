/*
 * package org.controller;
 * 
 * import org.service.Dashboardservice; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * @Controller public class DashboardController {
 * 
 * @Autowired private Dashboardservice dashservice;
 * 
 * @RequestMapping("/adminDashboard") public String showAdminDashboard(Model
 * model) { int departmentCount = dashservice.getdeptcount(); int alumniCount =
 * dashservice.getalumnicount(); int eventCount = dashservice.geteventcount();
 * model.addAttribute("deptcount", departmentCount);
 * model.addAttribute("alumnicount", alumniCount);
 * model.addAttribute("eventcount", eventCount); return "Admindashboard"; } }
 */