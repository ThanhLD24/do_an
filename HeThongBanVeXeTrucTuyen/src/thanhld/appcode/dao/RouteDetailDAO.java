package thanhld.appcode.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.Ticket;
import thanhld.appcode.utility.HibernateUtils;
import thanhld.appcode.utility.Utility;

public interface RouteDetailDAO  {
	public int getNumberOrderByCondition(int routeId, int provinceId);

}
