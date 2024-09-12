package org.service;

import java.util.List;

import org.model.EventModel;
import org.repository.Eventrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("evservice")
public class EventServiceImpl implements Eventservice{
	@Autowired
	Eventrepository evrepo;
	public boolean isEventAded(EventModel emodel) {
		return evrepo.isEventAded(emodel);
	}
	public List<EventModel> getevents(){
		return evrepo.getevents();
	}
	public List<EventModel> getalumniwiselist(int id){
		return evrepo.getalumniwiselist(id);
	}
	public void deleteevents(Integer Eid) {
		evrepo.deleteevents(Eid);
	}
	public boolean isupdateEvent(EventModel emodel) {
		return evrepo.isupdateEvent(emodel);
	}
	public boolean isEventexists(String evname) {
		return evrepo.isEventexists(evname);
	}
}
