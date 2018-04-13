package com.shuren.pojo;

public class Equipment {
    private Integer equipmentid;

    private String equipmentclassid;

    private String name;

    private String brand;

    private Integer supplierid;

    public Integer getEquipmentid() {
        return equipmentid;
    }

    public void setEquipmentid(Integer equipmentid) {
        this.equipmentid = equipmentid;
    }

    public String getEquipmentclassid() {
        return equipmentclassid;
    }

    public void setEquipmentclassid(String equipmentclassid) {
        this.equipmentclassid = equipmentclassid == null ? null : equipmentclassid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }
}