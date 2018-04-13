package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.shuren.pojo.Equipment;
import com.shuren.pojo.EquipmentClass;
import com.shuren.pojo.EquipmentRoot;
import com.shuren.service.EquipmentService;


@Controller
public class EquipmentController {
	
	@Resource
	private EquipmentService service;
	
	@RequestMapping("EquipmentRootList")
	@ResponseBody
	public String EquipmentRootList() {
		JSONArray array=new JSONArray();
		List<EquipmentRoot> list=service.EquipmentRootList();
		String root=array.toJSONString(list);
		return root;
		 
		
	}

	@RequestMapping("EquipmentClassList")
	@ResponseBody
	public String EquipmentClassList(int equipmentrootid) {
		JSONArray array=new JSONArray();
		List<EquipmentClass> list=service.EquipmentClassList(equipmentrootid);
		String classes=array.toJSONString(list);
		return classes;
		 
		
	}
	
	@RequestMapping("EquipmentList")
	@ResponseBody
	public String EquipmentList(int equipmentclassid) {
		JSONArray array=new JSONArray();
		List<Equipment> list=service.EquipmentList(equipmentclassid);
		String result=array.toJSONString(list);
		return result;
		 
		
	}
}
