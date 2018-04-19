package com.shuren.mapper;

import com.shuren.pojo.ProjectFundSource;

public interface ProjectFundSourceMapper {
    int deleteByPrimaryKey(Integer projectfundsourceid);

    int insert(ProjectFundSource record);

    int insertSelective(ProjectFundSource record);

    ProjectFundSource selectByPrimaryKey(Integer projectfundsourceid);

    int updateByPrimaryKeySelective(ProjectFundSource record);

    int updateByPrimaryKey(ProjectFundSource record);
}