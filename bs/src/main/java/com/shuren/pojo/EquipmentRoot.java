package com.shuren.pojo;

public class EquipmentRoot {
    private Integer equipmentrootid;

    private String name;

    private String remark;

    public Integer getEquipmentrootid() {
        return equipmentrootid;
    }

    public void setEquipmentrootid(Integer equipmentrootid) {
        this.equipmentrootid = equipmentrootid;
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