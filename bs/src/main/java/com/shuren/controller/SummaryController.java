package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuren.pojo.Summary;
import com.shuren.pojo.Supplier;
import com.shuren.service.SummaryService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("summary")
public class SummaryController {

	@Resource
	private SummaryService service;

	@RequestMapping("summaryList")
	@ResponseBody
	public String summaryList(Summary s) {
		List<Summary> summary = service.selectSummaryByIf(s);
		JSONObject result = new JSONObject();
		result.put("rows", summary);
		result.put("total", summary.size());
		return result.toString();

	}

	@RequestMapping("saveSummary")
	public String saveSummary(Summary s, HttpServletResponse response) throws Exception {
		int resultTotal = 0;
		resultTotal = service.addSummary(s);
		JSONObject result = new JSONObject();
		if (resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("deleteSummary")
	public String deleteSummary(@RequestParam(value = "ids") String ids, HttpServletResponse response)
			throws Exception {
		JSONObject result = new JSONObject();
		String[] idsStr = ids.split(",");
		for (int i = 0; i < idsStr.length; i++) {
			service.deleteSummary(Integer.parseInt(idsStr[i]));
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;

	}
}
