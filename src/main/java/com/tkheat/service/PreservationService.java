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
	
	void begaUpdateSave(Bega bega);
	
	void begaDelete(int fstp_code);
	
	
	
	
	
	List<Suri> getSuriHistoryList(Suri srui);
	
	void suriHistoryInsertSave(Suri srui);
	
	void suriHistoryUpdateSave(Suri srui);
	
	void suriHistoryDelete(int ffx_no);
	
	
	
	
	
	List<Jeomgeom> getJeomgeomInsertList();
	
	void jeomgeomInsertSave(Jeomgeom jeomgeom);
	
	void jeomgeomUpdateSave(Jeomgeom jeomgeom);
	
	void jeomgeomDelete(int chs_code);
	
	
	
	
	List<Measure> getGigiGojangList(Measure measure);
	
	void gigiGojangSave(Measure measure);
	
	
	
	
	List<Measure> getGigiJeomgeomList(Measure measure);
	
	void gigiJeomgeomInsertSave(Measure measure);
	
	void gigiJeomgeomUpdateSave(Measure measure);
	
	void gigiJeomgeomDelete(int ter_code);

}
