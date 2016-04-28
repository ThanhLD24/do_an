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
import thanhld.appcode.utility.HibernateUtils;

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
	public static void main(String[] args) {
		OrderTicketDAOImpl o = new OrderTicketDAOImpl();
		System.out.println(o.getTotalOrderTicketInMonthOfYear(5, 2016));
	}
}
