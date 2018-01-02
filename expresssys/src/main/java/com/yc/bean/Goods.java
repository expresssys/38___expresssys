package com.yc.bean;

public class Goods {
     private Integer gid;
	 private String gname;
	 private Integer gcount;
	 private String gunit;
	 private Double gprice;
	 private Double gweight;
	 private Double gvolume;
	 private String gtype;
	 private String gremark;
	 
	 private String res1;
	 private String res2;
	 private String res3;
	 private String res4;
	public Integer getGid() {
		return gid;
	}
	public void setGid(Integer gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Integer getGcount() {
		return gcount;
	}
	public void setGcount(Integer gcount) {
		this.gcount = gcount;
	}
	public String getGunit() {
		return gunit;
	}
	public void setGunit(String gunit) {
		this.gunit = gunit;
	}
	public Double getGprice() {
		return gprice;
	}
	public void setGprice(Double gprice) {
		this.gprice = gprice;
	}
	public Double getGweight() {
		return gweight;
	}
	public void setGweight(Double gweight) {
		this.gweight = gweight;
	}
	public Double getGvolume() {
		return gvolume;
	}
	public void setGvolume(Double gvolume) {
		this.gvolume = gvolume;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public String getGremark() {
		return gremark;
	}
	public void setGremark(String gremark) {
		this.gremark = gremark;
	}
	public String getRes1() {
		return res1;
	}
	public void setRes1(String res1) {
		this.res1 = res1;
	}
	public String getRes2() {
		return res2;
	}
	public void setRes2(String res2) {
		this.res2 = res2;
	}
	public String getRes3() {
		return res3;
	}
	public void setRes3(String res3) {
		this.res3 = res3;
	}
	public String getRes4() {
		return res4;
	}
	public void setRes4(String res4) {
		this.res4 = res4;
	}
	@Override
	public String toString() {
		return "Goods [gid=" + gid + ", gname=" + gname + ", gcount=" + gcount + ", gunit=" + gunit + ", gprice="
				+ gprice + ", gweight=" + gweight + ", gvolume=" + gvolume + ", gtype=" + gtype + ", gremark=" + gremark
				+ ", res1=" + res1 + ", res2=" + res2 + ", res3=" + res3 + ", res4=" + res4 + "]";
	}
	 
	 
	 
}
