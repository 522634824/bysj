package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.SummaryMapper;
import com.shuren.pojo.Summary;
import com.shuren.service.SummaryService;

@Service
public class SummaryServiceImpl implements SummaryService{

	@Resource
	private SummaryMapper mapper;
	
	@Override
	public int addSummary(Summary s) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(s);
	}

	@Override
	public int deleteSummary(int summaryid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(summaryid);
	}

	@Override
	public List<Summary> selectSummaryByIf(Summary s) {
		// TODO Auto-generated method stub
		return mapper.selectSummaryByIf(s);
	}

	@Override
	public int updateSummary(Summary s) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(s);
	}

}
