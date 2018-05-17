package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectFundSource;
import com.shuren.pojo.Supplier;
import com.shuren.service.ProjectFundSourceService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/fundsource")
public class ProjectFundSourceController {

	@Resource
	private ProjectFundSourceService service;

	@RequestMapping("fundsourceList")
	@ResponseBody
	public String fundsourceList(ProjectFundSource p) {
		List<ProjectFundSource> fundsource = service.selectByIf(p);
		System.out.println(fundsource.toString());
		JSONObject result = new JSONObject();
		result.put("rows", fundsource);
		result.put("total", fundsource.size());
		return result.toString();

	}

	@RequestMapping("saveFundsource")
	public String saveFundsource(ProjectFundSource fundsource,HttpSession session,HttpServletResponse response) throws Exception {
		 int resultTotal = 0;
		 Project p=(Project) session.getAttribute("activeProject");
			String projectid=p.getProjectid();
			fundsource.setProjectid(projectid);
	        if (fundsource.getProjectfundsourceid() == null) {
	            resultTotal = service.addFundsource(fundsource);
	        } else {
	            resultTotal = service.updateFundsource(fundsource);
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
	        
	        
	@RequestMapping("/deleteFundsource")
    public String deleteFundsource(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            service.deleteFundsource(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

	}
