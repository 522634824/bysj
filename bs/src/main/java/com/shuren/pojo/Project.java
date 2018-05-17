package com.shuren.pojo;

import java.util.Date;

public class Project {
    private String projectid;

    private String name;

    private String overview;

    private String purchasenumber;

    private Integer userid;

    private String performer;

    private String contractcode;

    private Date startdate;

    private Date completedate;

    private Integer state;
    
    private int completecount;

    public int getCompletecount() {
		return completecount;
	}

	public void setCompletecount(int completecount) {
		this.completecount = completecount;
	}

	public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid == null ? null : projectid.trim();
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

    public String getContractcode() {
        return contractcode;
    }

    public void setContractcode(String contractcode) {
        this.contractcode = contractcode == null ? null : contractcode.trim();
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
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

	@Override
	public String toString() {
		return "Project [projectid=" + projectid + ", name=" + name + ", overview=" + overview + ", purchasenumber="
				+ purchasenumber + ", userid=" + userid + ", performer=" + performer + ", contractcode=" + contractcode
				+ ", startdate=" + startdate + ", completedate=" + completedate + ", state=" + state
				+ ", completecount=" + completecount + "]";
	}

	
    
}