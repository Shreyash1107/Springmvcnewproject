package org.repository;

import java.util.List;

import org.model.AlumniModel;

public interface Alumnirepository {
    boolean isAlumniadded(AlumniModel amodel);
    List<AlumniModel> getalumni();
    void deletealumni(Integer aid);
    List<AlumniModel> getdeptwiseAlumni(String deptname);
    List<AlumniModel> getalumnibatches(String batchyear);
    boolean isUpdatealumni(AlumniModel amodel);
    
    // New methods for checking duplicates
    boolean emailExists(String email);
    boolean contactExists(String contact);
}

