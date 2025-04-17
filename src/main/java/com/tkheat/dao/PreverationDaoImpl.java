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
	 public List<Suri> getSuriHistoryList(Suri suri) {
		 return sqlSession.selectList("suri.getSuriHistoryList", suri);
	 }
	
	@Override
	 public List<Jeomgeom> getJeomgeomInsertList() {
		 return sqlSession.selectList("jeomgeom.getJeomgeomInsertList");
	 }
	
	@Override
	 public List<Measure> getGigiGojangList(Measure measure) {
		 return sqlSession.selectList("measure.getGigiGojangList", measure);
	 }
	
	
}

