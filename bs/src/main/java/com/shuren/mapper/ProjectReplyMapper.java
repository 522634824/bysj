package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.ProjectReply;

public interface ProjectReplyMapper {
    int deleteByPrimaryKey(String projectreplyid);

    int insert(ProjectReply record);

    int insertSelective(ProjectReply record);

    ProjectReply selectByPrimaryKey(String projectreplyid);

    int updateByPrimaryKeySelective(ProjectReply record);

    int updateByPrimaryKey(ProjectReply record);

	List<ProjectReply> selectAll();

	List<ProjectReply> selectByIf(ProjectReply projectreply);
	
}