package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.DepartmentModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("deptrepo")
public class DepartmentRespositoryImpl implements Departmentrepository {
	@Autowired
	JdbcTemplate template;

	public boolean isDepartmentAded(DepartmentModel dmodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dmodel.getDept_name());
			}
		};
		int val = template.update("insert into department values('0',?)", pstmt);
		return val > 0 ? true : false;
	}

	public List<DepartmentModel> getdept() {
		RowMapper<DepartmentModel> rmap = new RowMapper<DepartmentModel>() {
			@Override
			public DepartmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				DepartmentModel dmodel = new DepartmentModel();
				dmodel.setDept_id(rs.getInt(1));
				dmodel.setDept_name(rs.getString(2));
				return dmodel;
			}
		};
		List<DepartmentModel> deptlist = template.query("select *from Department order by dept_id asc", rmap);
		return deptlist.size() > 0 ? deptlist : null;
	}

	public void isDepartmentdeleted(int dept_id) {
		template.update("delete from Department where dept_id = ?", dept_id);
	}

	public boolean isupdateDepartment(DepartmentModel deptmodel) {
		int value = template.update("update Department set Name=? where  dept_id=?", new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, deptmodel.getDept_name());
				ps.setInt(2, deptmodel.getDept_id());
			}
		});
		if (value > 0) {
			return true;
		} else {
			return false;
		}
	}
}
