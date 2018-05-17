package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.PurchaseMapper;
import com.shuren.pojo.Purchase;
import com.shuren.pojo.Purchasevo;
import com.shuren.service.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Resource
	private PurchaseMapper mapper;
	@Override
	public List<Purchasevo> selectByIf(Purchase p) {
		// TODO Auto-generated method stub
		return mapper.selectByIf(p);
	}
	@Override
	public List<Purchasevo> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}
	@Override
	public int addPurchase(Purchase p) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(p);
	}

}
