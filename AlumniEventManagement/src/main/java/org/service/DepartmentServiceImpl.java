package org.service;

import java.util.List;

import org.model.DepartmentModel;
import org.repository.Departmentrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("deptservice")
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	Departmentrepository deptrepo;
	public boolean isDepartmentAded(DepartmentModel dmodel) {
		return deptrepo.isDepartmentAded(dmodel);
	}
	public List<DepartmentModel> getdept(){
		return deptrepo.getdept();
	}
	public void isDepartmentdeleted(int dept_id) {
		deptrepo.isDepartmentdeleted(dept_id);
	}
	public boolean isupdateDepartment(DepartmentModel deptmodel) {
		return deptrepo.isupdateDepartment(deptmodel);
	}
}
