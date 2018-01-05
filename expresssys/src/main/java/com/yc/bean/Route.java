package com.yc.bean;

import java.io.Serializable;

public class Route implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer rid;

    private String rname;

    private String rvia;

    private String res1;

    private String res2;

    private String res3;

    private String res4;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname == null ? null : rname.trim();
    }

    public String getRvia() {
        return rvia;
    }

    public void setRvia(String rvia) {
        this.rvia = rvia == null ? null : rvia.trim();
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

	@Override
	public String toString() {
		return "Route [rid=" + rid + ", rname=" + rname + ", rvia=" + rvia + ", res1=" + res1 + ", res2=" + res2
				+ ", res3=" + res3 + ", res4=" + res4 + "]";
	}

    
}