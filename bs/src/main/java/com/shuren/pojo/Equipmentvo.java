package com.shuren.pojo;

public class Equipmentvo {
    private Integer equipmentid;

    private Integer equipmentclassid;

    private Integer supplierbrandid;

    private String model;

    private String name;

    private String remark;

    private EquipmentClass equipmentclass;
    
    private SupplierBrand supplierbrand;
    
    private Supplier supplier;

	public Equipmentvo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Equipmentvo(Integer equipmentid, Integer equipmentclassid, Integer supplierbrandid, String model,
			String name, String remark, EquipmentClass equipmentclass, SupplierBrand supplierbrand, Supplier supplier) {
		super();
		this.equipmentid = equipmentid;
		this.equipmentclassid = equipmentclassid;
		this.supplierbrandid = supplierbrandid;
		this.model = model;
		this.name = name;
		this.remark = remark;
		this.equipmentclass = equipmentclass;
		this.supplierbrand = supplierbrand;
		this.supplier = supplier;
	}

	public Integer getEquipmentid() {
		return equipmentid;
	}

	public void setEquipmentid(Integer equipmentid) {
		this.equipmentid = equipmentid;
	}

	public Integer getEquipmentclassid() {
		return equipmentclassid;
	}

	public void setEquipmentclassid(Integer equipmentclassid) {
		this.equipmentclassid = equipmentclassid;
	}

	public Integer getSupplierbrandid() {
		return supplierbrandid;
	}

	public void setSupplierbrandid(Integer supplierbrandid) {
		this.supplierbrandid = supplierbrandid;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public EquipmentClass getEquipmentclass() {
		return equipmentclass;
	}

	public void setEquipmentclass(EquipmentClass equipmentclass) {
		this.equipmentclass = equipmentclass;
	}

	public SupplierBrand getSupplierbrand() {
		return supplierbrand;
	}

	public void setSupplierbrand(SupplierBrand supplierbrand) {
		this.supplierbrand = supplierbrand;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	@Override
	public String toString() {
		return "Equipmentvo [equipmentid=" + equipmentid + ", equipmentclassid=" + equipmentclassid
				+ ", supplierbrandid=" + supplierbrandid + ", model=" + model + ", name=" + name + ", remark=" + remark
				+ ", equipmentclass=" + equipmentclass + ", supplierbrand=" + supplierbrand + ", supplier=" + supplier
				+ "]";
	}

	
}