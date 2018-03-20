package com.yc.bean;

import java.util.Date;

public class Logininfo {
    private Integer lid;

    private Date ltime;

    private String lname;

    private String lip;

    private String lstatus;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    public Integer getLid() {
        return lid;
    }

    public void setLid(Integer lid) {
        this.lid = lid;
    }

    public Date getLtime() {
        return ltime;
    }

    public void setLtime(Date ltime) {
        this.ltime = ltime;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname == null ? null : lname.trim();
    }

    public String getLip() {
        return lip;
    }

    public void setLip(String lip) {
        this.lip = lip == null ? null : lip.trim();
    }

    public String getLstatus() {
        return lstatus;
    }

    public void setLstatus(String lstatus) {
        this.lstatus = lstatus == null ? null : lstatus.trim();
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

    public Logininfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Logininfo(Integer lid, Date ltime, String lname, String lip, String lstatus, String res1, String res2,
			String res3, String res4) {
		super();
		this.lid = lid;
		this.ltime = ltime;
		this.lname = lname;
		this.lip = lip;
		this.lstatus = lstatus;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.res4 = res4;
	}

	@Override
	public String toString() {
		return "Logininfo [lid=" + lid + ", ltime=" + ltime + ", lname=" + lname + ", lip=" + lip + ", lstatus="
				+ lstatus + ", res1=" + res1 + ", res2=" + res2 + ", res3=" + res3 + ", res4=" + res4 + "]";
	}

	public String getRes4() {
        return res4;
    }

    public void setRes4(String res4) {
        this.res4 = res4 == null ? null : res4.trim();
    }
}