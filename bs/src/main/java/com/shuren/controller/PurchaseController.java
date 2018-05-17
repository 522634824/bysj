package com.shuren.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuren.pojo.Purchase;
import com.shuren.pojo.Purchasevo;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.User;
import com.shuren.service.PurchaseService;
import com.shuren.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("purchase")
public class PurchaseController {

	@Resource
	private PurchaseService service;
	
	@RequestMapping("purchaseList")
	@ResponseBody
	public String purchaseList(Purchase p) {
		List<Purchasevo> list = service.selectByIf(p);
		JSONObject result=new JSONObject();
		result.put("rows", list);
		result.put("total", list.size());
		return result.toString();
	}
	
	
	@RequestMapping("savePurchase")
	public String savePurchase(Purchase p,HttpServletResponse response,HttpSession session) throws Exception {
		int resultTotal = 0;
		User user=(User)session.getAttribute("currentUser");
     p.setUserid(user.getUserid().toString());
      resultTotal = service.addPurchase(p);
        
        JSONObject result = new JSONObject();
        if (resultTotal > 0) {
            result.put("success", true);
        } else {
            result.put("success", false);
        }   
        ResponseUtil.write(response, result);
        return null;
	}
}
