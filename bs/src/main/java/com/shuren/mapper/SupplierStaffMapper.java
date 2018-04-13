package com.shuren.mapper;

import com.shuren.pojo.SupplierStaff;

public interface SupplierStaffMapper {
    int deleteByPrimaryKey(Integer supplierstaffid);

    int insert(SupplierStaff record);

    int insertSelective(SupplierStaff record);

    SupplierStaff selectByPrimaryKey(Integer supplierstaffid);

    int updateByPrimaryKeySelective(SupplierStaff record);

    int updateByPrimaryKey(SupplierStaff record);
}