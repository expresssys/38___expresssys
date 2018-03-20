package com.yc.bean;

import java.util.Arrays;
import java.util.List;

public class TestlineData {
	private String[] xcontent;
	private List<JsonData> data;
	
	public TestlineData() {
		super();
	}

	public TestlineData(String[] xcontent, List<JsonData> data) {
		super();
		this.xcontent = xcontent;
		this.data = data;
	}

	@Override
	public String toString() {
		return "TestlineData [xcontent=" + Arrays.toString(xcontent) + ", data=" + data + "]";
	}

	public String[] getXcontent() {
		return xcontent;
	}

	public void setXcontent(String[] xcontent) {
		this.xcontent = xcontent;
	}

	public List<JsonData> getData() {
		return data;
	}

	public void setData(List<JsonData> data) {
		this.data = data;
	}
	
	
	
	
}
