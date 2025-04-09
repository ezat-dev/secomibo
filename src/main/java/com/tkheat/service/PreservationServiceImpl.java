package com.tkheat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.PreservationDao;
import com.tkheat.domain.SparePart;


@Service
public class PreservationServiceImpl implements PreservationService{
	
	@Autowired
	private PreservationDao preservationDao;
	
	@Override
	public List<SparePart> getSparePartList(){
		return preservationDao.getSparePartList();
	}
	
	

}
