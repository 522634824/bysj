package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.ProjectMapper;
import com.shuren.mapper.ProjectReplyMapper;
import com.shuren.mapper.StatMapper;
import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.ProjectStat;
import com.shuren.pojo.QueryDate;
import com.shuren.pojo.ApplyStat;
import com.shuren.pojo.Howmuch;
import com.shuren.pojo.User;
import com.shuren.service.StatService;

@Service
public class StatServiceImpl implements StatService{
	
	@Resource 
	private StatMapper mapper;
	
	@Override
	public List<ApplyStat> ApplyStatByIf(QueryDate date) {
		// TODO Auto-generated method stub
		
		return mapper.ApplyStatByIf(date);
	}

	@Override
	public List<ProjectStat> ProjectStatByIf(QueryDate date) {
		// TODO Auto-generated method stub
		return mapper.ProjectStatByIf(date);
	}

	@Override
	public List<Howmuch> ProjectHowmuchByIf(QueryDate date) {
		// TODO Auto-generated method stub
		return mapper.sumHowmuch(date);
	}

	

	
	
	
	
	
	
}
