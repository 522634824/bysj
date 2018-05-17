package com.shuren.pojo;

public class Purchasevo {
	private Integer purchaseid;

	private String purchasenumber;

	private Integer equipmentid;

	private Integer num;

	private Float price;

	private String userid;

	private Integer supplierid;

	private Equipment equipment;

	private Supplier supplier;

	public Purchasevo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Purchasevo(Integer purchaseid, String purchasenumber, Integer equipmentid, Integer num, Float price,
			String userid, Integer supplierid, Equipment equipment, Supplier supplier) {
		super();
		this.purchaseid = purchaseid;
		this.purchasenumber = purchasenumber;
		this.equipmentid = equipmentid;
		this.num = num;
		this.price = price;
		this.userid = userid;
		this.supplierid = supplierid;
		this.equipment = equipment;
		this.supplier = supplier;
	}

	public Integer getPurchaseid() {
		return purchaseid;
	}

	public void setPurchaseid(Integer purchaseid) {
		this.purchaseid = purchaseid;
	}

	public String getPurchasenumber() {
		return purchasenumber;
	}

	public void setPurchasenumber(String purchasenumber) {
		this.purchasenumber = purchasenumber;
	}

	public Integer getEquipmentid() {
		return equipmentid;
	}

	public void setEquipmentid(Integer equipmentid) {
		this.equipmentid = equipmentid;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(Integer supplierid) {
		this.supplierid = supplierid;
	}

	public Equipment getEquipment() {
		return equipment;
	}

	public void setEquipment(Equipment equipment) {
		this.equipment = equipment;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	@Override
	public String toString() {
		return "Purchasevo [purchaseid=" + purchaseid + ", purchasenumber=" + purchasenumber + ", equipmentid="
				+ equipmentid + ", num=" + num + ", price=" + price + ", userid=" + userid + ", supplierid="
				+ supplierid + ", equipment=" + equipment + ", supplier=" + supplier + "]";
	}

	
}
