package org.service;

import org.repository.Dashboardrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dashservice")
public class DashboardserviceImpl implements Dashboardservice {

    @Autowired
    private Dashboardrepository dashrepo;

    @Override
    public int getdeptcount() {
        return dashrepo.getdeptcount();
    }

    @Override
    public int getalumnicount() {
        return dashrepo.getalumnicount();
    }

    @Override
    public int geteventcount() {
        return dashrepo.geteventcount();
    }
}
