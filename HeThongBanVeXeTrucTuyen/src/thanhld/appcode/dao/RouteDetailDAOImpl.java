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
	RouteDetail routeDetail = null;
	List<RouteDetail> listRouteDetail = null;
	Query query = null;

	@Override
	public int getNumberOrderByCondition(int routeId, int provinceId) {
		// TODO Auto-generated method stub

		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from ROUTE_DETAIL ");
			sqlQuery.append(" where ROUTE_ID=" + routeId + " and PROVINCE_ID=" + provinceId + "");
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
			routeDetail = (RouteDetail) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();

		}
		return routeDetail.getNumbercialOrder();
	}

	public List<RouteDetail> getListRouteDetailByRouteId(int routeId) {
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from ROUTE_DETAIL ");
			sqlQuery.append(" where ROUTE_ID=" + routeId + "");
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
			listRouteDetail = query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listRouteDetail;
	}

	public RouteDetail getRouteDetailWithNumberOrder(int routeId, int numberOrder) {
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from ROUTE_DETAIL ");
			sqlQuery.append(" where ROUTE_ID=" + routeId + " and NUMBERCIAL_ORDER=" + numberOrder + "");

			System.out.println(sqlQuery.toString());
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(RouteDetail.class);
			routeDetail = (RouteDetail) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return routeDetail;
	}

	public static void main(String[] args) {
		RouteDetailDAOImpl r = new RouteDetailDAOImpl();
		System.out.println(r.getListRouteDetailByRouteId(1).size());
	}

}
