package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.SupplierStaff;

public interface SupplierStaffMapper {
    int deleteByPrimaryKey(Integer supplierstaffid);

    int insert(SupplierStaff record);

    int insertSelective(SupplierStaff record);

    SupplierStaff selectByPrimaryKey(Integer supplierstaffid);

    int updateByPrimaryKeySelective(SupplierStaff record);

    int updateByPrimaryKey(SupplierStaff record);

	List<SupplierStaff> selectStaffBySupplierid(int supplierid);

	List<SupplierStaff> selectAllSupplierStaff();
}