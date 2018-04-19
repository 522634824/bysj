package com.shuren.pojo;

public class Equipment {
    private Integer equipmentid;

    private Integer equipmentclassid;

    private Integer supplierbrandid;

    private String model;

    private String name;

    private String remark;

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
        this.model = model == null ? null : model.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}