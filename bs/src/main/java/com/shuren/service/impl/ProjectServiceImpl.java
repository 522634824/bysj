package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.ProjectMapper;
import com.shuren.pojo.Project;
import com.shuren.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper mapper;

	@Override
	public int addProject(Project project) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(project);
	}

	@Override
	public int updateProject(Project project) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(project);
	}

	@Override
	public int deleteProject(String projectid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(projectid);
	}

	@Override
	public List<Project> selectProjectByIf(Project project) {
		// TODO Auto-generated method stub
		return mapper.selectProjectByIf(project);
	}

	@Override
	public Project selectSingleByIf(Project project) {
		// TODO Auto-generated method stub
		return mapper.selectSingleByIf(project);
	}
	
	

}
