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

    @Override
    public boolean isDepartmentAded(DepartmentModel dmodel) {
        String deptName = dmodel.getDept_name().trim().toUpperCase(); 
        int count = template.queryForObject(
            "SELECT COUNT(*) FROM department WHERE UPPER(TRIM(deptname)) = ?", 
            new Object[]{deptName}, 
            Integer.class
        );
        if (count > 0) {
            return false;
        }
        int val = template.update(
            "INSERT INTO department (dept_id, deptname) VALUES (0, ?)", 
            deptName
        );
        return val > 0; // Return true if insertion is successful
    }

    @Override
    public List<DepartmentModel> getdept() {
        return template.query(
            "SELECT * FROM department ORDER BY dept_id ASC", 
            new RowMapper<DepartmentModel>() {
                @Override
                public DepartmentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
                    DepartmentModel dmodel = new DepartmentModel();
                    dmodel.setDept_id(rs.getInt("dept_id"));
                    dmodel.setDept_name(rs.getString("deptname"));
                    return dmodel;
                }
            }
        );
    }

    @Override
    public void isDepartmentdeleted(int dept_id) {
        template.update("DELETE FROM department WHERE dept_id = ?", dept_id);
    }

    @Override
    public boolean isupdateDepartment(DepartmentModel deptmodel) {
        // Check for duplicate department names excluding the current department
        String deptName = deptmodel.getDept_name().trim().toUpperCase();
        int count = template.queryForObject(
            "SELECT COUNT(*) FROM department WHERE UPPER(TRIM(deptname)) = ? AND dept_id != ?", 
            new Object[]{deptName, deptmodel.getDept_id()}, 
            Integer.class
        );
        if (count > 0) {
            return false; // Department name already exists
        }

        int value = template.update(
            "UPDATE department SET deptname = ? WHERE dept_id = ?", 
            deptName, 
            deptmodel.getDept_id()
        );
        return value > 0; // Return true if update is successful
    }
}
