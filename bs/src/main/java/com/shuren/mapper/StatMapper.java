package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.ApplyStat;
import com.shuren.pojo.Howmuch;
import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectStat;
import com.shuren.pojo.QueryDate;

public interface StatMapper {
	List<ApplyStat> ApplyStatByIf(QueryDate date);

	List<ProjectStat> ProjectStatByIf(QueryDate date);
	
	List<Howmuch> sumHowmuch(QueryDate date);

	List<Project> selectProjectIsOk(QueryDate date);
}