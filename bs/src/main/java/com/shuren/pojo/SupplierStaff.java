package com.shuren.pojo;

public class SupplierStaff {
    private Integer supplierstaffid;

    private Integer supplierid;

    private String name;

    private String num;

    private String email;

    private String tel;

    private String remark;

    public Integer getSupplierstaffid() {
        return supplierstaffid;
    }

    public void setSupplierstaffid(Integer supplierstaffid) {
        this.supplierstaffid = supplierstaffid;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num == null ? null : num.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "SupplierStaff [supplierstaffid=" + supplierstaffid + ", supplierid=" + supplierid + ", name=" + name
				+ ", num=" + num + ", email=" + email + ", tel=" + tel + ", remark=" + remark + "]";
	}
    
}