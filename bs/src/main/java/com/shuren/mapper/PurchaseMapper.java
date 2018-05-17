package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Purchase;
import com.shuren.pojo.Purchasevo;

public interface PurchaseMapper {
    int deleteByPrimaryKey(Integer purchaseid);

    int insert(Purchase record);

    int insertSelective(Purchase record);

    Purchase selectByPrimaryKey(Integer purchaseid);

    int updateByPrimaryKeySelective(Purchase record);

    int updateByPrimaryKey(Purchase record);

	List<Purchasevo> selectByIf(Purchase p);
	
	List<Purchasevo> selectAll();
}