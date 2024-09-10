package org.service;

import java.util.List;

import org.model.BatchModel;
import org.repository.Batchrepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("batchservice")
public class BatchServiceImpl implements Batchservice {
	@Autowired
	Batchrepository batchrepo;
	public boolean isBatchAdded(BatchModel bmodel) {
		return batchrepo.isBatchAdded(bmodel);
	}
	 public boolean isBatchYearExist(String batch_year) {
		 return batchrepo.isBatchYearExist(batch_year);
	 }
	public List<BatchModel> getlist(){
		return batchrepo.getlist();
	}
	public void deletebatch(int bid) {
		batchrepo.deletebatch(bid);
	}
	public boolean isBatchupdated(BatchModel bmodel) {
		return batchrepo.isBatchUpdated(bmodel);
	}
}
