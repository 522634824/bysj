package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.Supplier;

public interface SupplierMapper {
    int deleteByPrimaryKey(Integer supplierid);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer supplierid);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);

	List<Supplier> selectAllSupplier();
}