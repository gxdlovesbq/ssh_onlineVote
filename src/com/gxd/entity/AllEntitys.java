package com.gxd.entity;

public class AllEntitys {
	private String titles;
	private int sid;
	private int ocount;
	private int pcount;

	public AllEntitys() {
		super();
	}

	public AllEntitys(String titles, int sid, int ocount, int pcount) {
		super();
		this.titles = titles;
		this.sid = sid;
		this.ocount = ocount;
		this.pcount = pcount;
	}

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getOcount() {
		return ocount;
	}

	public void setOcount(int ocount) {
		this.ocount = ocount;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	
}
