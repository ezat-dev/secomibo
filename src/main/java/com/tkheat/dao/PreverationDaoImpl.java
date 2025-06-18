package com.tkheat.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Bega;
import com.tkheat.domain.Jeomgeom;
import com.tkheat.domain.Measure;
import com.tkheat.domain.SparePart;
import com.tkheat.domain.Suri;
@Repository
public class PreverationDaoImpl implements PreservationDao {
	 @Autowired
	 private SqlSession sqlSession;

	@Override
	 public List<SparePart> getSparePartList() {
		 return sqlSession.selectList("sparePart.getSparePartList");
	 }
	
	
	
	
	
	
	@Override
	 public List<Bega> getBegaInsertList(Bega bega) {
		 return sqlSession.selectList("bega.getBegaInsertList", bega);
	 }
	
	@Override
	 public void begaInsertSave(Bega bega) {
		 sqlSession.insert("bega.begaInsertSave", bega);
	 }
	
	@Override
	 public void begaUpdateSave(Bega bega) {
		 sqlSession.update("bega.begaUpdateSave", bega);
	 }
	
	@Override
	 public void begaDelete(int fstp_code) {
		 sqlSession.delete("bega.begaDelete", fstp_code);
	 }
	
	
	
	
	
	@Override
	 public List<Suri> getSuriHistoryList(Suri suri) {
		 return sqlSession.selectList("suri.getSuriHistoryList", suri);
	 }
	
	@Override
	 public void suriHistoryInsertSave(Suri suri) {
		 sqlSession.insert("suri.suriHistoryInsertSave", suri);
	 }
	
	@Override
	 public void suriHistoryUpdateSave(Suri suri) {
		 sqlSession.update("suri.suriHistoryUpdateSave", suri);
	 }
	
	@Override
	 public void suriHistoryDelete(int ffx_no) {
		 sqlSession.delete("suri.suriHistoryDelete", ffx_no);
	 }
	
	
	
	
	
	
	
	@Override
	 public List<Jeomgeom> getJeomgeomInsertList() {
		 return sqlSession.selectList("jeomgeom.getJeomgeomInsertList");
	 }
	
	@Override
	 public void jeomgeomInsertSave(Jeomgeom jeomgeom) {
		 sqlSession.insert("jeomgeom.jeomgeomInsertSave", jeomgeom);
	 }
	
	@Override
	 public void jeomgeomUpdateSave(Jeomgeom jeomgeom) {
		 sqlSession.update("jeomgeom.jeomgeomUpdateSave", jeomgeom);
	 }
	
	@Override
	 public void jeomgeomDelete(int chs_code) {
		 sqlSession.delete("jeomgeom.jeomgeomDelete", chs_code);
	 }
	
	
	
	
	
	
	@Override
	 public List<Measure> getGigiGojangList(Measure measure) {
		 return sqlSession.selectList("measure.getGigiGojangList", measure);
	 }
	
	@Override
	 public void gigiGojangSave(Measure measure) {
		 sqlSession.insert("measure.gigiGojangSave", measure);
	 }
	
	
	
	
	
	
	@Override
	 public List<Measure> getGigiJeomgeomList(Measure measure) {
		 return sqlSession.selectList("measure.getGigiJeomgeomList", measure);
	 }
	
	@Override
	 public void gigiJeomgeomInsertSave(Measure measure) {
		 sqlSession.insert("measure.gigiJeomgeomInsertSave", measure);
	 }
	
	@Override
	 public void gigiJeomgeomUpdateSave(Measure measure) {
		 sqlSession.update("measure.gigiJeomgeomUpdateSave", measure);
	 }
	
	@Override
	 public void gigiJeomgeomDelete(int ter_code) {
		 sqlSession.delete("measure.gigiJeomgeomDelete", ter_code);
	 }
	
	
}

