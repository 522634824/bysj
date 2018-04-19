package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.SupplierType;

public interface SupplierTypeMapper {
    int deleteByPrimaryKey(Integer suppliertypeid);

    int insert(SupplierType record);

    int insertSelective(SupplierType record);

    SupplierType selectByPrimaryKey(Integer suppliertypeid);

    int updateByPrimaryKeySelective(SupplierType record);

    int updateByPrimaryKey(SupplierType record);

	List<SupplierType> selectAllSupplierType();
}