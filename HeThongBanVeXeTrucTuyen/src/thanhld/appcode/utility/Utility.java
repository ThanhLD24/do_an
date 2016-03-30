package thanhld.appcode.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.print.attribute.standard.DateTimeAtCompleted;

import thanhld.appcode.dao.SeatOrderDAOImpl;
import thanhld.appcode.model.SeatOrder;

public class Utility {
	public static String getTimeForOrder() {
		DateFormat formatDate = new SimpleDateFormat("MM-yyyy");
		DateFormat formatDay = new SimpleDateFormat("dd");
		Date now = new Date();
		String date = formatDate.format(now);
		String day = String.valueOf((Integer.parseInt(formatDay.format(now)) + 2));
		int dayNumber = Integer.parseInt(day);
		if ((dayNumber >= 1) && (dayNumber <= 9)) {
			day = "0" + day;
		}
		return day + "-" + date;

	}
	
	public static String getDateTimeNow(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = new Date();
		return dateFormat.format(date); //2014/08/06 15:59:48
	}
	
	public static String parseFormatDate(String dateInput) {
		SimpleDateFormat fromUser = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");
		String reformattedStr = null;

		try {

			reformattedStr = myFormat.format(fromUser.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return reformattedStr;
	}

	public static String parseToDateFormat(String dateInput) {
		SimpleDateFormat fromUser = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
		SimpleDateFormat myFormat = new SimpleDateFormat("dd/MM/yyyy");
		String reformattedStr = null;

		try {

			reformattedStr = myFormat.format(fromUser.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return reformattedStr;
	}
	
	

	public static String parseToTimeFormat(String dateInput) {
		SimpleDateFormat fromUser = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S");
		SimpleDateFormat myFormat = new SimpleDateFormat("HH:mm:ss");
		String reformattedStr = null;
		try {
			reformattedStr = myFormat.format(fromUser.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int hours = 0;
		int minutes = 0;
		String minutess = null;
		String[] split = reformattedStr.split(":");
		hours = Integer.valueOf(split[0]);
		minutes = Integer.valueOf(split[1]);
		if (String.valueOf(minutes).length() == 1) {
			minutess = "0" + minutes;
		} else {
			minutess = minutes + "";
		}
		return hours + ":" + minutess;
	}

	public static String replaceString(String stringNeedReplace) {
		String string1 = stringNeedReplace.replace("/", "'");
		String string2 = string1.replace("|", ",");

		return string2;
	}

	// tach chuoi price
	public static ArrayList<Integer> splitPrice(String str) {
		int i = 0;
		String[] strTotal = str.split("-");
		ArrayList<Integer> listPrice = new ArrayList<Integer>();
		while (i < strTotal.length) {

			listPrice.add(Integer.parseInt(strTotal[i]));
			i++;
		}
		return listPrice;
	}

	// tinh tong price dua theo so chang di cua khach
	public static int getPrice(int originNumber, int destinationNumber, ArrayList<Integer> listPrice) {
		int tong = 0;
		for (int i = originNumber - 1; i < destinationNumber - 1; i++) {
			tong += listPrice.get(i);
		}
		return tong;
	}

	// phan chang
	public static String phanChangDuong(int originNumber, int destinationNumber) {
		StringBuilder changDuong= new StringBuilder();
		if(destinationNumber-originNumber==1){
			changDuong.append("("+originNumber+"-"+destinationNumber+")");
		}
		else{
			int count =0;
			while(originNumber<destinationNumber){
				count = originNumber+1;
				changDuong.append("("+originNumber+"-"+count+")");
				originNumber++;
			}
		}
		return changDuong.toString();
	}
	
	public static ArrayList<String> phanChangDuongRaMang(int originNumber, int destinationNumber) {
		ArrayList<String> listChang = new ArrayList<String>();
		StringBuilder changDuong= new StringBuilder();
		if(destinationNumber-originNumber==1){
			//changDuong.append("("+originNumber+"-"+destinationNumber+")");
			listChang.add("("+originNumber+"-"+destinationNumber+")");
		}
		else{
			int count =0;
			while(originNumber<destinationNumber){
				count = originNumber+1;
				//changDuong.append("("+originNumber+"-"+count+")");
				listChang.add("("+originNumber+"-"+count+")");
				originNumber++;
			}
		}
		return listChang;
	}
	
	public static String layGheDaDuocDat(List<SeatOrder> listSeat){
		StringBuilder chuoiGhe = new StringBuilder();
		for(SeatOrder so : listSeat){
			chuoiGhe.append(so.getSeat());
		}
		String chuoi = Utility.replaceString(chuoiGhe.toString());
		return chuoi;
	}
	
	public static int layTongSoGheDuocDat(String chuoiGhe){
		int count=0;
		for(int i=0; i<chuoiGhe.length(); i++){
			if(String.valueOf(chuoiGhe.charAt(i)).equals(",")){
				count++;
			}
		}
		
		return count;
		
	}
	
	public static boolean compareDateTime(String date){
		boolean check =false;
		Date dateOrigin =null;
		Date dateNow =null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date dateN = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    	try {
			dateOrigin = sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	try {
			dateNow = sdf.parse(dateFormat.format(dateN));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if(dateNow.compareTo(dateOrigin)>=0){
    		check = true;
    		//date hien tai sau date han -> het han
    	}
    	if(dateNow.compareTo(dateOrigin)<0){
    		check = false;
    		// -> van dang ban
    	}
    	return check;
	}
	public static void main(String[] args) {
		
		System.out.println(Utility.compareDateTime("2016-03-30 9:23:30"));
	}
/*	public static void main(String[] args) {
		SeatOrderDAOImpl so = new SeatOrderDAOImpl();
		System.out.println(Utility.layGheDaDuocDat(so.getSeatOrderByCondition(1, 1, 4)));
		System.out.println(Utility.phanChangDuong(1, 5));
		for(String k : Utility.phanChangDuongRaMang(1, 5)){
			System.out.println(k);
		}
	}*/
	/*
	 * public static void main(String[] args) {
	 * 
	 * System.out.println(Utility.getPrice(2, 4,
	 * Utility.splitPrice("100-100-50-100-200-"))); }
	 */

	/*
	 * public static void main(String[] args) {
	 * System.out.println(Utility.replaceString(
	 * "/e_e_e/|/e_e_e/|/e_e_e/|/e_e_e/|/e_e_e/|/eee_e/|/eee__/|")); }
	 */
	/*
	 * public static void main(String[] args) {
	 * 
	 * System.out.println(Utility.parseToTimeFormat("2016-02-20 21:03:35.3")); }
	 */

}
