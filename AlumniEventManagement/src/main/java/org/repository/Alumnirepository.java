package org.repository;

import java.util.List;

import org.model.AlumniModel;

public interface Alumnirepository {
	public boolean isAlumniadded(AlumniModel amodel);
	public List<AlumniModel> getalumni();
	public void deletealumni(Integer aid);
	public List<AlumniModel> getdeptwiseAlumni(String deptname);
	public List<AlumniModel> getalumnibatches(String batchyear);
	public boolean isUpdatealumni(AlumniModel amodel);
	public List<AlumniModel> searchAlumniByName(String name);
}
