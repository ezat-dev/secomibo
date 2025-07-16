package com.tkheat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Monitoring;

@Repository
public class MonitoringDaoImpl implements MonitoringDao{

	@Resource(name="session")
	private SqlSession sqlSession;
	
	@Override
    public List<Monitoring> getMonitoringList() {
		return sqlSession.selectList("monitoring.getMonitoringList");
    }
	
	@Override
    public List<Monitoring> gettrend(Monitoring monitoring) { 
      return sqlSession.selectList("monitoring.gettrend", monitoring);
    }

}
