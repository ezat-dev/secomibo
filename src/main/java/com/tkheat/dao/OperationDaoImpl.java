package com.tkheat.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Siljuk;
import com.tkheat.domain.Users;

@Repository
public class OperationDaoImpl implements OperationDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Ipgo> getPIpgoStatusList(Ipgo ipgo) {
		return sqlSession.selectList("ipgo.getPIpgoStatusList",ipgo);
	}
	
	@Override
	public List<Ipgo> getCuIpgoStatusList(Ipgo ipgo) {
		return sqlSession.selectList("ipgo.getCuIpgoStatusList",ipgo);
	}
	
	@Override
	public List<Chulgo> getPChulgoStatusList(Chulgo chulgo) {
		return sqlSession.selectList("chulgo.getPChulgoStatusList",chulgo);
	}
	
	@Override
	public List<Chulgo> getCuChulgoStatusList(Chulgo chulgo) {
		return sqlSession.selectList("chulgo.getCuChulgoStatusList",chulgo);
	}
	
	@Override
	public List<Siljuk> getProdSiljukList(Siljuk siljuk) {
		return sqlSession.selectList("siljuk.getProdSiljukList",siljuk);
	}
	
	@Override
	public List<Siljuk> getFacSiljukList(Siljuk siljuk) {
		return sqlSession.selectList("siljuk.getFacSiljukList",siljuk);
	}
	
	@Override
	public List<Users> getNoticeList() {
		return sqlSession.selectList("users.getNoticeList");
	}
	
	

}
