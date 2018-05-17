package com.shuren.pojo;

public class Supplier {
    private Integer supplierid;

    private Integer suppliertypeid;

    private String name;

    private String address;

    private String tel;

    private String managementcontent;

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public Integer getSuppliertypeid() {
        return suppliertypeid;
    }

    public void setSuppliertypeid(Integer suppliertypeid) {
        this.suppliertypeid = suppliertypeid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getManagementcontent() {
        return managementcontent;
    }

    public void setManagementcontent(String managementcontent) {
        this.managementcontent = managementcontent == null ? null : managementcontent.trim();
    }

	@Override
	public String toString() {
		return "Supplier [supplierid=" + supplierid + ", suppliertypeid=" + suppliertypeid + ", name=" + name
				+ ", address=" + address + ", tel=" + tel + ", managementcontent=" + managementcontent + "]";
	}
    
}