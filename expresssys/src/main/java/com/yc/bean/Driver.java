package com.yc.bean;

public class Driver {
    private Integer did;

    private String dname;

    private String dnumber;

    private String dphone;

    private String didcard;

    private Integer ddage;

    private Integer dstatus;

    private Integer spid;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    @Override
	public String toString() {
		return "Driver [did=" + did + ", dname=" + dname + ", dnumber=" + dnumber + ", dphone=" + dphone + ", didcard="
				+ didcard + ", ddage=" + ddage + ", dstatus=" + dstatus + ", spid=" + spid + ", res1=" + res1
				+ ", res2=" + res2 + ", res3=" + res3 + ", res4=" + res4 + "]";
	}

	public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname == null ? null : dname.trim();
    }

    public String getDnumber() {
        return dnumber;
    }

    public void setDnumber(String dnumber) {
        this.dnumber = dnumber == null ? null : dnumber.trim();
    }

    public String getDphone() {
        return dphone;
    }

    public void setDphone(String dphone) {
        this.dphone = dphone == null ? null : dphone.trim();
    }

    public String getDidcard() {
        return didcard;
    }

    public void setDidcard(String didcard) {
        this.didcard = didcard == null ? null : didcard.trim();
    }

    public Integer getDdage() {
        return ddage;
    }

    public void setDdage(Integer ddage) {
        this.ddage = ddage;
    }

    public Integer getDstatus() {
        return dstatus;
    }

    public void setDstatus(Integer dstatus) {
        this.dstatus = dstatus;
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

    public String getRes4() {
        return res4;
    }

    public void setRes4(String res4) {
        this.res4 = res4 == null ? null : res4.trim();
    }
}