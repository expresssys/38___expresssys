package com.yc.bean;

import java.util.Date;

public class Car extends CommonBean{
    
	private static final long serialVersionUID = -2509115318296791463L;

	private Integer cid;

    private String cnumber;

    private String ctype;

    private Date cbuyday;

    private String crunnum;

    private Double cvolume;

    private Double cton;

    private Integer cstatus;

    private Integer cisbox;

    private Shippoint shippoint;
    
    private Integer spid;

    public Integer getSpid() {
		return spid;
	}

	public void setSpid(Integer spid) {
		this.spid = spid;
	}

	private String cremark;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCnumber() {
        return cnumber;
    }

    public void setCnumber(String cnumber) {
        this.cnumber = cnumber == null ? null : cnumber.trim();
    }

    public String getCtype() {
        return ctype;
    }

    @Override
	public String toString() {
		return "Car [cid=" + cid + ", cnumber=" + cnumber + ", ctype=" + ctype + ", cbuyday=" + cbuyday + ", crunnum="
				+ crunnum + ", cvolume=" + cvolume + ", cton=" + cton + ", cstatus=" + cstatus + ", cisbox=" + cisbox
				+ ", shippoint=" + shippoint + ", spid=" + spid + ", cremark=" + cremark + ", res1=" + res1 + ", res2="
				+ res2 + ", res3=" + res3 + ", res4=" + res4 + "]";
	}

	public void setCtype(String ctype) {
        this.ctype = ctype == null ? null : ctype.trim();
    }

    public Date getCbuyday() {
        return cbuyday;
    }

    public void setCbuyday(Date cbuyday) {
        this.cbuyday = cbuyday;
    }

    public String getCrunnum() {
        return crunnum;
    }

    public void setCrunnum(String crunnum) {
        this.crunnum = crunnum == null ? null : crunnum.trim();
    }

    public Double getCvolume() {
        return cvolume;
    }

    public void setCvolume(Double cvolume) {
        this.cvolume = cvolume;
    }

    public Double getCton() {
        return cton;
    }

    public void setCton(Double cton) {
        this.cton = cton;
    }

    public Integer getCstatus() {
        return cstatus;
    }

    public void setCstatus(Integer cstatus) {
        this.cstatus = cstatus;
    }

    public Integer getCisbox() {
        return cisbox;
    }

    public void setCisbox(Integer cisbox) {
        this.cisbox = cisbox;
    }

  

    public Shippoint getShippoint() {
		return shippoint;
	}

	public void setShippoint(Shippoint shippoint) {
		this.shippoint = shippoint;
	}

	public String getCremark() {
        return cremark;
    }

    public void setCremark(String cremark) {
        this.cremark = cremark == null ? null : cremark.trim();
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