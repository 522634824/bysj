package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.shuren.pojo.Project;
import com.shuren.pojo.Team;
import com.shuren.pojo.User;
import com.shuren.service.ProjectService;
import com.shuren.service.TeamService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/team")
public class TeamController {

	@Resource
	private TeamService service;

	@RequestMapping(value="/teamList")
	@ResponseBody
	public String teamList(Team team,HttpServletRequest request, HttpServletResponse response) {
		List<Team> list = service.SelectTeamByIf(team);
		JSONObject result = new JSONObject();
		result.put("rows", list);
		result.put("total", list.size());
		return result.toString();
	
	}
	
	@RequestMapping("/saveTeam")
	public String saveTeam(Team team, HttpServletResponse response) throws Exception {
		  int resultTotal = 0;
	        if (team.getTeamid() == null) {
	            resultTotal = service.addTeam(team);
	        } else {
	            resultTotal = service.updateTeam(team);
	        }
	        JSONObject result = new JSONObject();
	        if (resultTotal > 0) {
	            result.put("success", true);
	        } else {
	            result.put("success", false);
	        }   
	        ResponseUtil.write(response, result);
	        return null;
	}
	
	
	@RequestMapping("/deleteTeam")
    public String deleteTeam(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            service.deleteTeam(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

	
}