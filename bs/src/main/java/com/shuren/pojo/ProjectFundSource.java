package com.shuren.pojo;

public class ProjectFundSource {
    private Integer projectfundsourceid;

    private String name;

    private String howmuch;

    private String remark;

    public Integer getProjectfundsourceid() {
        return projectfundsourceid;
    }

    public void setProjectfundsourceid(Integer projectfundsourceid) {
        this.projectfundsourceid = projectfundsourceid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getHowmuch() {
        return howmuch;
    }

    public void setHowmuch(String howmuch) {
        this.howmuch = howmuch == null ? null : howmuch.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}