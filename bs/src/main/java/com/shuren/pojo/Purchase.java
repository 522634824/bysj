package com.shuren.pojo;

import java.math.BigDecimal;

public class Purchase {
    private Integer purchaseid;

    private Integer purchasenumber;

    private Integer equipmentid;

    private Integer num;

    private BigDecimal price;

    private String userid;

    public Integer getPurchaseid() {
        return purchaseid;
    }

    public void setPurchaseid(Integer purchaseid) {
        this.purchaseid = purchaseid;
    }

    public Integer getPurchasenumber() {
        return purchasenumber;
    }

    public void setPurchasenumber(Integer purchasenumber) {
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }
}