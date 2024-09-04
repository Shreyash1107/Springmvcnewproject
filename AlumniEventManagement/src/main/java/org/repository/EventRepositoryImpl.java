package org.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.model.AlumniModel;
import org.model.EventModel;
import org.model.Eventreistermodel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("evrepo")
public class EventRepositoryImpl implements Eventrepository {
	@Autowired
	JdbcTemplate template;

	public boolean isEventAdded(EventModel emodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, emodel.getName());
				ps.setString(2, emodel.getDate());
				ps.setString(3, emodel.getTime());
			}
		};
		int value = template.update("insert into Events values('0',?,?,?)", pstmt);
		return value > 0 ? true : false;
	}

	public List<EventModel> getevents() {
		RowMapper<EventModel> rmap = new RowMapper<EventModel>() {

			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel emodel = new EventModel();
				emodel.setEid(rs.getInt(1));
				emodel.setName(rs.getString(2));
				emodel.setDate(rs.getString(3));
				emodel.setTime(rs.getString(4));
				return emodel;
			}
		};
		List<EventModel> evlist = template.query("select *from Events", rmap);
		return evlist.size() > 0 ? evlist : null;
	}

	public List<EventModel> getalumniwiselist(int id) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, id);
			}
		};
		RowMapper<EventModel> rmapper = new RowMapper<EventModel>() {
			@Override
			public EventModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				EventModel emodel = new EventModel();
				AlumniModel amodel = new AlumniModel();
				emodel.setEid(rs.getInt("Eid"));
				emodel.setName(rs.getString("event_name"));
				amodel.setName(rs.getString("alumni_name"));
				emodel.setAmodel(amodel);
				return emodel;
			}
		};
		List<EventModel> evlist = template.query("SELECT e.Eid, e.Name as event_name, am.amname as alumni_name "
				+ "FROM Alumni am " + "INNER JOIN Eventregister evreg ON am.Aid = evreg.Aid "
				+ "INNER JOIN Events e ON evreg.Eid = e.Eid " + "WHERE am.Aid = ?", pstmt, rmapper);
		return evlist.size() > 0 ? evlist : null;
	}
	public void deleteevents(Integer Eid) {
		template.update("delete from Events where Eid=?",Eid);
	}
	public boolean isUpdateEvent(EventModel emodel) {
		PreparedStatementSetter pstmt = new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, emodel.getName());
				ps.setString(2, emodel.getDate());
				ps.setString(3, emodel.getTime());
				ps.setInt(4, emodel.getEid());
			}
		};
		int value = template.update("update Events set Name=?,Date=?,Time=? where Eid=?",pstmt);
		return value>0?true:false;
	}
}
