package org.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("dashrepo")
public class DashboardrepositoryImpl implements Dashboardrepository {

    @Autowired
    private JdbcTemplate template;

    @Override
    public int getdeptcount() {
        return template.queryForObject("SELECT COUNT(dept_id) FROM Department", Integer.class);
    }

    public int getalumnicount() {
        return template.queryForObject("SELECT COUNT(Aid) FROM Alumni", Integer.class);
    }

    @Override
    public int geteventcount() {
        return template.queryForObject("SELECT COUNT(Eid) FROM Events", Integer.class);
    }
}
