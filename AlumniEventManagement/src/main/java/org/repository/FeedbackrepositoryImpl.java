package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.EventModel;
import org.model.FeedbackModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository("feedrepo")
public class FeedbackrepositoryImpl implements Feedbackrepository{
	@Autowired
	JdbcTemplate template;
	public boolean issubmitFeedback(FeedbackModel fmodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, fmodel.getSuggestions());
				ps.setInt(2, fmodel.getEmodel().getEid());
				ps.setString(3, fmodel.getName());
				ps.setInt(4, fmodel.getRatings());
			}
		};
		int value = template.update("insert into feedback values('0',?,?,?,?)",pstmt);
		return value>0?true:false;
	}
	public List<FeedbackModel> getfeedback(){
		RowMapper<FeedbackModel> rmapper = new RowMapper<FeedbackModel>() {
			
			@Override
			public FeedbackModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				FeedbackModel fmodel = new FeedbackModel();
				EventModel emodel = new EventModel();
				fmodel.setFid(rs.getInt(1));
				fmodel.setSuggestions(rs.getString(2));
				emodel.setName(rs.getString(3));
				fmodel.setEmodel(emodel);
				fmodel.setName(rs.getString(4));
				fmodel.setRatings(rs.getInt(5));
				return fmodel;
			}
		};
		List<FeedbackModel> feedbacklist = template.query("select F.Fid, F.suggestions,E.Name,F.Name,F.ratings from Feedback F inner join Events E on F.Eid=E.Eid", rmapper);
		return feedbacklist.size()>0?feedbacklist:null;
	}
}