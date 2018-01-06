package com.yc.bean;


public class Handover {
    private Integer hid;

    private String hfromSpname;

    private String htoSpname;

    private String hstartTime;

    private String hendTime;

    private Integer hstatus;

    private Integer cid;

    private Integer did;

    private Integer osid;

    private Integer rid;

    private String hremark;

    private String res1;

    private String res2;

    private String res3;

    private String res4;
    
    private String rname;
    
    private Integer spid;
    
    private String spname;
    
    private String nextd;
    
    private String dname;
    
    private String ctype;
    
    private String cnumber;
    
    private String orecName;
    
	public Handover() {
		super();
	}

	public Handover(Integer hid, String hfromSpname, String htoSpname, String hstartTime, String hendTime,
			Integer hstatus, Integer cid, Integer did, Integer osid, Integer rid, String hremark, String res1,
			String res2, String res3, String res4, String rname, Integer spid, String spname, String nextd,
			String dname, String ctype, String cnumber, String orecName) {
		super();
		this.hid = hid;
		this.hfromSpname = hfromSpname;
		this.htoSpname = htoSpname;
		this.hstartTime = hstartTime;
		this.hendTime = hendTime;
		this.hstatus = hstatus;
		this.cid = cid;
		this.did = did;
		this.osid = osid;
		this.rid = rid;
		this.hremark = hremark;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.res4 = res4;
		this.rname = rname;
		this.spid = spid;
		this.spname = spname;
		this.nextd = nextd;
		this.dname = dname;
		this.ctype = ctype;
		this.cnumber = cnumber;
		this.orecName = orecName;
	}

	@Override
	public String toString() {
		return "Handover [hid=" + hid + ", hfromSpname=" + hfromSpname + ", htoSpname=" + htoSpname + ", hstartTime="
				+ hstartTime + ", hendTime=" + hendTime + ", hstatus=" + hstatus + ", cid=" + cid + ", did=" + did
				+ ", osid=" + osid + ", rid=" + rid + ", hremark=" + hremark + ", res1=" + res1 + ", res2=" + res2
				+ ", res3=" + res3 + ", res4=" + res4 + ", rname=" + rname + ", spid=" + spid + ", spname=" + spname
				+ ", nextd=" + nextd + ", dname=" + dname + ", ctype=" + ctype + ", cnumber=" + cnumber + ", orecName="
				+ orecName + "]";
	}

	public String getOrecName() {
		return orecName;
	}

	public void setOrecName(String orecName) {
		this.orecName = orecName;
	}

	public String getCnumber() {
		return cnumber;
	}

	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
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

	public Integer getHstatus() {
		return hstatus;
	}

	public void setHstatus(Integer hstatus) {
		this.hstatus = hstatus;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getOsid() {
		return osid;
	}

	public void setOsid(Integer osid) {
		this.osid = osid;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getHremark() {
		return hremark;
	}

	public void setHremark(String hremark) {
		this.hremark = hremark;
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

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public Integer getSpid() {
		return spid;
	}

	public void setSpid(Integer spid) {
		this.spid = spid;
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public String getNextd() {
		return nextd;
	}

	public void setNextd(String nextd) {
		this.nextd = nextd;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
    
	
}