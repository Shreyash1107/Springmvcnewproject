package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.BatchModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository("batchrepo")
public class BatchrepositoryImpl implements Batchrepository{
	@Autowired
	JdbcTemplate template;
	public boolean isBatchAdded(BatchModel bmodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, bmodel.getBatch_year());
				ps.setInt(2, bmodel.getDept_id());
			}
		};
		int value = template.update("insert into Batch values('0',?,?)",pstmt);
		return value>0?true:false;
	}
	public List<BatchModel> getlist(){
		RowMapper<BatchModel> rmap = new RowMapper<BatchModel>() {
			
			@Override
			public BatchModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				BatchModel bmodel = new BatchModel();
				bmodel.setBid(rs.getInt(1));
				bmodel.setBatch_year(rs.getString(2));
				bmodel.setDept_id(rs.getInt(3));
				return bmodel;
			}
		};
		List<BatchModel> batches = template.query("select *from Batch", rmap);
		return batches.size()>0?batches:null;
	}
	public void deletebatch(int bid) {
		template.update("delete from Batch where Bid = ?", bid);
		}
	public boolean isBatchupdated(BatchModel bmodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, bmodel.getBatch_year());
				ps.setInt(2, bmodel.getDept_id());
				ps.setInt(3, bmodel.getBid());
			}
		};
		int value = template.update("update Batch set batch_year=?,dept_id=? where Bid = ?",pstmt);
		return value>0?true:false;
	}
}
