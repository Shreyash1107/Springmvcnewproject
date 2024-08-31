package org.service;

import org.repository.Dashboardrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dashservice")
public class DashboardserviceImpl implements Dashboardservice{
	@Autowired
	Dashboardrepository dashrepo;
	public int getdeptcount() {
		return dashrepo.getdeptcount();
	}
}
