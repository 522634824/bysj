package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.shuren.pojo.Sup;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.User;
import com.shuren.service.SupplierService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
public class SupplierController {

	@Resource
	private SupplierService service;

	@RequestMapping("supplierList")
	@ResponseBody
	public String supplierList() {	
		List<Supplier> sup = service.selectAllSupplier();
		
		JSONObject result=new JSONObject();
		result.put("rows", sup);
		result.put("total", sup.size());
		System.out.println(sup);
		System.out.println(result.toString());
		return result.toString();

		
	}

	@RequestMapping("addSupplier")
	public String addSupplier(Supplier supplier,HttpServletResponse response) throws Exception {
		 int resultTotal = 0;
		 
	        service.addSupplier(supplier);
	        
	        JSONObject result = new JSONObject();
	        
	            result.put("success", true);
	        
	        ResponseUtil.write(response, result);
	        return null;
		
		
		
	}

	@RequestMapping("deleteSupplier")
	public String deleteSupplier() {

		return null;

	}

	@RequestMapping("updateSupplier")
	public String updateSupplier() {

		return null;

	}
}
