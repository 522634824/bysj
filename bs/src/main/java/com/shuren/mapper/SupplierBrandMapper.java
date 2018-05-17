package com.shuren.mapper;

import java.util.List;

import com.shuren.pojo.SupplierBrand;

public interface SupplierBrandMapper {
    int deleteByPrimaryKey(Integer supplierbrandid);

    int insert(SupplierBrand record);

    int insertSelective(SupplierBrand record);

    SupplierBrand selectByPrimaryKey(Integer supplierbrandid);

    int updateByPrimaryKeySelective(SupplierBrand record);

    int updateByPrimaryKey(SupplierBrand record);

	List<SupplierBrand> selectAllSupplierBrand();

	List<SupplierBrand> selectBySupplierId(int supplierid);

	List<SupplierBrand> selectByIf(SupplierBrand supplierbrand);
}