package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.shuren.pojo.Equipment;
import com.shuren.pojo.EquipmentClass;
import com.shuren.pojo.EquipmentRoot;
import com.shuren.pojo.Equipmentvo;
import com.shuren.service.EquipmentService;
import com.shuren.util.ResponseUtil;


@Controller
@RequestMapping("/equipment")
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
	
	@RequestMapping("allEquipment")
	@ResponseBody
	public String supplierList() {	
		List<Equipmentvo> list=service.selectAllEquipment();
		JSONObject result=new JSONObject();
		result.put("rows", list);
		result.put("total", list.size());
		return result.toString();

		
	}
	
	@RequestMapping("/saveEquipment")
	public String saveUser(Equipment equ, HttpServletResponse response) throws Exception {
		  int resultTotal = 0;
	        if (equ.getEquipmentid() == null) {
	            resultTotal = service.insertEquipment(equ);
	        } else {
	            resultTotal = service.updateEquipment(equ);
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
	
	@RequestMapping("/deleteEquipment")
    public String delete(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
        	service.deletEequipmentById(Integer.parseInt(idsStr[i]));
        }
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
