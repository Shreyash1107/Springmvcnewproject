package org.repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.model.LoginModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;
@Repository("alumnirepo")
public class AlumniregistrationrepoitoryImpl implements Alumniregisterrepository{
	@Autowired
	JdbcTemplate template;
	@Override
	public boolean isAlumniregister(LoginModel model) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, model.getUsername());
				ps.setString(2, model.getPassword());
				ps.setString(3, model.getEmail());
				ps.setString(4, model.getContact());
				ps.setString(5, model.getLogintype());
			}
		};
		int value = template.update("insert into Login values('0',?,?,?,?,?)",pstmt);
		return value>0?true:false;
	}
}