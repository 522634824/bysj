package com.shuren.mapper;

import com.shuren.pojo.Project;

public interface ProjectMapper {
    int deleteByPrimaryKey(String projectinforid);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(String projectinforid);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);
}