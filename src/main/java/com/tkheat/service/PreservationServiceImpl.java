package com.tkheat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.PreservationDao;
import com.tkheat.domain.Bega;
import com.tkheat.domain.Jeomgeom;
import com.tkheat.domain.Measure;
import com.tkheat.domain.SparePart;
import com.tkheat.domain.Suri;


@Service
public class PreservationServiceImpl implements PreservationService{
	
	@Autowired
	private PreservationDao preservationDao;
	
	@Override
	public List<SparePart> getSparePartList(){
		return preservationDao.getSparePartList();
	}
	
	@Override
	public List<Bega> getBegaInsertList(Bega bega){
		return preservationDao.getBegaInsertList(bega);
	}
	
	@Override
	public void begaInsertSave(Bega bega) {
		preservationDao.begaInsertSave(bega);
	}
	
	@Override
	public List<Suri> getSuriHistoryList(Suri suri){
		return preservationDao.getSuriHistoryList(suri);
	}
	
	@Override
	public List<Jeomgeom> getJeomgeomInsertList(){
		return preservationDao.getJeomgeomInsertList();
	}
	
	@Override
	public List<Measure> getGigiGojangList(Measure measure){
		return preservationDao.getGigiGojangList(measure);
	}
	

}
