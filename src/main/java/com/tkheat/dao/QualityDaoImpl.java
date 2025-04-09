package com.tkheat.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Suip;
import com.tkheat.domain.Work;

@Repository
public class QualityDaoImpl implements QualityDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Suip> getSuipList(Suip suip) {
		return sqlSession.selectList("suip.getSuipList",suip);
	}
	
	/*
	 * @Override public List<Work> getNonInsertList(Work work) { return
	 * sqlSession.selectList("nonInsert.getNonInsertList",work); }
	 */

}
