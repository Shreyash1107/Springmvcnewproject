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
	public boolean isEventAdded(EventModel emodel) {
		return evrepo.isEventAdded(emodel);
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
	public boolean isUpdateEvent(EventModel emodel) {
		return evrepo.isUpdateEvent(emodel);
	}
}
