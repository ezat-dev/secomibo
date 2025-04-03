package com.tkheat.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Gongjung;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Jaego;
@Repository
public class ProductDaoImpl implements ProductDao {
	 @Autowired
	 private SqlSession sqlSession;

	@Override
	 public List<Ipgo> getIpgoList(Ipgo ipgo) {
		 return sqlSession.selectList("ipgo.getIpgoList", ipgo);
	 }
	
	@Override
	 public List<Chulgo> getChulgoList() {
		 return sqlSession.selectList("chulgo.getChulgoList");
	 }
	
	@Override
	 public List<Chulgo> getChulgoWaitingList() {
		 return sqlSession.selectList("chulgo.getChulgoWaitingList");
	 }
	
	@Override
	 public List<Jaego> getJaegoStatusList() {
		 return sqlSession.selectList("jaego.getJaegoStatusList");
	 }
	
	@Override
	 public List<Jaego> getPJaegoStatusList() {
		 return sqlSession.selectList("jaego.getPJaegoStatusList");
	 }
	
	@Override
	 public List<Gongjung> getIpChulDeleteList() {
		 return sqlSession.selectList("gongjung.getIpChulDeleteList");
	 }
	
	@Override
	 public List<Gongjung> getWorkStatusList() {
		 return sqlSession.selectList("gongjung.getWorkStatusList");
	 }
}

