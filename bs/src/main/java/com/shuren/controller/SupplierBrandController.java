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
}
