package com.yc.bean;

public class From {
	private String fromtime;
	private String sfromtime;
	private Integer spid;
	private String countweight;
	private String counttj;
	private String countprice;
	private Integer fspid;
	private Integer sspid;
	private String gtype;
	private String count;
	private String month;
	
	public From() {
		super();
	}

	public From(String fromtime, String sfromtime, Integer spid, String countweight, String counttj, String countprice,
			Integer fspid, Integer sspid, String gtype, String count, String month) {
		super();
		this.fromtime = fromtime;
		this.sfromtime = sfromtime;
		this.spid = spid;
		this.countweight = countweight;
		this.counttj = counttj;
		this.countprice = countprice;
		this.fspid = fspid;
		this.sspid = sspid;
		this.gtype = gtype;
		this.count = count;
		this.month = month;
	}


	@Override
	public String toString() {
		return "From [fromtime=" + fromtime + ", sfromtime=" + sfromtime + ", spid=" + spid + ", countweight="
				+ countweight + ", counttj=" + counttj + ", countprice=" + countprice + ", fspid=" + fspid + ", sspid="
				+ sspid + ", gtype=" + gtype + ", count=" + count + ", month=" + month + "]";
	}





	public String getMonth() {
		return month;
	}





	public void setMonth(String month) {
		this.month = month;
	}





	public String getCount() {
		return count;
	}



	public void setCount(String count) {
		this.count = count;
	}



	public String getFromtime() {
		return fromtime;
	}

	public void setFromtime(String fromtime) {
		this.fromtime = fromtime;
	}

	public String getSfromtime() {
		return sfromtime;
	}

	public void setSfromtime(String sfromtime) {
		this.sfromtime = sfromtime;
	}

	public Integer getSpid() {
		return spid;
	}

	public void setSpid(Integer spid) {
		this.spid = spid;
	}

	public String getCountweight() {
		return countweight;
	}

	public void setCountweight(String countweight) {
		this.countweight = countweight;
	}

	public String getCounttj() {
		return counttj;
	}

	public void setCounttj(String counttj) {
		this.counttj = counttj;
	}

	public String getCountprice() {
		return countprice;
	}

	public void setCountprice(String countprice) {
		this.countprice = countprice;
	}

	public Integer getFspid() {
		return fspid;
	}

	public void setFspid(Integer fspid) {
		this.fspid = fspid;
	}

	public Integer getSspid() {
		return sspid;
	}

	public void setSspid(Integer sspid) {
		this.sspid = sspid;
	}

	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	
	
	
	
}
