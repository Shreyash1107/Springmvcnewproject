package org.repository;

import java.util.List;

import org.model.BatchModel;

public interface Batchrepository {
	public boolean isBatchAdded(BatchModel bmodel);
	public List<BatchModel> getlist();
	public void deletebatch(int bid);
	public boolean isBatchupdated(BatchModel bmodel);
}
