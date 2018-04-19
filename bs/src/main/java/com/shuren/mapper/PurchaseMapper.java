package com.shuren.mapper;

import com.shuren.pojo.Purchase;

public interface PurchaseMapper {
    int deleteByPrimaryKey(Integer purchaseid);

    int insert(Purchase record);

    int insertSelective(Purchase record);

    Purchase selectByPrimaryKey(Integer purchaseid);

    int updateByPrimaryKeySelective(Purchase record);

    int updateByPrimaryKey(Purchase record);
}