package com.shuren.pojo;

public class SupplierStaff {
    private Integer supplierstaffid;

    private Integer supplierid;

    private String name;

    private String email;

    private String tel;

    private Integer function;

    private String explain;

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

    public Integer getFunction() {
        return function;
    }

    public void setFunction(Integer function) {
        this.function = function;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain == null ? null : explain.trim();
    }
}