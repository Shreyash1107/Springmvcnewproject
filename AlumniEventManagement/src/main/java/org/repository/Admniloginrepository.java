package org.repository;

import java.util.List;

import org.model.LoginModel;

public interface Admniloginrepository {
		public List<LoginModel> getadminlogin(String username,String Password);
}
