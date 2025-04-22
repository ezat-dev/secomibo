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
	public List<Users> getUserList(Users user){
		return managementDao.getUserList(user);
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
	public List<Corp> getCorpList(Corp corp){
		return managementDao.getCorpList(corp);
	}
	
	@Override
	public void cutumInsertSave(Corp corp) {
		managementDao.cutumInsertSave(corp);
	}
	
	@Override
	public List<Fac> getFacList(Fac fac){
		return managementDao.getFacList(fac);
	}
	
	@Override
	public List<Product> getProductList(Product product){
		return managementDao.getProductList(product);
	}
	
	@Override
	public List<Measure> getMeasureList(){
		return managementDao.getMeasureList();
	}
	
	@Override
	public List<Standard> getChimStandardList(Standard standard){
		return managementDao.getChimStandardList(standard);
	}
	
	@Override
	public void chimStandardSave(Standard standard) {
		managementDao.chimStandardSave(standard);
	}
	
	@Override
	public List<Standard> getGoStandardList(Standard standard){
		return managementDao.getGoStandardList(standard);
	}
	
	@Override
    public void insertUser(Users users) {
        managementDao.insertUser(users); 
    
    }
	
	
}
