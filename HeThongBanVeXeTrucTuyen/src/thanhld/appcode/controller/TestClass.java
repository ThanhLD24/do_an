package thanhld.appcode.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class TestClass {
	public static void main(String [] args) throws Exception {
	       SimpleDateFormat displayFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       SimpleDateFormat parseFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm a",Locale.UK);
	       Date date = parseFormat.parse("21-03-2015 10:30 PM");
	       System.out.println(parseFormat.format(date) + " = " + displayFormat.format(date));
	   }
		
}
