package com.shuren.pojo;

public class SupplierBrand {
    private Integer supplierbrandid;

    private Integer supplierid;

    private String name;

    public Integer getSupplierbrandid() {
        return supplierbrandid;
    }

    public void setSupplierbrandid(Integer supplierbrandid) {
        this.supplierbrandid = supplierbrandid;
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
}