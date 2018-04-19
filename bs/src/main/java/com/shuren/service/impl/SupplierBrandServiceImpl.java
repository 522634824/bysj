package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.SupplierBrandMapper;
import com.shuren.pojo.SupplierBrand;
import com.shuren.service.SupplierBrandService;

@Service
public class SupplierBrandServiceImpl implements SupplierBrandService {

	@Resource
	private SupplierBrandMapper mapper;
	
	@Override
	public List<SupplierBrand> selectAllSupplierBrand() {
		// TODO Auto-generated method stub
		return mapper.selectAllSupplierBrand();
	}

	@Override
	public List<SupplierBrand> selectBySupplierId(int supplierid) {
		// TODO Auto-generated method stub
		return mapper.selectBySupplierId(supplierid);
	}

}
