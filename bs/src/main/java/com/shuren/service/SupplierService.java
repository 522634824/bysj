package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Supplier;
import com.shuren.pojo.SupplierStaff;

public interface SupplierService {

	public abstract int addSupplier(Supplier supplier);
	
	public abstract void deleteBySupplierid(int supplierid);
	
	public abstract int updateSupplier(Supplier supplier);
	
	public abstract List<Supplier> selectAllSupplier();
}
