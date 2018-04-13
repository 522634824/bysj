package com.shuren.pojo;

public class Sup {

	private Supplier supplier;
	private SupplierStaff supplierstaff;
	
	public Sup(Supplier supplier, SupplierStaff supplierstaff) {
		super();
		this.supplier = supplier;
		this.supplierstaff = supplierstaff;
	}
	
	public Sup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public SupplierStaff getSupplierstaff() {
		return supplierstaff;
	}
	public void setSupplierstaff(SupplierStaff supplierstaff) {
		this.supplierstaff = supplierstaff;
	}
	
}
