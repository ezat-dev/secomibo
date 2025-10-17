package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Alarm;
import com.tkheat.domain.Users;

public interface AlarmDao {
	List<Alarm> getAlarmList(Alarm alarm);
	boolean updateAlarmSend(Alarm alarm);
	List<Alarm> allAlarmList(Alarm alarm);
	boolean updateAlarmGroup(Alarm alarm);
	boolean updateAllAlarmGroup(Alarm alarm);
}
