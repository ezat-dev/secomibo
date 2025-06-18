package com.tkheat.dao;

import java.util.List;

import com.tkheat.domain.Ipgo;
import com.tkheat.domain.Work;

public interface ProductionDao {

	List<Work> getWorkInstructionList(Work work);
	
	List<Work> getWorkStatusList(Work work);
	
	
	
	
	List<Work> getNonReportList(Work work);
	
	List<Ipgo> getNonReportIpgoList(Ipgo ipgo);
	
	void nonReportInsertSave(Work work);
	
	void nonReportUpdateSave(Work work);
	
	void nonReportDelete(int werr_code);
	
	
	
	
	List<Work> getProdWaitingStatusList(Work work);

	List<Work> getWorkWaitList(Work work);

	void setWorkSetSave(Work work);

	Work getPlnpNo(Work works);
}
