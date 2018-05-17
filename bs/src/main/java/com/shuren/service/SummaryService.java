package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Summary;

public interface SummaryService {

	public abstract int addSummary(Summary s);
	
	public abstract int deleteSummary(int summaryid);
	
	public abstract List<Summary> selectSummaryByIf(Summary s);
	
	public abstract int updateSummary(Summary s);
}
