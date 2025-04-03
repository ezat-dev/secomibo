package com.tkheat.service;

import java.util.List;

import com.tkheat.domain.Corp;
import com.tkheat.domain.Fac;
import com.tkheat.domain.Measure;
import com.tkheat.domain.Permission;
import com.tkheat.domain.Product;
import com.tkheat.domain.Standard;
import com.tkheat.domain.Users;

public interface ManagementService {
	List<Users> getUserList(); 
	
	List<Users> getBigPageList(); 
	
	List<Users> getSmallPageList(String page_big);

	Permission authorityUserSelect(Permission permission);
	
	void productInsertSave(Product product);

	void authorityUserSelectSave(Permission permission);
	
	List<Corp> getCorpList();
	
	List<Fac> getFacList();
	
	List<Product> getProductList();
	
	List<Measure> getMeasureList();
	
	List<Standard> getChimStandardList();
	
	List<Standard> getGoStandardList();
	
	
	void insertUser(Users users);
}
