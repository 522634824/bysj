package com.shuren.pojo;

public class ProjectAndFundSource {
    private Integer projectandfundsourceid;

    private Integer projectinforid;

    private Integer projectfundsourceid;

    private String remark;

    public Integer getProjectandfundsourceid() {
        return projectandfundsourceid;
    }

    public void setProjectandfundsourceid(Integer projectandfundsourceid) {
        this.projectandfundsourceid = projectandfundsourceid;
    }

    public Integer getProjectinforid() {
        return projectinforid;
    }

    public void setProjectinforid(Integer projectinforid) {
        this.projectinforid = projectinforid;
    }

    public Integer getProjectfundsourceid() {
        return projectfundsourceid;
    }

    public void setProjectfundsourceid(Integer projectfundsourceid) {
        this.projectfundsourceid = projectfundsourceid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}