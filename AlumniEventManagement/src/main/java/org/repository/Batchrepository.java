package org.repository;

import java.util.List;
import org.model.BatchModel;

public interface Batchrepository {
    boolean isBatchYearExist(String batch_year);
    boolean isBatchAdded(BatchModel bmodel);
    List<BatchModel> getlist();
    void deletebatch(int bid);
    boolean isBatchUpdated(BatchModel bmodel);
}
