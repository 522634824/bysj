package com.shuren.pojo;

public class Purchase {
    private Integer purchaseid;

    private String purchasenumber;

    private Integer equipmentid;

    private Integer num;

    private Float price;

    private String userid;

    private Integer supplierid;

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
        this.purchasenumber = purchasenumber == null ? null : purchasenumber.trim();
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
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

	@Override
	public String toString() {
		return "Purchase [purchaseid=" + purchaseid + ", purchasenumber=" + purchasenumber + ", equipmentid="
				+ equipmentid + ", num=" + num + ", price=" + price + ", userid=" + userid + ", supplierid="
				+ supplierid + "]";
	}
    
}