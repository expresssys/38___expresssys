package com.yc.bean;

public class Const {
    private Integer cid;

    private Integer ctid;

    private String cname;
    
    private String ctname;

    public String getCtname() {
		return ctname;
	}

	public void setCtname(String ctname) {
		this.ctname = ctname;
	}

	private Integer cstatus;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCtid() {
        return ctid;
    }

    public void setCtid(Integer ctid) {
        this.ctid = ctid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getCstatus() {
        return cstatus;
    }

    public void setCstatus(Integer cstatus) {
        this.cstatus = cstatus;
    }

	@Override
	public String toString() {
		return "Const [cid=" + cid + ", ctid=" + ctid + ", cname=" + cname + ", ctname=" + ctname + ", cstatus="
				+ cstatus + "]";
	}
    
}