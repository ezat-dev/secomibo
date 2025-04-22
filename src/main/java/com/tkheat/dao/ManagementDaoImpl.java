package com.tkheat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tkheat.domain.Corp;
import com.tkheat.domain.Fac;
import com.tkheat.domain.Measure;
import com.tkheat.domain.Permission;
import com.tkheat.domain.Product;
import com.tkheat.domain.Standard;
import com.tkheat.domain.Users;
@Repository
public class ManagementDaoImpl implements ManagementDao {
	 @Autowired
	 private SqlSession sqlSession;

	 @Override
	 public List<Users> getUserList(Users user) {
		 return sqlSession.selectList("users.getUserList", user);
	 }
	 
	 @Override
	 public List<Users> getBigPageList() {
		 return sqlSession.selectList("users.getBigPageList");
	 }
	 
	 @Override
	 public List<Users> getSmallPageList(String page_big) {  
		 return sqlSession.selectList("users.getSmallPageList", page_big);  
	 }
	 
	 @Override
	 public Permission authorityUserSelect(Permission permission) {
		 return sqlSession.selectOne("users.authorityUserSelect",permission);
	 }

	@Override
	public void authorityUserSelectSave(Permission permission) {
		sqlSession.update("users.authorityUserSelectSave", permission);
	}
	
	@Override
	public void productInsertSave(Product product) {
		sqlSession.insert("product.productInsertSave", product);
	}
	
	@Override
	 public List<Corp> getCorpList(Corp corp) {
		 return sqlSession.selectList("corp.getCorpList", corp);
	 }
	
	@Override
	public void cutumInsertSave(Corp corp) {
		sqlSession.insert("corp.cutumInsertSave", corp);
	}
	
	@Override
	 public List<Fac> getFacList(Fac fac) {
		 return sqlSession.selectList("fac.getFacList", fac);
	 }
	
	@Override
	 public List<Product> getProductList(Product product) {
		 return sqlSession.selectList("product.getProductList",product);
	 }
	
	@Override
	 public List<Measure> getMeasureList() {
		 return sqlSession.selectList("measure.getMeasureList");
	 }
	
	@Override
	 public List<Standard> getChimStandardList(Standard standard) {
		 return sqlSession.selectList("standard.getChimStandardList",standard);
	 }
	
	@Override
	public void chimStandardSave(Standard standard) {
		sqlSession.insert("standard.chimStandardSave", standard);
	}
	
	// gubn으로 구분하기 때문에 같은 쿼리 사용
	@Override
	 public List<Standard> getGoStandardList(Standard standard) {
		 return sqlSession.selectList("standard.getChimStandardList",standard);
	 }
	
	 @Override
	    public void insertUser(Users users) {
	        sqlSession.insert("users.insertUser", users); 
	    }
}

