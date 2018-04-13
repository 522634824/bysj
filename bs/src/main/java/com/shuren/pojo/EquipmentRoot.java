package com.shuren.pojo;

public class EquipmentRoot {
    private Integer equipmentrootid;

    private String name;

    private String explain;

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

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain == null ? null : explain.trim();
    }
}