package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuren.pojo.ProjectReply;
import com.shuren.pojo.User;
import com.shuren.service.ProjectReplyService;
import com.shuren.service.UserService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/apply")
public class ProjectReplyController {

	@Resource
	private ProjectReplyService service;

	@RequestMapping("/saveApply")
	public String saveUser(ProjectReply projectreply, HttpServletResponse response) throws Exception {
		System.out.println(projectreply.toString());
		int resultTotal = 0;
		projectreply.setState(0);
		resultTotal = service.saveProjectReply(projectreply);
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping(value = "applyList")
	@ResponseBody
	public String UserList(ProjectReply projectreply, HttpServletRequest request, HttpServletResponse response) {
		List<ProjectReply> list = service.selectByIf(projectreply);
		JSONObject result = new JSONObject();
		result.put("rows", list);
		result.put("total", list.size());
		return result.toString();
	}

	@RequestMapping("/approveOk")
    public String approveOk(@RequestParam(value = "ids") String ids, HttpServletResponse response,HttpSession session) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
        	User user=(User) session.getAttribute("currentUser");
        	ProjectReply projectreply=new ProjectReply();
        	projectreply.setProjectreplyid(Integer.parseInt(idsStr[i]));
        	projectreply.setState(1);
        	projectreply.setApprover(user.getName());
            service.updateByIf(projectreply);
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
	
	@RequestMapping("/approveFail")
    public String approveFail(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
        	ProjectReply projectreply=new ProjectReply();
        	projectreply.setProjectreplyid(Integer.parseInt(idsStr[i]));
        	projectreply.setState(2);
            service.updateByIf(projectreply);
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
	
	
	
	
	
	// @RequestMapping("/deleteUser")
	// public String delete(@RequestParam(value = "ids") String ids,
	// HttpServletResponse response) throws Exception {
	// JSONObject result = new JSONObject();
	// String[] idsStr = ids.split(",");
	// for (int i = 0; i < idsStr.length; i++) {
	// service.deleteUserById(Integer.parseInt(idsStr[i]));
	// }
	// result.put("success", true);
	// ResponseUtil.write(response, result);
	// return null;
	// }

}
