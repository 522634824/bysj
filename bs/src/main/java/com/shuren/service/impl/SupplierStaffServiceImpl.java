package com.shuren.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shuren.mapper.SupplierStaffMapper;
import com.shuren.pojo.SupplierStaff;
import com.shuren.service.SupplierStaffService;

@Service
public class SupplierStaffServiceImpl implements SupplierStaffService{

	
	@Resource
	private SupplierStaffMapper mapper;

	@Override
	public List<SupplierStaff> selectAllSupplierStaff() {
		// TODO Auto-generated method stub
		return mapper.selectAllSupplierStaff();
	}

	@Override
	public List<SupplierStaff> selectStaffBySupplierid(int supplierid) {
		// TODO Auto-generated method stub
		return mapper.selectStaffBySupplierid(supplierid);
	}

	@Override
	public int updateSupplierstaff(SupplierStaff supplierstaff) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryKeySelective(supplierstaff);
		return 1;
	}

	@Override
	public int addSupplierstaff(SupplierStaff supplierstaff) {
		// TODO Auto-generated method stub
		mapper.insertSelective(supplierstaff);
		return 1;
	}

	@Override
	public void deleteBySupplierstaffid(int supplierstaffid) {
		// TODO Auto-generated method stub
		mapper.deleteByPrimaryKey(supplierstaffid);
	}

}
