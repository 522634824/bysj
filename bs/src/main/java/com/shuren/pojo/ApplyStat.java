package com.shuren.pojo;

import java.text.NumberFormat;

public class ApplyStat {

    private Integer userid;

    private String performer;

    private Integer applycount;

    private Integer passapply;

    private Integer unpassapply;

    private Integer pending;
    
    private String passrate;
    
    private String nonpassrate;

    
	public ApplyStat() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public ApplyStat(Integer userid, String performer, Integer applycount, Integer passapply, Integer unpassapply,
			Integer pending, String passrate, String nonpassrate) {
		super();
		this.userid = userid;
		this.performer = performer;
		this.applycount = applycount;
		this.passapply = passapply;
		this.unpassapply = unpassapply;
		this.pending = pending;
		this.passrate = passrate;
		this.nonpassrate = nonpassrate;
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
		this.performer = performer;
	}

	public Integer getApplycount() {
		return applycount;
	}

	public void setApplycount(Integer applycount) {
		this.applycount = applycount;
	}

	public Integer getPassapply() {
		return passapply;
	}

	public void setPassapply(Integer passapply) {
		this.passapply = passapply;
	}

	public Integer getUnpassapply() {
		return unpassapply;
	}

	public void setUnpassapply(Integer unpassapply) {
		this.unpassapply = unpassapply;
	}

	public Integer getPending() {
		return pending;
	}

	public void setPending(Integer pending) {
		this.pending = pending;
	}
	

	public String getPassrate() {
		return passrate;
	}

	public void setPassrate(String passrate) {
		this.passrate = passrate;
	}

	public String getNonpassrate() {
		return nonpassrate;
	}

	public void setNonpassrate(String nonpassrate) {
		this.nonpassrate = nonpassrate;
	}

	@Override
	public String toString() {
		return "ApplyStat [userid=" + userid + ", performer=" + performer + ", applycount=" + applycount
				+ ", passapply=" + passapply + ", unpassapply=" + unpassapply + ", pending=" + pending + ", passrate="
				+ passrate + ", nonpassrate=" + nonpassrate + "]";
	}

	


  
}