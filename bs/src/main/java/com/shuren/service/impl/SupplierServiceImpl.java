package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.SupplierMapper;
import com.shuren.pojo.Sup;
import com.shuren.pojo.Supplier;
import com.shuren.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService{

	
	@Resource
	private SupplierMapper mapper;
	@Override
	public void addSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		mapper.insertSelective(supplier);
	}

	@Override
	public void deleteSupplier(int supplierid) {
		// TODO Auto-generated method stub
		mapper.deleteByPrimaryKey(supplierid);
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryKeySelective(supplier);
	}

	@Override
	public List<Supplier> selectAllSupplier() {
		// TODO Auto-generated method stub
		return mapper.selectAllSupplier();
	}

}
