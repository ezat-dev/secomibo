package com.tkheat.dao;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.SparePart;
@Repository
public class PreverationDaoImpl implements PreservationDao {
	 @Autowired
	 private SqlSession sqlSession;

	@Override
	 public List<SparePart> getSparePartList() {
		 return sqlSession.selectList("sparePart.getSparePartList");
	 }
	
	
}

