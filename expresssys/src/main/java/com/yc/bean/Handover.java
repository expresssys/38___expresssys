package com.yc.bean;

import java.util.Date;

public class Handover {
    private Integer hid;

    private String hfromspname;

    private String htospname;

    private Date hstarttime;

    private Date hendtime;

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

    public Integer getHid() {
        return hid;
    }

    public void setHid(Integer hid) {
        this.hid = hid;
    }

    public String getHfromspname() {
        return hfromspname;
    }

    public void setHfromspname(String hfromspname) {
        this.hfromspname = hfromspname == null ? null : hfromspname.trim();
    }

    public String getHtospname() {
        return htospname;
    }

    public void setHtospname(String htospname) {
        this.htospname = htospname == null ? null : htospname.trim();
    }

    public Date getHstarttime() {
        return hstarttime;
    }

    public void setHstarttime(Date hstarttime) {
        this.hstarttime = hstarttime;
    }

    public Date getHendtime() {
        return hendtime;
    }

    public void setHendtime(Date hendtime) {
        this.hendtime = hendtime;
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
        this.hremark = hremark == null ? null : hremark.trim();
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