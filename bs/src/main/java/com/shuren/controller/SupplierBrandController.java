package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.shuren.pojo.Equipmentvo;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierBrand;
import com.shuren.pojo.SupplierStaff;
import com.shuren.pojo.SupplierType;
import com.shuren.service.SupplierBrandService;
import com.shuren.service.SupplierService;
import com.shuren.service.SupplierTypeService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/supplier")
public class SupplierBrandController {

	@Resource
	private SupplierBrandService service;

	@RequestMapping("SupplierBrandList")
	@ResponseBody
	public String allSupplier(int supplierid) {
		JSONArray array=new JSONArray();
		List<SupplierBrand> list=service.selectBySupplierId(supplierid);
		String result=array.toJSONString(list);
		return result;
	}
	
	@RequestMapping("SupplierBrand")
	@ResponseBody
	public String supplierList(SupplierBrand supplierbrand) {	
		List<SupplierBrand> list=service.selectByIf(supplierbrand);
		JSONObject result=new JSONObject();
		result.put("rows", list);
		result.put("total", list.size());
		return result.toString();

		
	}
	
	
	@RequestMapping("saveSupplierBrand")
	public String addSupplier(SupplierBrand brand,HttpServletResponse response) throws Exception {
		
		
		int resultTotal = 0;
            resultTotal = service.addSupplierBrand(brand);
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }   
        ResponseUtil.write(response, result);
        return null;
	}
	
	@RequestMapping("deleteSupplierBrand")
	public String deleteSupplierstaff(@RequestParam(value = "ids") String ids, HttpServletResponse response) throws Exception {
		 JSONObject result = new JSONObject();
	        String[] idsStr = ids.split(",");
	        for (int i = 0; i < idsStr.length; i++) {
	            service.deleteSupplierBrand(Integer.parseInt(idsStr[i]));
	        }
	        result.put("success", true);
	        ResponseUtil.write(response, result);
	        return null;

	}
}
