package org.service;

import java.util.List;

import org.model.EventModel;

public interface Eventservice {
	public boolean isEventAdded(EventModel emodel);
	public List<EventModel> getevents();
	public List<EventModel> getalumniwiselist(int id);
	public void deleteevents(Integer Eid);
	public boolean isUpdateEvent(EventModel emodel);
}
