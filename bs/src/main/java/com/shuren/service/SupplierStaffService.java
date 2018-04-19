package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierStaff;

public interface SupplierStaffService {

	public abstract List<SupplierStaff> selectAllSupplierStaff();
	
	public abstract List<SupplierStaff> selectStaffBySupplierid(int supplierid);

	public abstract int updateSupplierstaff(SupplierStaff supplierstaff);

	public abstract int addSupplierstaff(SupplierStaff supplierstaff);

	public abstract void deleteBySupplierstaffid(int supplierstaffid);
}
