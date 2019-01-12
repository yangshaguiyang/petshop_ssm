/*package com.petshop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class FormatDate {

	public static String dateStringFormat(Date date,String pattern) throws ParseException {
		
		if(date==null||pattern==null) {
			return null;
		}
		String s_date=String.valueOf(date);
		
		Date formDate = new SimpleDateFormat("YYYY-MM-DD",Locale.US).parse(s_date);
		
		return new SimpleDateFormat(pattern, Locale.CHINA).format(formDate); 
	}
	
}
*/