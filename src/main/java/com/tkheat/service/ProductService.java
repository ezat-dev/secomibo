package com.tkheat.service;

import java.util.List;

import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Gongjung;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Jaego;
import com.tkheat.domain.Product;

public interface ProductService {
	
	List<Ipgo> getIpgoList(Ipgo ipgo);
	
	List<Chulgo> getChulgoList(Chulgo chulgo);
	
	List<Chulgo> getChulgoWaitingList(Chulgo chulgo);
	
	List<Jaego> getJaegoStatusList(Jaego jaego);
	
	List<Jaego> getPJaegoStatusList(Jaego jaego);
	
	List<Gongjung> getIpChulDeleteList(Gongjung gongjung);
	
	List<Gongjung> getWorkStatusList(Gongjung gongjung);

	List<Ipgo> getIpgoAddList(Ipgo ipgo);

	int setIpgoAdd(Ipgo ipgo);

	void setIpgoTest(Ipgo ipgo);

	Product getProductData(Ipgo ipgo);
	
	
}
