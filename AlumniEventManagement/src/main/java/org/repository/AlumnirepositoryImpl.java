package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.AlumniModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository("amrepo")
public class AlumnirepositoryImpl implements Alumnirepository{
	@Autowired
	JdbcTemplate template;
	public boolean isAlumniadded(AlumniModel amodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, amodel.getName());
				ps.setString(2, amodel.getEmail());
				ps.setString(3, amodel.getContact());
				ps.setInt(4, amodel.getAge());
				ps.setString(5, amodel.getCompany());
				ps.setString(6, amodel.getGender());
				ps.setInt(7, amodel.getDept_id());
				ps.setInt(8, amodel.getBid());
			}
		};
		int value = template.update("insert into Alumni values('0',?,?,?,?,?,?,?,?)",pstmt);
		return value>0?true:false;
	}
	public List<AlumniModel> getalumni(){
		RowMapper<AlumniModel> rmap = new RowMapper<AlumniModel>() {
			
			@Override
			public AlumniModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				AlumniModel amodel = new AlumniModel();
				amodel.setAid(rs.getInt(1));
				amodel.setName(rs.getString(2));
				amodel.setEmail(rs.getString(3));
				amodel.setContact(rs.getString(4));
				amodel.setAge(rs.getInt(5));
				amodel.setCompany(rs.getString(6));
				amodel.setGender(rs.getString(7));
				amodel.setDept_id(rs.getInt(8));
				amodel.setBid(rs.getInt(9));
				return amodel;
			}
		};
		List<AlumniModel> alumnilist = template.query("select *from Alumni", rmap);
		return alumnilist.size()>0?alumnilist:null;
	}
}
