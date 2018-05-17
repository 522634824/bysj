package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuren.mapper.ProjectFundSourceMapper;
import com.shuren.pojo.ProjectFundSource;
import com.shuren.service.ProjectFundSourceService;

@Service
public class ProjectFundSourceImpl implements ProjectFundSourceService{

	@Resource
	private ProjectFundSourceMapper mapper;

	@Override
	public List<ProjectFundSource> selectByIf(ProjectFundSource p) {
		// TODO Auto-generated method stub
		return mapper.selectByIf(p);
	}

	@Override
	public int addFundsource(ProjectFundSource fundsource) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(fundsource);
	}

	@Override
	public int updateFundsource(ProjectFundSource fundsource) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(fundsource);
	}

	@Override
	public int deleteFundsource(int projectfundsourceid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(projectfundsourceid);
	}
	
	
}
