package org.service;

import java.util.List;

import org.model.LoginModel;
import org.repository.AdminLoginrepositoryImpl;
import org.repository.Admniloginrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminservice")
public class AdminServiceImpl implements Adminservice{
	@Autowired
	Admniloginrepository adminloginrepo;
	public List<LoginModel> getadminlogin(String username,String Password){
		return adminloginrepo.getadminlogin(username,Password);
	}
}
