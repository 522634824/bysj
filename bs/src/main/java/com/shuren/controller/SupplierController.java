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
import com.shuren.pojo.SupplierBrand;
import com.shuren.pojo.SupplierStaff;

import com.shuren.service.SupplierService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

	@Resource
	private SupplierService service;

	@RequestMapping("allSupplier")
	@ResponseBody
	public String allSupplier() {
		JSONArray array=new JSONArray();
		List<Supplier> list=service.selectAllSupplier();
		String result=array.toJSONString(list);
		return result;
	}
	
	@RequestMapping("SupplierByBrand")
	@ResponseBody
	public String SupplierByBrand(SupplierBrand brand) {
		JSONArray array=new JSONArray();
		List<Supplier> list=service.selectByBrand(brand);
		String result=array.toJSONString(list);
		return result;
	}
	
	@RequestMapping("supplierList")
	@ResponseBody
	public String supplierList() {	
		List<Supplier> sup = service.selectAllSupplier();
		JSONObject result=new JSONObject();
		result.put("rows", sup);
		result.put("total", sup.size());
		return result.toString();

		
	}

	@RequestMapping("saveSupplier")
	public String addSupplier(Supplier supplier,HttpServletResponse response) throws Exception {
		System.out.println(supplier.toString());
		int resultTotal = 0;
        if (supplier.getSupplierid() == null) {
            resultTotal = service.addSupplier(supplier);
        } else {
            resultTotal = service.updateSupplier(supplier);
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

	@RequestMapping("deleteSupplier")
	public String deleteSupplier(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		 JSONObject result = new JSONObject();
	        String[] idsStr = ids.split(",");
	        for (int i = 0; i < idsStr.length; i++) {
	            service.deleteBySupplierid(Integer.parseInt(idsStr[i]));
	        }
	        result.put("success", true);
	        ResponseUtil.write(response, result);
	        return null;

	}
	
}
