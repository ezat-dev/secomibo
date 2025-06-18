package com.tkheat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Work;

@Repository
public class ProductionDaoImpl implements ProductionDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Work> getWorkInstructionList(Work work) {
		return sqlSession.selectList("work.getWorkInstructionList",work);
	}
	
	@Override
	public List<Work> getWorkStatusList(Work work) {
		return sqlSession.selectList("work.getWorkStatusList",work);
	}
	
	
	
	
	
	
	@Override
	public List<Work> getNonReportList(Work work) {
		return sqlSession.selectList("work.getNonReportList",work);
	}
	
	@Override
	public List<Ipgo> getNonReportIpgoList(Ipgo ipgo) {
		return sqlSession.selectList("ipgo.getNonReportIpgoList",ipgo);
	}
	
	//부적합보고서 등록 저장 - insert
	@Override
	public void nonReportInsertSave(Work work) {
		sqlSession.insert("work.nonReportInsertSave", work);
	}

	//부적합보고서 수정 - update
	@Override
	public void nonReportUpdateSave(Work work) {
		sqlSession.update("work.nonReportUpdateSave", work);
	}

	//부적합보고서 삭제 - delete
	@Override
	public void nonReportDelete(int werr_code) {
		sqlSession.delete("work.nonReportDelete", werr_code);
	}
	
	
	
	
	
	
	@Override
	public List<Work> getProdWaitingStatusList(Work work) {
		return sqlSession.selectList("work.getProdWaitingStatusList",work);
	}

	@Override
	public List<Work> getWorkWaitList(Work work) {
		return sqlSession.selectList("work.getWorkWaitList", work);
	}

	@Override
	public void setWorkSetSave(Work work) {
		sqlSession.insert("work.setWorkSetSave",work);
	}

	@Override
	public Work getPlnpNo(Work works) {
		return sqlSession.selectOne("work.getPlnpNo", works);
	}

}
