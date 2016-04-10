package thanhld.appcode.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.TicketDetail;
import thanhld.appcode.utility.HibernateUtils;

public class TicketDetailDAOImpl implements TicketDetailDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;

	@Override
	public TicketDetail getTicketDetailByTicketId(String ticketId, int provinceId) {
		// TODO Auto-generated method stub
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from TICKET_DETAIL where TICKET_ID='" + ticketId + "' and PROVINCE_ID="+provinceId+"");
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(TicketDetail.class);
		TicketDetail ticketDetail = (TicketDetail) query.uniqueResult();
		transaction.commit();
		return ticketDetail;
	}
	
	@Override
	public TicketDetail getTicketDetailByTicketId(String ticketId) {
		// TODO Auto-generated method stub
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from TICKET_DETAIL where TICKET_ID='" + ticketId + "'");
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(TicketDetail.class);
		List<TicketDetail> listTicketDetail = (List<TicketDetail>) query.list();
		transaction.commit();
		return listTicketDetail.get(0);
	}
	
	
	public static void main(String[] args) {
		TicketDetailDAOImpl t = new TicketDetailDAOImpl();
		
		System.out.println(t.getTicketDetailByTicketId("ABCKA1", 1).getBusStationId());
	}

}
