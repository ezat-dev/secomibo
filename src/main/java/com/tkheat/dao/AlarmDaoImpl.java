package com.tkheat.dao;

import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Alarm;
import com.tkheat.domain.Users;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Resource(name="session")
	private SqlSession sqlSession;

	@Override
	public List<Alarm> getAlarmList(Alarm alarm) {
		return sqlSession.selectList("alarm.getAlarmList",alarm);
	}

	@Override
	public boolean updateAlarmSend(Alarm alarm) {
		int result =  sqlSession.update("alarm.updateAlarmSend", alarm);
		if(result <= 0) {
			return false;
		}
		return true;
	}

	@Override
	public List<Alarm> allAlarmList(Alarm alarm) {
		return sqlSession.selectList("alarm.allAlarmList",alarm);
	}

	@Override
	public boolean updateAlarmGroup(Alarm alarm) {
		int result = sqlSession.update("alarm.updateAlarmGroup", alarm);
		if(result <= 0) {
			return false;
		}
		return true;
	}
}
