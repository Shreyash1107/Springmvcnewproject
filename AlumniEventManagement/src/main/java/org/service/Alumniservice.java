package org.service;

import java.util.List;
import org.model.AlumniModel;

public interface Alumniservice {
    public boolean isAlumniadded(AlumniModel amodel);
    public List<AlumniModel> getalumni();
    public void deletealumni(Integer aid);
    public List<AlumniModel> getdeptwiseAlumni(String deptname);
    public List<AlumniModel> getalumnibatches(String batchyear);
    public boolean isUpdatealumni(AlumniModel amodel);
    boolean emailExists(String email);
    boolean contactExists(String contact);
}
