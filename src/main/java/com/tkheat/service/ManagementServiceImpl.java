package com.tkheat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.ManagementDao;
import com.tkheat.domain.Corp;
import com.tkheat.domain.Fac;
import com.tkheat.domain.Measure;
import com.tkheat.domain.Permission;
import com.tkheat.domain.Product;
import com.tkheat.domain.Standard;
import com.tkheat.domain.Users;

@Service
public class ManagementServiceImpl implements ManagementService {
	@Autowired
	private ManagementDao managementDao;
	
	@Override
	public List<Users> getUserList(){
		return managementDao.getUserList();
	}
	@Override
	public List<Users> getBigPageList(){
		return managementDao.getBigPageList();
	}
	
	@Override
	public List<Users> getSmallPageList(String page_big) {  
		return managementDao.getSmallPageList(page_big);  
	}
	
	@Override
	public Permission authorityUserSelect(Permission permission) {
		return managementDao.authorityUserSelect(permission);
	}
	@Override
	public void authorityUserSelectSave(Permission permission) {
		managementDao.authorityUserSelectSave(permission);
	}
	
	@Override
	public void productInsertSave(Product product) {
		managementDao.productInsertSave(product);
	}
	
	@Override
	public List<Corp> getCorpList(){
		return managementDao.getCorpList();
	}
	
	@Override
	public List<Fac> getFacList(){
		return managementDao.getFacList();
	}
	
	@Override
	public List<Product> getProductList(){
		return managementDao.getProductList();
	}
	
	@Override
	public List<Measure> getMeasureList(){
		return managementDao.getMeasureList();
	}
	
	@Override
	public List<Standard> getChimStandardList(){
		return managementDao.getChimStandardList();
	}
	
	@Override
	public List<Standard> getGoStandardList(){
		return managementDao.getGoStandardList();
	}
	
	@Override
    public void insertUser(Users users) {
        managementDao.insertUser(users); 
    
    }
	
	
}
