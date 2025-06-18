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
	public void begaUpdateSave(Bega bega) {
		preservationDao.begaUpdateSave(bega);
	}
	
	@Override
	public void begaDelete(int fstp_code) {
		preservationDao.begaDelete(fstp_code);
	}
	
	
	
	
	
	@Override
	public List<Suri> getSuriHistoryList(Suri suri){
		return preservationDao.getSuriHistoryList(suri);
	}
	
	@Override
	public void suriHistoryInsertSave(Suri suri) {
		preservationDao.suriHistoryInsertSave(suri);
	}
	
	@Override
	public void suriHistoryUpdateSave(Suri suri) {
		preservationDao.suriHistoryUpdateSave(suri);
	}
	
	@Override
	public void suriHistoryDelete(int ffx_no) {
		preservationDao.suriHistoryDelete(ffx_no);
	}
	
	
	
	
	@Override
	public List<Jeomgeom> getJeomgeomInsertList(){
		return preservationDao.getJeomgeomInsertList();
	}
	
	@Override
	public void jeomgeomInsertSave(Jeomgeom jeomgeom) {
		preservationDao.jeomgeomInsertSave(jeomgeom);
	}
	
	@Override
	public void jeomgeomUpdateSave(Jeomgeom jeomgeom) {
		preservationDao.jeomgeomUpdateSave(jeomgeom);
	}
	
	@Override
	public void jeomgeomDelete(int chs_code) {
		preservationDao.jeomgeomDelete(chs_code);
	}
	
	
	
	
	
	
	@Override
	public List<Measure> getGigiGojangList(Measure measure){
		return preservationDao.getGigiGojangList(measure);
	}
	
	@Override
	public void gigiGojangSave(Measure measure) {
		preservationDao.gigiGojangSave(measure);
	}
	
	
	
	
	
	
	
	@Override
	public List<Measure> getGigiJeomgeomList(Measure measure){
		return preservationDao.getGigiJeomgeomList(measure);
	}
	
	@Override
	public void gigiJeomgeomInsertSave(Measure measure) {
		preservationDao.gigiJeomgeomInsertSave(measure);
	}
	
	@Override
	public void gigiJeomgeomUpdateSave(Measure measure) {
		preservationDao.gigiJeomgeomUpdateSave(measure);
	}
	
	@Override
	public void gigiJeomgeomDelete(int ter_code) {
		preservationDao.gigiJeomgeomDelete(ter_code);
	}
	

}
