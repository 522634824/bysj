package com.shuren.service;

import java.util.List;

import com.shuren.pojo.ProjectReply;

public interface ProjectReplyService {

	int saveProjectReply(ProjectReply record);

	List<ProjectReply> selectAll();

	List<ProjectReply> selectByIf(ProjectReply projectreply);

	void updateByIf(ProjectReply projectreply);
}
