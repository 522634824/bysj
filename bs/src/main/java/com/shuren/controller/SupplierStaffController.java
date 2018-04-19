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

import com.shuren.service.SupplierService;
import com.shuren.service.SupplierStaffService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/supplier")
public class SupplierStaffController {

	@Resource
	private SupplierStaffService service;
	
	@RequestMapping("supplierstaffList")
	@ResponseBody
	public String supplierstaffList(int supplierid) {	
		if(supplierid==0) {
			List<SupplierStaff> sup = service.selectAllSupplierStaff();
			JSONObject result=new JSONObject();
			result.put("rows", sup);
			result.put("total", sup.size());
			return result.toString();
			
		}else {
		
		List<SupplierStaff> sup = service.selectStaffBySupplierid(supplierid);
		JSONObject result=new JSONObject();
		result.put("rows", sup);
		result.put("total", sup.size());
		return result.toString();
		}
		
	}
	
	
	@RequestMapping("/saveSupplierstaff")
	public String addSupplierstaff(SupplierStaff supplierstaff,HttpServletResponse response) throws Exception {
		int resultTotal = 0;
        if (supplierstaff.getSupplierstaffid() == null) {
            resultTotal = service.addSupplierstaff(supplierstaff);
        } else {
            resultTotal = service.updateSupplierstaff(supplierstaff);
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

	@RequestMapping("deleteSupplierstaff")
	public String deleteSupplierstaff(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		 JSONObject result = new JSONObject();
	        String[] idsStr = ids.split(",");
	        for (int i = 0; i < idsStr.length; i++) {
	            service.deleteBySupplierstaffid(Integer.parseInt(idsStr[i]));
	        }
	        result.put("success", true);
	        ResponseUtil.write(response, result);
	        return null;

	}
}
