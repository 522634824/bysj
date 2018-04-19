package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierStaff;
import com.shuren.pojo.SupplierType;
import com.shuren.service.SupplierService;
import com.shuren.service.SupplierTypeService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/supplier")
public class SupplierTypeController {

	@Resource
	private SupplierTypeService service;

	@RequestMapping("allSupplieType")
	@ResponseBody
	public String allSupplier() {
		JSONArray array=new JSONArray();
		List<SupplierType> list=service.selectAllSupplierType();
		String result=array.toJSONString(list);
		return result;
	}
}
