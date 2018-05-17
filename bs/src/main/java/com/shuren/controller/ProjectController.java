package com.shuren.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.shuren.pojo.EquipmentRoot;
import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.User;
import com.shuren.service.ProjectService;
import com.shuren.util.MySessionContext;
import com.shuren.util.ResponseUtil;
import net.sf.json.JSONObject;
@Controller
@RequestMapping("/project")
public class ProjectController {

	@Resource
	private ProjectService service;

	@RequestMapping(value="/addProject")
	@ResponseBody
	public String addProject(@RequestParam(value = "data", required = false) String data, HttpServletResponse response,HttpSession session) throws Exception {
		JSONObject result = new JSONObject();
		ProjectReply p = JSON.parseObject(data, ProjectReply.class);
		Project project = new Project();
		project.setProjectid(p.getProjectreplyid());
		List<Project> list=service.selectProjectByIf(project);
		if(list.size()!=0) {
			result.put("success", false);
			ResponseUtil.write(response, result);
			return null;
		}
		if(session.getAttribute("activeProject")!=null) {
			result.put("success", false);
			ResponseUtil.write(response, result);
			return null;
		}
		Date date = new Date();
        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        String nowTime = sdf.format(date);
        Date time = sdf.parse( nowTime );
		project.setName(p.getName());
		project.setOverview(p.getOverview());
		project.setUserid(p.getUserid());
		project.setPerformer(p.getPerformer());
		project.setState(0);
		project.setStartdate(time);
		service.addProject(project);
		session.setAttribute("activeProject", project);
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
		
	}
	
	@RequestMapping("/saveProject")
	public String saveProject(Project project, HttpServletResponse response,HttpSession session) throws Exception {
		int resultTotal = 0;
		if(project.getState()==1) {
			Date date = new Date();
	        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
	        String nowTime = sdf.format(date);
	        Date time = sdf.parse( nowTime );
			project.setCompletedate(time);;
		}
		resultTotal = service.updateProject(project);
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping(value = "updateProject")
	public String updateProject(Project project, HttpServletRequest request, HttpSession session) throws Exception {
		service.updateProject(project);
		Project p=new Project();
		p.setState(0);
		session.setAttribute("activeProject", service.selectSingleByIf(p));
		return "project";

	}
	

	@RequestMapping(value = "projectList")
	@ResponseBody
	public String projectList(Project project, HttpServletRequest request, HttpServletResponse response) {
		List<Project> list = service.selectProjectByIf(project);
		JSONObject result = new JSONObject();
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";
		String jsonString = JSON.toJSONString(list, SerializerFeature.WriteDateUseDateFormat);
		result.put("rows", jsonString);
		result.put("total", list.size());
		return result.toString();
	}
	
	@RequestMapping("goingProject")
	@ResponseBody
	public String goingProject(Project project) {
		JSONArray array=new JSONArray();
		List<Project> list=service.selectProjectByIf(project);
		String root=array.toJSONString(list);
		return root;
		 
		
	}
	
	
	@RequestMapping(value = "singleProject")
	public String singleProject(Project project,Model model) {
		Project p = service.selectSingleByIf(project);
		model.addAttribute("project",p);
		return "/views/project";
	}
	
	
	@RequestMapping(value = "changeProject")
	public String changeProject(Project project, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println(project.getState());
		if(project.getState()==1) {
			Date date = new Date();
	        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
	        String nowTime = sdf.format(date);
	        Date time = sdf.parse( nowTime );
			project.setCompletedate(time);;
			service.updateProject(project);
			User user=(User) session.getAttribute("currentUser");
			session.invalidate();
			HttpSession session1=request.getSession();
			session1.setAttribute("currentUser",user);
			return "project";
		}
		service.updateProject(project);
		Project p=new Project();
		p.setUserid(project.getUserid());
		p.setState(0);
		session.setAttribute("activeProject", service.selectSingleByIf(p));
		return "project";
	}
}
