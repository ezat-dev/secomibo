package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Monitoring;

public interface MonitoringDao {

	List<Monitoring> getMonitoringList();
	
	List<Monitoring> gettrend(Monitoring monitoring);

}
