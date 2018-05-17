package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.ProjectStat;
import com.shuren.pojo.QueryDate;
import com.shuren.pojo.ApplyStat;
import com.shuren.pojo.Howmuch;

public interface StatService {

	public List<ApplyStat> ApplyStatByIf(QueryDate date);

	public List<ProjectStat> ProjectStatByIf(QueryDate time);
	
	public List<Howmuch> ProjectHowmuchByIf(QueryDate time);
}
