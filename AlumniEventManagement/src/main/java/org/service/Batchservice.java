package org.service;

import java.util.List;

import org.model.BatchModel;

public interface Batchservice {
	public boolean isBatchAdded(BatchModel bmodel);
	public List<BatchModel> getlist();
	public void deletebatch(int bid);
	public boolean isBatchupdated(BatchModel bmodel);
}
