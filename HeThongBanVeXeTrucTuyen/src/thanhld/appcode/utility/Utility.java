package thanhld.appcode.utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import thanhld.appcode.model.SeatOrder;

public class Utility {
	public static String getTimeForOrder() {
		DateFormat formatDate = new SimpleDateFormat("MM-yyyy");
		DateFormat formatDay = new SimpleDateFormat("dd");
		Date now = new Date();
		String date = formatDate.format(now);
		String day = String.valueOf((Integer.parseInt(formatDay.format(now)) + 1));
		int dayNumber = Integer.parseInt(day);
		if ((dayNumber >= 1) && (dayNumber <= 9)) {
			day = "0" + day;
		}
		return day + "-" + date;

	}

	public static String getDateTimeNow() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // format
																				// theo
																				// time
																				// 24h
		// format time 12h 'yyyy-MM-dd hh:mm:ss'
		Date date = new Date();
		return dateFormat.format(date); // 2014/08/06 15:59:48
	}

	public static String getDateNow() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return dateFormat.format(date); // 2014/08/06
	}
	
/**
 * @return time now + 12hour
 */
public static String getExpiredDate(){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String currentDateandTime = sdf.format(new Date());

	Date date = null;
	try {
		date = sdf.parse(currentDateandTime);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(date);
	calendar.add(Calendar.HOUR, 12);

	return sdf.format(calendar.getTime());
}
	public static String parse12HoursTo24HoursTime(String hours12) {
		SimpleDateFormat displayFormat = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);
		SimpleDateFormat parseFormat = new SimpleDateFormat("hh:mm a", Locale.ENGLISH);
		Date date = null;
		try {
			date = parseFormat.parse(hours12);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return displayFormat.format(date);
	}

	public static String parse12HoursTo24HoursTimeAndDate(String datetime) {
		SimpleDateFormat displayFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat parseFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm a", Locale.UK);
		Date date = null;
		try {
			date = parseFormat.parse(datetime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return displayFormat.format(date);
	}

	public static void main(String[] args) throws ParseException {

		/*System.out.println(Utility.getDateTimeNow());
		System.out.print(Utility.replaceString2("/1_A/|/10_A/|/1_C/|/10_C/|"));
		for (String a : Utility.phanChuoiGheThanhMang("/1_A/|/10_A/|/1_C/|/10_C/|")) {
			System.out.println(a);
		}
		for (Integer t : Utility.layMinMaxThuTuDiemDung("(1-2)(2-3)")) {
			System.out.println(t);
		}*/
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDateandTime = sdf.format(new Date());

		Date date = sdf.parse(currentDateandTime);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR, 5);

		System.out.println("Time here "+sdf.format(calendar.getTime()));*/
		System.out.println(Utility.getExpiredDate());
		
		System.out.println(Utility.compareDateTime("2016-05-01 06:05:41"));
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

	public static String parseToDateFormat1(String dateInput) {
		SimpleDateFormat fromUser = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat myFormat = new SimpleDateFormat("dd/MM/yyyy");
		String reformattedStr = null;

		try {

			reformattedStr = myFormat.format(fromUser.parse(dateInput));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return reformattedStr;
	}
	
	public static String parseToDateFormat2(String dateInput) {
		SimpleDateFormat fromUser = new SimpleDateFormat("yyyy-MM-dd");
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

	public static String replaceString2(String stringNeedReplace) {
		String string1 = stringNeedReplace.replace("/", "");
		String string2 = string1.replace("|", ", ");
		return string2.substring(0, string2.length() - 2);
	}

	// tach chuoi price + chuoi id driver ra mang
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

	// tach chuoi id driver ra mang
	public static ArrayList<Integer> splitIdDriver(String str) {
		int i = 0;
		String[] strTotal = str.split("-");
		ArrayList<Integer> listId = new ArrayList<Integer>();
		while (i < strTotal.length) {

			listId.add(Integer.parseInt(strTotal[i]));
			i++;
		}
		return listId;
	}

	// tinh tong price dua theo so chang di cua khach
	public static int getPrice(int originNumber, int destinationNumber, ArrayList<Integer> listPrice) {
		int tong = 0;
		for (int i = originNumber - 1; i < destinationNumber - 1; i++) {
			tong += listPrice.get(i);
		}
		return tong;
	}
	
	// tinh tong price trong chuyen di
	public static int getTotalPrice(String price){
		ArrayList<Integer> listPrice = Utility.splitPrice(price);
		int tong = 0;
		for(Integer i:listPrice){
			tong+=i;
		}
		return tong;
	}

	// phan chang
	public static String phanChangDuong(int originNumber, int destinationNumber) {
		StringBuilder changDuong = new StringBuilder();
		if (destinationNumber - originNumber == 1) {
			changDuong.append("(" + originNumber + "-" + destinationNumber + ")");
		} else {
			int count = 0;
			while (originNumber < destinationNumber) {
				count = originNumber + 1;
				changDuong.append("(" + originNumber + "-" + count + ")");
				originNumber++;
			}
		}
		return changDuong.toString();
	}

	/**
	 * @param originNumber so thu tu cua diem di trong route detail
	 * @param destinationNumber so thu tu cua diem den trong routedetail
	 * @return list
	 */
	public static ArrayList<String> phanChangDuongRaMang(int originNumber, int destinationNumber) {
		ArrayList<String> listChang = new ArrayList<String>();
		StringBuilder changDuong = new StringBuilder();
		if (destinationNumber - originNumber == 1) {
			// changDuong.append("("+originNumber+"-"+destinationNumber+")");
			listChang.add("(" + originNumber + "-" + destinationNumber + ")");
		} else {
			int count = 0;
			while (originNumber < destinationNumber) {
				count = originNumber + 1;
				// changDuong.append("("+originNumber+"-"+count+")");
				listChang.add("(" + originNumber + "-" + count + ")");
				originNumber++;
			}
		}
		return listChang;
	}

	public static String layGheDaDuocDat(List<SeatOrder> listSeat) {
		StringBuilder chuoiGhe = new StringBuilder();
		for (SeatOrder so : listSeat) {
			chuoiGhe.append(so.getSeat());
		}
		String chuoi = Utility.replaceString(chuoiGhe.toString());
		return chuoi;
	}

	public static int layTongSoGheDuocDat(String chuoiGhe) {
		int count = 0;
		for (int i = 0; i < chuoiGhe.length(); i++) {
			if (String.valueOf(chuoiGhe.charAt(i)).equals(",")) {
				count++;
			}
		}

		return count;

	}

	public static List<String> phanChuoiGheThanhMang(String listSeat) {
		List<String> list = new ArrayList<>();
		String[] arraySeat = listSeat.split("\\|");
		for (String s : arraySeat) {
			list.add(s);
		}
		return list;
	}

	public static List<Integer> layMinMaxThuTuDiemDung(String listRoutes) {
		List<Integer> minMax = new ArrayList<Integer>();
		for (int i = 0; i < (listRoutes.length() - 1); i++) {
			try {
				int k = Integer.parseInt(String.valueOf(listRoutes.charAt(i)));
				minMax.add(k);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return minMax;

	}

	public static boolean compareDateTime(String date) {
		boolean check = false;
		Date dateOrigin = null;
		Date dateNow = null;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateN = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
		if (dateNow.compareTo(dateOrigin) >= 0) {
			check = true;
			// date hien tai sau date han -> het han
		}
		if (dateNow.compareTo(dateOrigin) < 0) {
			check = false;
			// -> van dang ban
		}
		return check;
	}

	public static String checkPaid(String time) {
		String status = "";
		if (time == null || ("").equals(time)) {
			status = "<span class=\"label label-warning\">Chưa thanh toán</span>";
		} else {
			status = "<span class=\"label label-success\">Đã thanh toán</span>";
		}
		return status;
	}

	public static String encryptMD5(String md5) {
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(md5.getBytes());
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < array.length; ++i) {
				sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
			}
			return sb.toString();
		} catch (java.security.NoSuchAlgorithmException e) {
		}
		return null;
	}

	public static void sendEmail(String host, String port, final String userName, final String password,
			String toAddress, String subject, String message) throws AddressException, MessagingException {

		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};

		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);
		msg.setHeader("Content-Type", "text/plain; charset=UTF-8");
		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		msg.setContent(message, "text/html");

		// sends the e-mail
		Transport.send(msg);

	}
	/*
	 * public static void main(String[] args) { SeatOrderDAOImpl so = new
	 * SeatOrderDAOImpl();
	 * System.out.println(Utility.layGheDaDuocDat(so.getSeatOrderByCondition(1,
	 * 1, 4))); System.out.println(Utility.phanChangDuong(1, 5)); for(String k :
	 * Utility.phanChangDuongRaMang(1, 5)){ System.out.println(k); } }
	 */
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
