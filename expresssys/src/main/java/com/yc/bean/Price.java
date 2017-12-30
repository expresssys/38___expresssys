package com.yc.bean;

public class Price {
    private Integer pid;

    private String pfrom;

    private String pto;

    private Double pfirstwei;

    private Double prestwei;

    private Double pfirstvol;

    private Double prestvol;

    private String pretime;

    private String res1;

    private String res2;

    private String res3;

    private String res4;
    
    private String spname;
    
    public Price() {
		super();
	}

	public Price(Integer pid, String pfrom, String pto, Double pfirstwei, Double prestwei, Double pfirstvol,
			Double prestvol, String pretime, String res1, String res2, String res3, String res4, String spname) {
		super();
		this.pid = pid;
		this.pfrom = pfrom;
		this.pto = pto;
		this.pfirstwei = pfirstwei;
		this.prestwei = prestwei;
		this.pfirstvol = pfirstvol;
		this.prestvol = prestvol;
		this.pretime = pretime;
		this.res1 = res1;
		this.res2 = res2;
		this.res3 = res3;
		this.res4 = res4;
		this.spname = spname;
	}

	@Override
	public String toString() {
		return "Price [pid=" + pid + ", pfrom=" + pfrom + ", pto=" + pto + ", pfirstwei=" + pfirstwei + ", prestwei="
				+ prestwei + ", pfirstvol=" + pfirstvol + ", prestvol=" + prestvol + ", pretime=" + pretime + ", res1="
				+ res1 + ", res2=" + res2 + ", res3=" + res3 + ", res4=" + res4 + ", spname=" + spname + "]";
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPfrom() {
        return pfrom;
    }

    public void setPfrom(String pfrom) {
        this.pfrom = pfrom == null ? null : pfrom.trim();
    }

    public String getPto() {
        return pto;
    }

    public void setPto(String pto) {
        this.pto = pto == null ? null : pto.trim();
    }

    public Double getPfirstwei() {
        return pfirstwei;
    }

    public void setPfirstwei(Double pfirstwei) {
        this.pfirstwei = pfirstwei;
    }

    public Double getPrestwei() {
        return prestwei;
    }

    public void setPrestwei(Double prestwei) {
        this.prestwei = prestwei;
    }

    public Double getPfirstvol() {
        return pfirstvol;
    }

    public void setPfirstvol(Double pfirstvol) {
        this.pfirstvol = pfirstvol;
    }

    public Double getPrestvol() {
        return prestvol;
    }

    public void setPrestvol(Double prestvol) {
        this.prestvol = prestvol;
    }

    public String getPretime() {
        return pretime;
    }

    public void setPretime(String pretime) {
        this.pretime = pretime == null ? null : pretime.trim();
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