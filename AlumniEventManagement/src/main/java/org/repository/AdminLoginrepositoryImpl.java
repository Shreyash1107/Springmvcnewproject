package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.LoginModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("adminloginrepo")
public class AdminLoginrepositoryImpl implements Admniloginrepository {
		@Autowired
		JdbcTemplate template;
		public List<LoginModel> getadminlogin(String username,String password){
			PreparedStatementSetter pstmt = new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, username);
					ps.setString(2, password);
				}
			};
			RowMapper<LoginModel> rmap = new RowMapper<LoginModel>() {
				
				@Override
				public LoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
					LoginModel lmd = new LoginModel();
					lmd.setUserid(rs.getInt(1));
					lmd.setUsername(rs.getString(2));
					lmd.setPassword(rs.getString(3));
					lmd.setEmail(rs.getString(4));
					lmd.setContact(rs.getString(5));
					lmd.setLogintype(rs.getString(6));
					return lmd;
				}
			};
			List<LoginModel> admin = template.query("select *from Login where username = ? and Password = ?",pstmt,rmap);
			return admin.size()>0?admin:null;
		}
}
