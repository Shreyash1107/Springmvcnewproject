package org.repository;

import java.util.List;

import org.model.AlumniModel;
import org.model.DepartmentModel;

public interface Departmentrepository {
	public boolean isDepartmentAded(DepartmentModel dmodel);
	public List<DepartmentModel> getdept();
	public void isDepartmentdeleted(int dept_id);
	public boolean isupdateDepartment(DepartmentModel deptmodel);
	 public List<DepartmentModel> getdeptName(Integer Bid); 
	 public List<AlumniModel> getdeptNamealumni(Integer Aid);
}
