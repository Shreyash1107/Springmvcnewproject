package org.service;

import java.util.List;

import org.model.AlumniModel;

public interface Alumniservice {
	public boolean isAlumniadded(AlumniModel amodel);
	public List<AlumniModel> getalumni();
}
