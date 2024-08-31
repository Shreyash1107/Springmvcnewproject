package org.service;

import java.util.List;

import org.model.AlumniModel;
import org.repository.Alumnirepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("amservice")
public class AlumniServiceImpl implements Alumniservice{
	@Autowired
	Alumnirepository amrepo;
	public boolean isAlumniadded(AlumniModel amodel) {
		return amrepo.isAlumniadded(amodel);
	}
	public List<AlumniModel> getalumni(){
		return amrepo.getalumni();
	}
}
