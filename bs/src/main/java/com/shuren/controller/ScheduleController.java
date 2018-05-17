package com.shuren.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.shuren.pojo.Project;
import com.shuren.pojo.Schedule;
import com.shuren.service.ScheduleService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("schedule")
public class ScheduleController {

	@Resource
	private ScheduleService service;
	
	@RequestMapping("scheduleList")
	@ResponseBody
	public String scheduleList(Schedule s) {	
		List<Schedule> schedule = service.selectScheduleByIf(s);
		JSONObject result=new JSONObject();
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";
		String jsonString = JSON.toJSONString(schedule, SerializerFeature.WriteDateUseDateFormat);
		result.put("rows", jsonString);
		result.put("total", schedule.size());
		return result.toString();

		
	}

	@RequestMapping("addSchedule")
	public String saveSchedule(String overview,String plandate,HttpSession session,HttpServletResponse response) throws Exception {
		int resultTotal = 0;
		Schedule s=new Schedule();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//格式化时间 
		Date plantime=sdf.parse(plandate);  
		Project p=(Project) session.getAttribute("activeProject");
		String projectid=p.getProjectid();
		s.setProjectid(projectid);
		s.setOverview(overview);
		s.setPlandate(plantime);
        resultTotal = service.addSchedule(s);//调用项目日程service
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }   
        ResponseUtil.write(response, result);
        return null;
	}

	
	@RequestMapping("updateSchedule")
	public String updateSchedule(int scheduleid,String realdate,String state,HttpSession session,HttpServletResponse response) throws Exception {
		int resultTotal = 0;
		Schedule s=new Schedule();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟    
		Date realtime=sdf.parse(realdate);  
		s.setRealdate(realtime);
		s.setScheduleid(scheduleid);
		s.setState(state);
        resultTotal = service.updateSchedule(s);
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }   
        ResponseUtil.write(response, result);
        return null;
	}
	
	@RequestMapping("deleteSchedule")
	public String deleteSchedule(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		 JSONObject result = new JSONObject();
	        String[] idsStr = ids.split(",");
	        for (int i = 0; i < idsStr.length; i++) {
	            service.deleteSchedule(Integer.parseInt(idsStr[i]));
	        }
	        result.put("success", true);
	        ResponseUtil.write(response, result);
	        return null;

	}
}
