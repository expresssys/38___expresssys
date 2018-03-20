package com.yc.bean;

public class Proxy {
    private Integer prid;

    private String prname;

    private String prtime;

    private Double prprice;

    private String prremark;

    private Integer spid;

    private String res1;

    private String res2; //地址

    private String res3;
    
    private String spname;
    
    private String stime;
    
    private String etime;
    
	public Proxy() {
		super();
	}

	public Proxy(Integer prid, String prname, String prtime, Double prprice, String prremark, Integer spid, String res1,
			String res2, String res3, String spname, String stime, String etime) {
		super();
		this.prid = prid;
		this.prname = prname;
		this.prtime = prtime;
		this.prprice = prprice;
		this.prremark = prremark;
		this.spid = spid;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.spname = spname;
		this.stime = stime;
		this.etime = etime;
	}

	@Override
	public String toString() {
		return "Proxy [prid=" + prid + ", prname=" + prname + ", prtime=" + prtime + ", prprice=" + prprice
				+ ", prremark=" + prremark + ", spid=" + spid + ", res1=" + res1 + ", res2=" + res2 + ", res3=" + res3
				+ ", spname=" + spname + ", stime=" + stime + ", etime=" + etime + "]";
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public Integer getPrid() {
        return prid;
    }

    public void setPrid(Integer prid) {
        this.prid = prid;
    }

    public String getPrname() {
        return prname;
    }

    public void setPrname(String prname) {
        this.prname = prname == null ? null : prname.trim();
    }

    public String getPrtime() {
        return prtime;
    }

	public void setPrtime(String prtime) {
        this.prtime = prtime == null ? null : prtime.trim();
    }

    public Double getPrprice() {
        return prprice;
    }

    public void setPrprice(Double prprice) {
        this.prprice = prprice;
    }

    public String getPrremark() {
        return prremark;
    }

    public void setPrremark(String prremark) {
        this.prremark = prremark == null ? null : prremark.trim();
    }

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public String getRes1() {
        return res1;
    }

    public void setRes1(String res1) {
        this.res1 = res1 == null ? null : res1.trim();
    }

    public String getRes2() {
        return res2;
    }

    public void setRes2(String res2) {
        this.res2 = res2 == null ? null : res2.trim();
    }

    public String getRes3() {
        return res3;
    }

    public void setRes3(String res3) {
        this.res3 = res3 == null ? null : res3.trim();
    }
}