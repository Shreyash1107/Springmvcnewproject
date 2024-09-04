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
	public void deletealumni(Integer aid) {
		amrepo.deletealumni(aid);
	}
	public List<AlumniModel> getdeptwiseAlumni(String deptname){
		List<AlumniModel> deptalumni = amrepo.getdeptwiseAlumni(deptname);
		return amrepo.getdeptwiseAlumni(deptname);
	}
	public List<AlumniModel> getalumnibatches(String batchyear){
		return amrepo.getalumnibatches(batchyear);
	}
	public boolean isUpdatealumni(AlumniModel amodel) {
		return amrepo.isUpdatealumni(amodel);
	}
	public List<AlumniModel> searchAlumniByName(String name){
		return amrepo.searchAlumniByName(name);
	}
}
