package org.repository;

import java.util.List;

import org.model.AlumniModel;

public interface Alumnirepository {
	public boolean isAlumniadded(AlumniModel amodel);
	public List<AlumniModel> getalumni();
}
