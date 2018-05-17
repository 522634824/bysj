package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.ScheduleMapper;
import com.shuren.pojo.Schedule;
import com.shuren.service.ScheduleService;


@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Resource
	private ScheduleMapper mapper;
	
	@Override
	public int addSchedule(Schedule s) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(s);
	}

	@Override
	public int deleteSchedule(int scheduleid) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(scheduleid);
	}

	@Override
	public List<Schedule> selectScheduleByIf(Schedule s) {
		// TODO Auto-generated method stub
		return mapper.selectScheduleByIf(s);
	}

	@Override
	public int updateSchedule(Schedule s) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(s);
	}

}
