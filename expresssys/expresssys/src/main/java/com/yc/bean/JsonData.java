package com.yc.bean;

import java.util.Arrays;

public class JsonData {
	private String name;
	private String[] data;
	
	public JsonData() {
		super();
	}
	

	public JsonData(String name, String[] data) {
		super();
		this.name = name;
		this.data = data;
	}


	@Override
	public String toString() {
		return "JsonData [name=" + name + ", data=" + Arrays.toString(data) + "]";
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String[] getData() {
		return data;
	}

	public void setData(String[] data) {
		this.data = data;
	}
	
	
	
	
	

}
