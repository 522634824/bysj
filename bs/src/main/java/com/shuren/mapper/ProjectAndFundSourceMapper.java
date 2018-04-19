package com.shuren.mapper;

import com.shuren.pojo.ProjectAndFundSource;

public interface ProjectAndFundSourceMapper {
    int deleteByPrimaryKey(Integer projectandfundsourceid);

    int insert(ProjectAndFundSource record);

    int insertSelective(ProjectAndFundSource record);

    ProjectAndFundSource selectByPrimaryKey(Integer projectandfundsourceid);

    int updateByPrimaryKeySelective(ProjectAndFundSource record);

    int updateByPrimaryKey(ProjectAndFundSource record);
}