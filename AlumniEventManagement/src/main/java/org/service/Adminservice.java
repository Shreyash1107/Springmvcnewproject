package org.service;

import java.util.List;

import org.model.LoginModel;

public interface Adminservice {
	public List<LoginModel> getadminlogin(String username,String Password);
}
