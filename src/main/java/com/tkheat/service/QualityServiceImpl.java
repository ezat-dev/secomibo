package com.tkheat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tkheat.dao.QualityDao;
import com.tkheat.domain.Suip;
import com.tkheat.domain.Work;


@Service
public class QualityServiceImpl implements QualityService {
	
	@Autowired
	private QualityDao qualityDao;
	
	@Override
	public List<Suip> getSuipList(Suip suip){
		return qualityDao.getSuipList(suip);
	}
	
	/*
	 * @Override public List<Work> getNonInsertList(Work work){ return
	 * qualityDao.getNonInsertList(work); }
	 */

}
