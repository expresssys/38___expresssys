package com.yc.bean;

public class Orderinfo {
    private Integer orderid;

    private Integer osid;

    private Integer gid;

    private Integer rid;

    private Integer ostatus;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    private String res5;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getOsid() {
        return osid;
    }

    public void setOsid(Integer osid) {
        this.osid = osid;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getOstatus() {
        return ostatus;
    }

    public void setOstatus(Integer ostatus) {
        this.ostatus = ostatus;
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

    public String getRes5() {
        return res5;
    }

    public void setRes5(String res5) {
        this.res5 = res5 == null ? null : res5.trim();
    }
}