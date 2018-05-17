package com.shuren.pojo;

import java.util.Date;

public class ProjectReply {
    private String projectreplyid;

    private String name;

    private String overview;

    private Integer userid;

    private String performer;

    private String howmuch;

    private String remark;

    private Integer state;

    private String approver1;

    private String approver2;

    private Date submitdate;

    public String getProjectreplyid() {
        return projectreplyid;
    }

    public void setProjectreplyid(String projectreplyid) {
        this.projectreplyid = projectreplyid == null ? null : projectreplyid.trim();
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getApprover1() {
        return approver1;
    }

    public void setApprover1(String approver1) {
        this.approver1 = approver1 == null ? null : approver1.trim();
    }

    public String getApprover2() {
        return approver2;
    }

    public void setApprover2(String approver2) {
        this.approver2 = approver2 == null ? null : approver2.trim();
    }

   
    public Date getSubmitdate() {
        return submitdate;
    }

    public void setSubmitdate(Date submitdate) {
        this.submitdate = submitdate;
    }

	@Override
	public String toString() {
		return "ProjectReply [projectreplyid=" + projectreplyid + ", name=" + name + ", overview=" + overview
				+ ", userid=" + userid + ", performer=" + performer + ", howmuch=" + howmuch + ", remark=" + remark
				+ ", state=" + state + ", approver1=" + approver1 + ", approver2=" + approver2 + ", submitdate="
				+ submitdate + "]";
	}
    
    
}