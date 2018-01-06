package com.yc.bean;

public class Excel {
	private Integer osid;
	private String hfromSpname;
	private String htoSpname;
	private String orecName;
	private String hstartTime;
	private String hendTime;
	private String cnumber;
	private String dname;
	
	public Excel() {
		super();
	}
	public Excel(Integer osid, String hfromSpname, String htoSpname, String orecName, String hstartTime,
			String hendTime, String cnumber, String dname) {
		super();
		this.osid = osid;
		this.hfromSpname = hfromSpname;
		this.htoSpname = htoSpname;
		this.orecName = orecName;
		this.hstartTime = hstartTime;
		this.hendTime = hendTime;
		this.cnumber = cnumber;
		this.dname = dname;
	}
	@Override
	public String toString() {
		return "Excel [osid=" + osid + ", hfromSpname=" + hfromSpname + ", htoSpname=" + htoSpname + ", orecName="
				+ orecName + ", hstartTime=" + hstartTime + ", hendTime=" + hendTime + ", cnumber=" + cnumber
				+ ", dname=" + dname + "]";
	}
	public Integer getOsid() {
		return osid;
	}
	public void setOsid(Integer osid) {
		this.osid = osid;
	}
	public String getHfromSpname() {
		return hfromSpname;
	}
	public void setHfromSpname(String hfromSpname) {
		this.hfromSpname = hfromSpname;
	}
	public String getHtoSpname() {
		return htoSpname;
	}
	public void setHtoSpname(String htoSpname) {
		this.htoSpname = htoSpname;
	}
	public String getOrecName() {
		return orecName;
	}
	public void setOrecName(String orecName) {
		this.orecName = orecName;
	}
	public String getHstartTime() {
		return hstartTime;
	}
	public void setHstartTime(String hstartTime) {
		this.hstartTime = hstartTime;
	}
	public String getHendTime() {
		return hendTime;
	}
	public void setHendTime(String hendTime) {
		this.hendTime = hendTime;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
	
}
