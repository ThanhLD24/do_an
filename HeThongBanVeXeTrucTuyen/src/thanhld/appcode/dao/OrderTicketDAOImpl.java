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
			Criterion condition1= Restrictions.eq("orderTicketStatus", true);
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
					+ "' and ( passengerPhone ='" + info + "' or passengerEmail ='"+info+"')");
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
	public static void main(String[] args) {
		OrderTicketDAO o = new OrderTicketDAOImpl();
		System.out.println(o.getOrderTicketByCondition("0D024B", "0986226361").getPassengerName());
	}
}
