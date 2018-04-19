package com.shuren.pojo;

import java.util.Date;

public class Project {
    private String projectinforid;

    private String name;

    private String overview;

    private Integer projectyear;

    private String purchasenumber;

    private Integer userid;

    private String performer;

    private Integer supplierid;

    private Date contractcode;

    private Date completedate;

    private Integer state;

    public String getProjectinforid() {
        return projectinforid;
    }

    public void setProjectinforid(String projectinforid) {
        this.projectinforid = projectinforid == null ? null : projectinforid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview == null ? null : overview.trim();
    }

    public Integer getProjectyear() {
        return projectyear;
    }

    public void setProjectyear(Integer projectyear) {
        this.projectyear = projectyear;
    }

    public String getPurchasenumber() {
        return purchasenumber;
    }

    public void setPurchasenumber(String purchasenumber) {
        this.purchasenumber = purchasenumber == null ? null : purchasenumber.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer == null ? null : performer.trim();
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public Date getContractcode() {
        return contractcode;
    }

    public void setContractcode(Date contractcode) {
        this.contractcode = contractcode;
    }

    public Date getCompletedate() {
        return completedate;
    }

    public void setCompletedate(Date completedate) {
        this.completedate = completedate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}