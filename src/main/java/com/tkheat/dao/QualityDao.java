package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Suip;
import com.tkheat.domain.Work;

public interface QualityDao {
	
	List<Suip> getSuipList(Suip suip);

	/* List<Work> getNonInsertList(Work work); */
}
