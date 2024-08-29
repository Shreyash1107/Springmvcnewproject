package org.controller;

import org.service.Alumniservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlumniController {
	@Autowired
	Alumniservice amservice;
	@RequestMapping(value = "/alumni")
	public String getalumnimodel() {
		return "Alumnimodule";
	}
}
