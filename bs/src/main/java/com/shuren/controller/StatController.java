package com.shuren.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.shuren.pojo.Equipment;
import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.ProjectStat;
import com.shuren.pojo.QueryDate;
import com.shuren.pojo.ApplyStat;
import com.shuren.pojo.User;
import com.shuren.service.StatService;
import com.shuren.util.DateUtil;

@Controller
@RequestMapping("stat")
public class StatController {

	@Resource
	StatService service;
	@RequestMapping("applyStattList")
	@ResponseBody
	public String stattListByIf(String year, String month) {
		if (year == null && month == null) {
			QueryDate time = new QueryDate();
			List<ApplyStat> stat = service.ApplyStatByIf(time);
			JSONObject result = new JSONObject();
			result.put("rows", stat);
			result.put("total", stat.size());
			return result.toString();
		}
		String starttime = null;
		String endtime = null;
		if (!year.equals("-1") && month.equals("-1")) {
			starttime = DateUtil.getFirstDayOfYear(Integer.valueOf(year));
			endtime = DateUtil.getLastDayOfYear(Integer.valueOf(year));
		}
		if (!year.equals("-1") && !month.equals("-1")) {
			starttime = DateUtil.getFirstDayOfMonth(Integer.valueOf(year), Integer.valueOf(month));
			endtime = DateUtil.getLastDayOfMonth(Integer.valueOf(year), Integer.valueOf(month));

		}
		QueryDate time = new QueryDate();
		time.setStartdate(starttime);
		time.setEnddate(endtime);
		List<ApplyStat> stat = service.ApplyStatByIf(time);
		JSONObject result = new JSONObject();
		result.put("rows", stat);
		result.put("total", stat.size());
		return result.toString();
	}

	
	@RequestMapping("projectStattList")
	@ResponseBody
	public String projectStattList(String year, String month) {
		if (year == null && month == null) {
			QueryDate time = new QueryDate();
			List<ProjectStat> stat = service.ProjectStatByIf(time);
			JSONObject result = new JSONObject();
			result.put("rows", stat);
			result.put("total", stat.size());
			return result.toString();
		}
		String starttime = null;
		String endtime = null;
		if (!year.equals("-1") && month.equals("-1")) {
			starttime = DateUtil.getFirstDayOfYear(Integer.valueOf(year));
			endtime = DateUtil.getLastDayOfYear(Integer.valueOf(year));
		}
		if (!year.equals("-1") && !month.equals("-1")) {
			starttime = DateUtil.getFirstDayOfMonth(Integer.valueOf(year), Integer.valueOf(month));
			endtime = DateUtil.getLastDayOfMonth(Integer.valueOf(year), Integer.valueOf(month));

		}
		QueryDate time = new QueryDate();
		time.setStartdate(starttime);
		time.setEnddate(endtime);
		List<ProjectStat> stat = service.ProjectStatByIf(time);
		JSONObject result = new JSONObject();
		result.put("rows", stat);
		result.put("total", stat.size());
		return result.toString();
	}

}
