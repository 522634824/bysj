package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Schedule;

public interface ScheduleService {

	public abstract int addSchedule(Schedule s);
	
	public abstract int deleteSchedule(int scheduleid);
	
	public abstract List<Schedule> selectScheduleByIf(Schedule s);
	
	public abstract int updateSchedule(Schedule s);
}
