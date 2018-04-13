package com.shuren.service;

import java.util.List;

import com.shuren.pojo.Sup;
import com.shuren.pojo.Supplier;

public interface SupplierService {

	public abstract void addSupplier(Supplier supplier);
	
	public abstract void deleteSupplier(int supplierid);
	
	public abstract void updateSupplier(Supplier supplier);
	
	public abstract List<Supplier> selectAllSupplier();
	
}
