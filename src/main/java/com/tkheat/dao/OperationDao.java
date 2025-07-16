package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Siljuk;
import com.tkheat.domain.Users;
import com.tkheat.domain.Work;

public interface OperationDao {
	
	List<Ipgo> getPIpgoStatusList(Ipgo ipgo);
	
	List<Ipgo> getCuIpgoStatusList(Ipgo ipgo);
	
	List<Chulgo> getPChulgoStatusList(Chulgo chulgo);
	
	List<Chulgo> getCuChulgoStatusList(Chulgo chulgo);
	
	List<Siljuk> getProdSiljukList(Siljuk siljuk);
	
	List<Siljuk> getFacSiljukList(Siljuk siljuk);
	
	List<Users> getNoticeList();

	List<Chulgo> getYearSaleList(Chulgo chulgo);
	
	List<Chulgo> getMonthSaleList(Chulgo chulgo);
	
	List<Work> getMonthBulList(Work work);
	
	
	
	
	
}
