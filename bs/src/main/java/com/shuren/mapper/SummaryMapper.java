package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Summary;

public interface SummaryMapper {
    int deleteByPrimaryKey(Integer summaryid);

    int insert(Summary record);

    int insertSelective(Summary record);

    Summary selectByPrimaryKey(Integer summaryid);

    int updateByPrimaryKeySelective(Summary record);

    int updateByPrimaryKey(Summary record);

	List<Summary> selectSummaryByIf(Summary s);
}