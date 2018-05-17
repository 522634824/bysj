package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Purchase;
import com.shuren.pojo.Purchasevo;

public interface PurchaseService {

	public List<Purchasevo> selectByIf(Purchase p);
	
	public List<Purchasevo> selectAll();
	
	public int addPurchase(Purchase p);
}
