package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Siljuk;

public interface ProcessDao {
	
	List<Siljuk> getChimSiljukList(Siljuk siljuk);
	
	List<Siljuk> getCleanSiljukList(Siljuk siljuk);
	
	List<Siljuk> getCleanRwSiljukList(Siljuk siljuk);
	
	List<Siljuk> getTemSiljukList(Siljuk siljuk);
	
	List<Siljuk> getShortSiljukList(Siljuk siljuk);
	
	List<Siljuk> getReadySiljukList(Siljuk siljuk);
	
	List<Siljuk> getFacSiljukList(Siljuk siljuk);

}
