package com.yc.bean;

public class Shippoint {
    private Integer spid;

    private String spname;

    private String spperson;

    private String sptel;

    private String spemail;

    private String spaddress;

    private String sppersontel;

    private String spfax;

    private String sparea;

    private String spremark;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    @Override
	public String toString() {
		return "Shippoint [spid=" + spid + ", spname=" + spname + ", spperson=" + spperson + ", sptel=" + sptel
				+ ", spemail=" + spemail + ", spaddress=" + spaddress + ", sppersontel=" + sppersontel + ", spfax="
				+ spfax + ", sparea=" + sparea + ", spremark=" + spremark + ", res1=" + res1 + ", res2=" + res2
				+ ", res3=" + res3 + ", res4=" + res4 + "]";
	}

	public String getSpname() {
        return spname;
    }

    public void setSpname(String spname) {
        this.spname = spname == null ? null : spname.trim();
    }

    public String getSpperson() {
        return spperson;
    }

    public void setSpperson(String spperson) {
        this.spperson = spperson == null ? null : spperson.trim();
    }

    public String getSptel() {
        return sptel;
    }

    public void setSptel(String sptel) {
        this.sptel = sptel == null ? null : sptel.trim();
    }

    public String getSpemail() {
        return spemail;
    }

    public void setSpemail(String spemail) {
        this.spemail = spemail == null ? null : spemail.trim();
    }

    public String getSpaddress() {
        return spaddress;
    }

    public void setSpaddress(String spaddress) {
        this.spaddress = spaddress == null ? null : spaddress.trim();
    }

    public String getSppersontel() {
        return sppersontel;
    }

    public void setSppersontel(String sppersontel) {
        this.sppersontel = sppersontel == null ? null : sppersontel.trim();
    }

    public String getSpfax() {
        return spfax;
    }

    public void setSpfax(String spfax) {
        this.spfax = spfax == null ? null : spfax.trim();
    }

    public String getSparea() {
        return sparea;
    }

    public void setSparea(String sparea) {
        this.sparea = sparea == null ? null : sparea.trim();
    }

    public String getSpremark() {
        return spremark;
    }

    public void setSpremark(String spremark) {
        this.spremark = spremark == null ? null : spremark.trim();
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