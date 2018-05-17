package com.shuren.pojo;

public class Howmuch {

	private String performer;
	private float howmuch;
	
	public String getPerformer() {
		return performer;
	}
	public void setPerformer(String performer) {
		this.performer = performer;
	}
	public float getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(float howmuch) {
		this.howmuch = howmuch;
	}
	@Override
	public String toString() {
		return "Howmuch [performer=" + performer + ", howmuch=" + howmuch + "]";
	}
	
}

