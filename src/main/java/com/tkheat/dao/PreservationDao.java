package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Bega;
import com.tkheat.domain.Jeomgeom;
import com.tkheat.domain.Measure;
import com.tkheat.domain.SparePart;
import com.tkheat.domain.Suri;



public interface PreservationDao {
	
	List<SparePart> getSparePartList();
	
	List<Bega> getBegaInsertList(Bega bega);
	
	void begaInsertSave(Bega bega);
	
	List<Suri> getSuriHistoryList(Suri srui);
	
	List<Jeomgeom> getJeomgeomInsertList();
	
	List<Measure> getGigiGojangList(Measure measure);
}
