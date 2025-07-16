package com.tkheat.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.MonitoringDao;
import com.tkheat.domain.Monitoring;

@Service
public class MonitoringServiceImpl implements MonitoringService{

	@Autowired
	private MonitoringDao monitoringDao;
	
	 @Override
	    public List<Monitoring> getMonitoringList() {
	        return monitoringDao.getMonitoringList();
	    }
	
	 @Override
		public List<Monitoring > gettrend(Monitoring monitoring) {
		    return monitoringDao.gettrend(monitoring); 	   
		}

}
