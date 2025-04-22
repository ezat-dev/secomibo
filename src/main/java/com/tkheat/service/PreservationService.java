package com.tkheat.service;

import java.util.List;

import com.tkheat.domain.Bega;
import com.tkheat.domain.Jeomgeom;
import com.tkheat.domain.Measure;
import com.tkheat.domain.SparePart;
import com.tkheat.domain.Suri;

public interface PreservationService {
	
	List<SparePart> getSparePartList();
	
	List<Bega> getBegaInsertList(Bega bega);
	
	void begaInsertSave(Bega bega);
	
	List<Suri> getSuriHistoryList(Suri srui);
	
	List<Jeomgeom> getJeomgeomInsertList();
	
	void jeomgeomInsertSave(Jeomgeom jeomgeom);
	
	List<Measure> getGigiGojangList(Measure measure);
	
	void gigiGojangSave(Measure measure);
	
	List<Measure> getGigiJeomgeomList(Measure measure);

}
