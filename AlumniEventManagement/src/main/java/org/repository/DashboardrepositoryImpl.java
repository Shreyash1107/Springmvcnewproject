package org.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("dashrepo")
public class DashboardrepositoryImpl implements Dashboardrepository{
	@Autowired
	JdbcTemplate template;
	public int getdeptcount() {
		RowMapper<Integer> rmap = new  RowMapper<Integer>() {
			
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt(1);
			}
		};
		Integer count = template.queryForObject("select count(dept_id) from Department", rmap);
		return count;
	}
}