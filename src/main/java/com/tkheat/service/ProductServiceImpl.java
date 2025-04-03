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
	public List<Chulgo> getChulgoWaitingList(){
		return productDao.getChulgoWaitingList();
	}
	
	@Override
	public List<Chulgo> getChulgoList(){
		return productDao.getChulgoList();
	}
	
	@Override
	public List<Jaego> getJaegoStatusList(){
		return productDao.getJaegoStatusList();
	}
	
	@Override
	public List<Jaego> getPJaegoStatusList(){
		return productDao.getPJaegoStatusList();
	}
	
	@Override
	public List<Gongjung> getIpChulDeleteList(){
		return productDao.getIpChulDeleteList();
	}
	
	@Override
	public List<Gongjung> getWorkStatusList(){
		return productDao.getWorkStatusList();
	}
}
