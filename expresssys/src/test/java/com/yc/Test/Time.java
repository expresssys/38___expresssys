package com.yc.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Time {
	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("MMM d, yyyy K:m:s a",Locale.ENGLISH);
		Date d2 = null;
		try {
			d2 = sdf.parse("Sep 29, 2012 1:00:01 AM");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date d3 = new Date();
		System.out.println("d2 ====== "+d2);
		System.out.println("d3 ====== "+sdf.format(d3));
		
		String time1= "1519833600000";
		
		
	}	
}
