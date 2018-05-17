package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Project;

public interface ProjectMapper {
    int deleteByPrimaryKey(String projectid);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(String projectid);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);

	List<Project> selectProjectByIf(Project project);

	Project selectSingleByIf(Project project);

}