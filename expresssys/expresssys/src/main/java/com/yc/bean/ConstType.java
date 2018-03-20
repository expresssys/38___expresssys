package com.yc.bean;

public class ConstType {
    private Integer ctid;

    private String ctname;

    private Integer ctstatus;

    public Integer getCtid() {
        return ctid;
    }

    public void setCtid(Integer ctid) {
        this.ctid = ctid;
    }

    public String getCtname() {
        return ctname;
    }

    public void setCtname(String ctname) {
        this.ctname = ctname == null ? null : ctname.trim();
    }

    public Integer getCtstatus() {
        return ctstatus;
    }

    public void setCtstatus(Integer ctstatus) {
        this.ctstatus = ctstatus;
    }

	@Override
	public String toString() {
		return "ConstType [ctid=" + ctid + ", ctname=" + ctname + ", ctstatus=" + ctstatus + "]";
	}
    
    
}