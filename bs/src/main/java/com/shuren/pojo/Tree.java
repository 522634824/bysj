package com.shuren.pojo;

public class Tree {
	private String id; // 节点id
	private String text; // 显示的节点文本
	private String state = "open"; // 节点状态,'open'或者'closed',默认是'open'
	private boolean checked; // 指明检查节点是否选中.
	
	public Tree() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tree(String id, String text, String state, boolean checked) {
		super();
		this.id = id;
		this.text = text;
		this.state = state;
		this.checked = checked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	

}