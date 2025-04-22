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
	List<Users> getUserList(Users user); 
	
	List<Users> getBigPageList(); 
	
	List<Users> getSmallPageList(String page_big);

	Permission authorityUserSelect(Permission permission);
	
	void productInsertSave(Product product);

	void authorityUserSelectSave(Permission permission);
	
	List<Corp> getCorpList(Corp corp);
	
	void cutumInsertSave(Corp corp);
	
	List<Fac> getFacList(Fac fac);
	
	List<Product> getProductList(Product product);
	
	List<Measure> getMeasureList();
	
	List<Standard> getChimStandardList(Standard standard);
	
	void chimStandardSave(Standard standard);
	
	List<Standard> getGoStandardList(Standard standard);
	
	
	void insertUser(Users users);
}
