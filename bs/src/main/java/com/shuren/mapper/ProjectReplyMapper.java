package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.ProjectReply;

public interface ProjectReplyMapper {
    int deleteByPrimaryKey(Integer projectreplyid);

    int insert(ProjectReply record);

    int insertSelective(ProjectReply record);

    ProjectReply selectByPrimaryKey(Integer projectreplyid);

    int updateByPrimaryKeySelective(ProjectReply record);

    int updateByPrimaryKey(ProjectReply record);
    
	List<ProjectReply> selectAll();
	
	List<ProjectReply> selectByIf(ProjectReply projectreply);
}
