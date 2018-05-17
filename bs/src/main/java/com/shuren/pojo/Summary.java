package com.shuren.pojo;

public class Summary {
    private Integer summaryid;

    private String projectid;

    private String summarycontent;

    private Integer userid;

    private String submitter;

    public Integer getSummaryid() {
        return summaryid;
    }

    public void setSummaryid(Integer summaryid) {
        this.summaryid = summaryid;
    }

    public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid == null ? null : projectid.trim();
    }

    public String getSummarycontent() {
        return summarycontent;
    }

    public void setSummarycontent(String summarycontent) {
        this.summarycontent = summarycontent == null ? null : summarycontent.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getSubmitter() {
        return submitter;
    }

    public void setSubmitter(String submitter) {
        this.submitter = submitter == null ? null : submitter.trim();
    }
}