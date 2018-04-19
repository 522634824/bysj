package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuren.mapper.SupplierMapper;
import com.shuren.mapper.SupplierStaffMapper;
import com.shuren.mapper.SupplierTypeMapper;
import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierStaff;
import com.shuren.pojo.SupplierType;
import com.shuren.service.SupplierService;
import com.shuren.service.SupplierTypeService;

@Service
public class SupplierTypeServiceImpl implements SupplierTypeService{

	
	@Resource
	private SupplierTypeMapper mapper;

	@Override
	public List<SupplierType> selectAllSupplierType() {
		// TODO Auto-generated method stub
		return mapper.selectAllSupplierType();
	}
	
	
}
