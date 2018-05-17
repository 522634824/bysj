package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.SupplierMapper;
import com.shuren.mapper.SupplierStaffMapper;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierBrand;
import com.shuren.pojo.SupplierStaff;
import com.shuren.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService{

	
	@Resource
	private SupplierMapper mapper;
		
	@Override
	public int addSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		mapper.insertSelective(supplier);
		return 1;
	}

	@Override
	public void deleteBySupplierid(int supplierid) {
		// TODO Auto-generated method stub
		mapper.deleteByPrimaryKey(supplierid);
	}

	@Override
	public int updateSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryKeySelective(supplier);
		return 1;
	}

	@Override
	public List<Supplier> selectAllSupplier() {
		// TODO Auto-generated method stub
		return mapper.selectAllSupplier();
	}

	@Override
	public List<Supplier> selectByBrand(SupplierBrand brand) {
		// TODO Auto-generated method stub
		return mapper.selectByBrand(brand);
	}

}
