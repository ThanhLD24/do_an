package thanhld.appcode.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.RouteDetail;
import thanhld.appcode.model.Ticket;
import thanhld.appcode.utility.HibernateUtils;
import thanhld.appcode.utility.Utility;

public class RouteDetailDAOImpl implements RouteDetailDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;

	@Override
	public int getNumberOrderByCondition(int routeId, int provinceId) {
		// TODO Auto-generated method stub

		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from ROUTE_DETAIL ");
		sqlQuery.append(" where ROUTE_ID=" + routeId + " and PROVINCE_ID=" + provinceId + "");

		System.out.println(sqlQuery.toString());
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
		RouteDetail routeDetail = (RouteDetail) query.uniqueResult();
		transaction.commit();
		return routeDetail.getNumbercialOrder();
	}

	public List<RouteDetail> getListRouteDetailByRouteId(int routeId) {
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from ROUTE_DETAIL ");
		sqlQuery.append(" where ROUTE_ID=" + routeId + "");

		System.out.println(sqlQuery.toString());
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
		List<RouteDetail> listRouteDetail = query.list();
		transaction.commit();
		return listRouteDetail;
	}

	public RouteDetail getRouteDetailWithNumberOrder(int routeId, int numberOrder){
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from ROUTE_DETAIL ");
		sqlQuery.append(" where ROUTE_ID=" + routeId + " and NUMBERCIAL_ORDER=" + numberOrder + "");

		System.out.println(sqlQuery.toString());
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
		RouteDetail routeDetail = (RouteDetail) query.uniqueResult();
		transaction.commit();
		return routeDetail;
	}
	
	public static void main(String[] args) {
		RouteDetailDAOImpl r = new RouteDetailDAOImpl();
		System.out.println(r.getListRouteDetailByRouteId(1).size());
	}

}
