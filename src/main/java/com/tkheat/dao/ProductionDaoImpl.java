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
	public Work nonReportDetail(Work work) {
		return sqlSession.selectOne("work.nonReportDetail",work);
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

	@Override
	public Work getWorkPlnpSeq(Work work) {
		return sqlSession.selectOne("work.getWorkPlnpSeq", work);
	}

	@Override
	public List<Work> workInstructionReport(Work work) {
		return sqlSession.selectList("work.workInstructionReport",work);
	}

	@Override
	public Work getWorkJBarcode(Work work) {
		return sqlSession.selectOne("work.getWorkJBarcode", work);
	}

	@Override
	public void setWorkJSave(Work work) {
		
		Work rWork = sqlSession.selectOne("work.setWorkJSaveChk", work);
//		System.out.println("조회된 객체");
//		System.out.println(rWork);
		
		if(rWork == null) {
			work.setQueryGb("I");	
		}else {
			work.setQueryGb("U");
		}
//		(#{ord_code}, 'J', #{ilbo_su}, #{ilbo_jung}, #{ilbo_strt}, #{ilbo_end}, #{user_code})
/*		System.out.println(work.getQueryGb());
		System.out.println(work.getOrd_code());
		System.out.println(work.getIlbo_su());
		System.out.println(work.getIlbo_jung());
		System.out.println(work.getIlbo_strt());
		System.out.println(work.getIlbo_end());
		System.out.println(work.getUser_code());*/
//		System.out.println(work.getQueryGb());
		
		
		sqlSession.insert("work.setWorkJSave",work);
	}

}
