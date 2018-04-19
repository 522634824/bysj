package com.shuren.service;

import java.util.List;

import com.shuren.pojo.SupplierBrand;

public interface SupplierBrandService {

	List<SupplierBrand> selectAllSupplierBrand();

	List<SupplierBrand> selectBySupplierId(int supplierid);

}
