package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Project;

public interface ProjectService {

	public abstract int addProject(Project project);
	
	public abstract int updateProject(Project project);
	
	public abstract int deleteProject(String projectid);
	
	public abstract List<Project> selectProjectByIf(Project project);
	
	public abstract Project selectSingleByIf(Project project);

	

}
