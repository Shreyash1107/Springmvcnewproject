package org.service;

import org.model.LoginModel;
import org.repository.Alumniregisterrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("alumniservice")
public class AlumniregisterserviceImpl implements Alumniregisterservice{
	@Autowired
	Alumniregisterrepository alumnirepo;
	public boolean isAlumniregister(LoginModel model) {
		return alumnirepo.isAlumniregister(model);
	}
}
