package thanhld.appcode.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import thanhld.appcode.model.OrderTicket;
import thanhld.appcode.utility.HibernateUtils;

public class OrderTicketDAOImpl implements OrderTicketDAO {
	List<OrderTicket> list = null;

	@SuppressWarnings("unchecked")
	public List<OrderTicket> getListOrderTicketDESC() {
		Session session = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			Criteria criteria = session.createCriteria(OrderTicket.class);
			list = criteria.addOrder(Order.desc("orderTicketTime")).list();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return list;
	}
}
