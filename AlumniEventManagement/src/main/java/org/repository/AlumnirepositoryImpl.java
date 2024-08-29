package org.repository;

import org.model.AlumniModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
@Repository("amrepo")
public class AlumnirepositoryImpl implements Alumnirepository{
	@Autowired
	JdbcTemplate template;
	public boolean isAlumniadded(AlumniModel amodel) {
		return false;
	}
}
