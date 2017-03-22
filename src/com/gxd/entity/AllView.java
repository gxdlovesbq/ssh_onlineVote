package com.gxd.entity;

public class AllView {
	private String voOption;
	private int oid;
	private int vcount;
	public AllView() {
		super();
	}
	public AllView(String voOption, int oid, int vcount) {
		super();
		this.voOption = voOption;
		this.oid = oid;
		this.vcount = vcount;
	}
	public String getVoOption() {
		return voOption;
	}
	public void setVoOption(String voOption) {
		this.voOption = voOption;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getVcount() {
		return vcount;
	}
	public void setVcount(int vcount) {
		this.vcount = vcount;
	}
	
}
