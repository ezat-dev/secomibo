package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Gongjung;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Jaego;

public interface ProductDao {
	
	List<Ipgo> getIpgoList(Ipgo ipgo);
	
	List<Chulgo> getChulgoList();
	
	List<Chulgo> getChulgoWaitingList();
	
	List<Jaego> getJaegoStatusList();
	
	List<Jaego> getPJaegoStatusList();
	
	List<Gongjung> getIpChulDeleteList();
	
	List<Gongjung> getWorkStatusList();
}
