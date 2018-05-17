package com.shuren.service;

import java.util.List;

import com.shuren.pojo.ProjectFundSource;

public interface ProjectFundSourceService {


	public List<ProjectFundSource> selectByIf(ProjectFundSource p);

	public int addFundsource(ProjectFundSource fundsource);
	
	public int updateFundsource(ProjectFundSource fundsource);
	
	public int deleteFundsource(int projectfundsourceid);
	
}
