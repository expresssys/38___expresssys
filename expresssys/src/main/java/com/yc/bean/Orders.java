package com.yc.bean;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Orders implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer osid;

    private String osendname;

    private String osendtel;

    private String osendaddress;

    private String orecname;

    private String orectel;

    private String orecaddress;

    private String oreccode;

    private String orecphone;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  
    private Date otime=new Date(new java.util.Date().getTime());

    private Double oprice;

    private Double oinsureprice;

    private Integer otype;

    private Integer ostatus;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")  
    private Date ostarttime=new Date(new java.util.Date().getTime());

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 
    private Date oendtime=new Date(new java.util.Date().getTime());

    private String orecspname;

    private String oremark;

    private Integer usid;

    private Integer spid;

    private String res1;

    private String res2;

    private String res3;

    private String res4;
    
    private String otimeString;
    private String ostarttimeString;
    private String oendtimeString;

    public String getOtimeString() {
    	DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.otimeString=df.format(new Date(this.otime.getTime()));
		return otimeString;
	}

	public void setOtimeString(String otimeString) {
		this.otimeString=otimeString;
	}

	public String getOstarttimeString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.ostarttimeString=df.format(new Date(this.ostarttime.getTime()));
		return ostarttimeString;
	}

	public Orders(Integer osid, String osendname, String osendtel, String osendaddress, String orecname, String orectel,
			String orecaddress, String oreccode, String orecphone, Date otime, Double oprice, Double oinsureprice,
			Integer otype, Integer ostatus, Date ostarttime, Date oendtime, String orecspname, String oremark,
			Integer usid, Integer spid, String res1, String res2, String res3, String res4, String otimeString,
			String ostarttimeString, String oendtimeString) {
		super();
		this.osid = osid;
		this.osendname = osendname;
		this.osendtel = osendtel;
		this.osendaddress = osendaddress;
		this.orecname = orecname;
		this.orectel = orectel;
		this.orecaddress = orecaddress;
		this.oreccode = oreccode;
		this.orecphone = orecphone;
		this.otime = otime;
		this.oprice = oprice;
		this.oinsureprice = oinsureprice;
		this.otype = otype;
		this.ostatus = ostatus;
		this.ostarttime = ostarttime;
		this.oendtime = oendtime;
		this.orecspname = orecspname;
		this.oremark = oremark;
		this.usid = usid;
		this.spid = spid;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.res4 = res4;
		this.otimeString = otimeString;
		this.ostarttimeString = ostarttimeString;
		this.oendtimeString = oendtimeString;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public void setOstarttimeString(String ostarttimeString) {
		this.ostarttimeString = ostarttimeString;
	}

	public String getOendtimeString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		this.oendtimeString=df.format(new Date(this.oendtime.getTime()));
		return oendtimeString;
	}

	public void setOendtimeString(String oendtimeString) {
		this.oendtimeString = oendtimeString;
	}

	public Integer getOsid() {
        return osid;
    }

    public void setOsid(Integer osid) {
        this.osid = osid;
    }

    public String getOsendname() {
        return osendname;
    }

    public void setOsendname(String osendname) {
        this.osendname = osendname == null ? null : osendname.trim();
    }

    public String getOsendtel() {
        return osendtel;
    }

    @Override
	public String toString() {
		return "Orders [osid=" + osid + ", osendname=" + osendname + ", osendtel=" + osendtel + ", osendaddress="
				+ osendaddress + ", orecname=" + orecname + ", orectel=" + orectel + ", orecaddress=" + orecaddress
				+ ", oreccode=" + oreccode + ", orecphone=" + orecphone + ", otime=" + otime + ", oprice=" + oprice
				+ ", oinsureprice=" + oinsureprice + ", otype=" + otype + ", ostatus=" + ostatus + ", ostarttime="
				+ ostarttime + ", oendtime=" + oendtime + ", orecspname=" + orecspname + ", oremark=" + oremark
				+ ", usid=" + usid + ", spid=" + spid + ", res1=" + res1 + ", res2=" + res2 + ", res3=" + res3
				+ ", res4=" + res4 + ", otimeString=" + otimeString + ", ostarttimeString=" + ostarttimeString
				+ ", oendtimeString=" + oendtimeString + "]";
	}

	public void setOsendtel(String osendtel) {
        this.osendtel = osendtel == null ? null : osendtel.trim();
    }

    public String getOsendaddress() {
        return osendaddress;
    }

    public void setOsendaddress(String osendaddress) {
        this.osendaddress = osendaddress == null ? null : osendaddress.trim();
    }

    public String getOrecname() {
        return orecname;
    }

    public void setOrecname(String orecname) {
        this.orecname = orecname == null ? null : orecname.trim();
    }

    public String getOrectel() {
        return orectel;
    }

    public void setOrectel(String orectel) {
        this.orectel = orectel == null ? null : orectel.trim();
    }

    public String getOrecaddress() {
        return orecaddress;
    }

    public void setOrecaddress(String orecaddress) {
        this.orecaddress = orecaddress == null ? null : orecaddress.trim();
    }

    public String getOreccode() {
        return oreccode;
    }

    public void setOreccode(String oreccode) {
        this.oreccode = oreccode == null ? null : oreccode.trim();
    }

    public String getOrecphone() {
        return orecphone;
    }

    public void setOrecphone(String orecphone) {
        this.orecphone = orecphone == null ? null : orecphone.trim();
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getOtime() {
        return otime;
    }

    public void setOtime(Date otime) {
        this.otime = otime;
    }

    public Double getOprice() {
        return oprice;
    }

    public void setOprice(Double oprice) {
        this.oprice = oprice;
    }

    public Double getOinsureprice() {
        return oinsureprice;
    }

    public void setOinsureprice(Double oinsureprice) {
        this.oinsureprice = oinsureprice;
    }

    public Integer getOtype() {
        return otype;
    }

    public void setOtype(Integer otype) {
        this.otype = otype;
    }

    public Integer getOstatus() {
        return ostatus;
    }

    public void setOstatus(Integer ostatus) {
        this.ostatus = ostatus;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getOstarttime() {
        return ostarttime;
    }

    public void setOstarttime(Date ostarttime) {
        this.ostarttime = ostarttime;
    }
    
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")  
    public Date getOendtime() {
        return oendtime;
    }

    public void setOendtime(Date oendtime) {
        this.oendtime = oendtime;
    }

    public String getOrecspname() {
        return orecspname;
    }

    public void setOrecspname(String orecspname) {
        this.orecspname = orecspname == null ? null : orecspname.trim();
    }

    public String getOremark() {
        return oremark;
    }

    public void setOremark(String oremark) {
        this.oremark = oremark == null ? null : oremark.trim();
    }

    public Integer getUsid() {
        return usid;
    }

    public void setUsid(Integer usid) {
        this.usid = usid;
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