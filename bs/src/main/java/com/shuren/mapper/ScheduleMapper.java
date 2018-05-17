package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Schedule;

public interface ScheduleMapper {
    int deleteByPrimaryKey(Integer scheduleid);

    int insert(Schedule record);

    int insertSelective(Schedule record);

    Schedule selectByPrimaryKey(Integer scheduleid);

    int updateByPrimaryKeySelective(Schedule record);

    int updateByPrimaryKey(Schedule record);
    
    List<Schedule> selectScheduleByIf(Schedule s);
}