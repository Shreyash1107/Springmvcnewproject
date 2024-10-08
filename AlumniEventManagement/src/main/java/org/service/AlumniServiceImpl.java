package org.service;

import java.util.List;
import org.model.AlumniModel;
import org.repository.Alumnirepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("amservice")
public class AlumniServiceImpl implements Alumniservice {
    @Autowired
    Alumnirepository amrepo;

    @Override
    public boolean isAlumniadded(AlumniModel amodel) {
        return amrepo.isAlumniadded(amodel);
    }

    @Override
    public List<AlumniModel> getalumni() {
    	List<AlumniModel> amlist = amrepo.getalumni();
		/* System.out.println(amlist); */
        return amrepo.getalumni();
    }

    @Override
    public void deletealumni(Integer aid) {
        amrepo.deletealumni(aid);
    }

    @Override
    public List<AlumniModel> getdeptwiseAlumni(String deptname) {
        return amrepo.getdeptwiseAlumni(deptname);
    }

    @Override
    public List<AlumniModel> getalumnibatches(String batchyear) {
        return amrepo.getalumnibatches(batchyear);
    }

    @Override
    public boolean isUpdatealumni(AlumniModel amodel) {
        return amrepo.isUpdatealumni(amodel);
    }
    public boolean emailExists(String email) {
        return amrepo.emailExists(email);
    }

    public boolean contactExists(String contact) {
        return amrepo.contactExists(contact);
    }
}
