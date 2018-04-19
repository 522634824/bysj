package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.ProjectReplyMapper;
import com.shuren.pojo.ProjectReply;
import com.shuren.service.ProjectReplyService;

@Service
public class ProjectReplyServiceImpl implements ProjectReplyService{

	@Resource
	private ProjectReplyMapper mapper;
	
	@Override
	public int saveProjectReply(ProjectReply record) {
		return mapper.insertSelective(record);
		
	}

	@Override
	public List<ProjectReply> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	@Override
	public List<ProjectReply> selectByIf(ProjectReply projectreply) {
		// TODO Auto-generated method stub
		return mapper.selectByIf(projectreply);
	}

	@Override
	public void updateByIf(ProjectReply projectreply) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryKeySelective(projectreply);
	}

}
