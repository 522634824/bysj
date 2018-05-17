package com.shuren.pojo;

import java.text.NumberFormat;

public class ProjectStat {

	private Integer userid;

	private String performer;

	private Integer completecount;

	private String howmuch;

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
		this.performer = performer;
	}

	public Integer getCompletecount() {
		return completecount;
	}

	public void setCompletecount(Integer completecount) {
		this.completecount = completecount;
	}

	public String getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(String howmuch) {
		this.howmuch = howmuch;
	}

	@Override
	public String toString() {
		return "ProjectStat [userid=" + userid + ", performer=" + performer + ", completecount=" + completecount
				+ ", howmuch=" + howmuch + "]";
	}

}