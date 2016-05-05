package thanhld.appcode.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.model.RouteDetail;
import thanhld.appcode.utility.HibernateUtils;
import thanhld.appcode.valueobject.JsonObjectVO;

public class OrderTicketDAOImpl implements OrderTicketDAO {
	List<OrderTicket> list = null;
	OrderTicket orderTicket = null;

	@SuppressWarnings("unchecked")
	public List<OrderTicket> getListOrderTicketDESC() {
		Session session = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			Criteria criteria = session.createCriteria(OrderTicket.class);
			Criterion condition1 = Restrictions.eq("orderTicketStatus", true);
			criteria.add(condition1);
			list = criteria.addOrder(Order.desc("orderTicketTime")).list();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return list;
	}

	public OrderTicket getOrderTicketByCondition(String orderTicketId, String info) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from OrderTicket where orderTicketId='" + orderTicketId
					+ "' and ( passengerPhone ='" + info + "' or passengerEmail ='" + info + "')");
			orderTicket = (OrderTicket) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return orderTicket;
	}

	public int getTotalOrderTicketInMonthOfYear(int month, int year) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(
					"from OrderTicket where month(orderTicketTime) = :d_month and year(orderTicketTime) =:d_year ");
			query.setParameter("d_month", month);
			query.setParameter("d_year", year);
			list = query.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list.size();
	}

	public int getTotalOrderTicketPaidedInMonthOfYear(int month, int year) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(
					"from OrderTicket where month(orderTicketTime) = :d_month and year(orderTicketTime) =:d_year and orderTicketPaidDate != ''");
			query.setParameter("d_month", month);
			query.setParameter("d_year", year);
			list = query.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list.size();
	}
	
	public int getTotalOrderTicketUnPaidInMonthOfYear(int month, int year) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(
					"from OrderTicket where month(orderTicketTime) = :d_month and year(orderTicketTime) =:d_year and orderTicketPaidDate = ''");
			query.setParameter("d_month", month);
			query.setParameter("d_year", year);
			list = query.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list.size();
	}

	public int getTotalOrderTicketReturnInMonthOfYear(int month, int year) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery(
					"from OrderTicket where month(orderTicketTime) = :d_month and year(orderTicketTime) =:d_year and orderTicketStatus = '0'");
			query.setParameter("d_month", month);
			query.setParameter("d_year", year);
			list = query.list();
		} catch (Exception e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list.size();
	}
	

	
	public List<Object> countRouteOrder(String year) {
		Session session = null;
		Transaction transaction = null;
		StringBuilder sqlQuery;
		List<Object> listJson = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" SELECT (SELECT ROUTE_DESCRIPTION FROM ROUTE r WHERE r.ROUTE_ID=t.ROUTE_ID) AS JSON_NAME, COUNT(*) AS JSON_VALUE FROM ORDER_TICKET o INNER JOIN TICKET t ON t.TICKET_ID=o.TICKET_ID WHERE YEAR(o.ORDER_TICKET_TIME)="+year+" GROUP BY ROUTE_ID ");
			Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(JsonObjectVO.class);
			listJson = query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listJson;
	}
	
	public List<Object> getTotalMoneyByYear(String year) {
		Session session = null;
		Transaction transaction = null;
		StringBuilder sqlQuery;
		List<Object> listJson = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" SELECT 'Tổng tiền thu được qua bán vé' as JSON_NAME, SUM(ORDER_TICKET_TOTAL_PRICE) as JSON_VALUE FROM ORDER_TICKET od WHERE YEAR(od.ORDER_TICKET_TIME) = "+year+" AND ORDER_TICKET_PAIDDATE != '' ");
			Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(JsonObjectVO.class);
			listJson = query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listJson;
	}
	public List<Object> getTotalMoneyByYearTicketRefund(String year) {
		Session session = null;
		Transaction transaction = null;
		StringBuilder sqlQuery;
		List<Object> listJson = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" SELECT 'Tổng tiền thu được qua trả vé' as JSON_NAME,SUM(CANCEL_ORDER_TICKET_INTEREST) as JSON_VALUE FROM CANCEL_ORDER_TICKET od WHERE YEAR(od.CANCEL_ORDER_TICKET_CANCEL_TIME) = "+year+" ");
			Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(JsonObjectVO.class);
			listJson = query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listJson;
	}
	
	
	
}
