package com.tkheat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.ProductDao;
import com.tkheat.domain.Chulgo;
import com.tkheat.domain.Gongjung;
import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Jaego;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao productDao;
	
	@Override
	public List<Ipgo> getIpgoList(Ipgo ipgo){
		return productDao.getIpgoList(ipgo);
	}
	
	@Override
	public List<Chulgo> getChulgoWaitingList(Chulgo chulgo){
		return productDao.getChulgoWaitingList(chulgo);
	}
	
	@Override
	public List<Chulgo> getChulgoList(Chulgo chulgo){
		return productDao.getChulgoList(chulgo);
	}
	
	@Override
	public List<Jaego> getJaegoStatusList(Jaego jaego){
		return productDao.getJaegoStatusList(jaego);
	}
	
	@Override
	public List<Jaego> getPJaegoStatusList(Jaego jaego){
		return productDao.getPJaegoStatusList(jaego);
	}
	
	@Override
	public List<Gongjung> getIpChulDeleteList(Gongjung gongjung){
		return productDao.getIpChulDeleteList(gongjung);
	}
	
	@Override
	public List<Gongjung> getWorkStatusList(Gongjung gongjung){
		return productDao.getWorkStatusList(gongjung);
	}
}
