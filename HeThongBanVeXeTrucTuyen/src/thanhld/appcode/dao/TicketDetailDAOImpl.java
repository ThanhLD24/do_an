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
	Query query = null;
	TicketDetail ticketDetail = null;
	List<TicketDetail> listTicketDetail = null;

	@Override
	public TicketDetail getTicketDetailByTicketId(String ticketId, int provinceId) {
		// TODO Auto-generated method stub
		try {
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(
				" select * from TICKET_DETAIL where TICKET_ID='" + ticketId + "' and PROVINCE_ID=" + provinceId + "");
		
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(TicketDetail.class);
			ticketDetail = (TicketDetail) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return ticketDetail;
	}

	/* (non-Javadoc)
	 * @see thanhld.appcode.dao.TicketDetailDAO#getTicketDetailByTicketId(java.lang.String)
	 * lay ban ghi dau tien (1st) trong list ticketDetail theo ticketid
	 */
	@Override
	public TicketDetail getTicketDetailByTicketId(String ticketId) {
		// TODO Auto-generated method stub
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from TICKET_DETAIL where TICKET_ID='" + ticketId + "'");

			query = session.createSQLQuery(sqlQuery.toString()).addEntity(TicketDetail.class);
			listTicketDetail = (List<TicketDetail>) query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listTicketDetail.get(0);
	}

	public static void main(String[] args) {
		TicketDetailDAOImpl t = new TicketDetailDAOImpl();

		System.out.println(t.getTicketDetailByTicketId("ABCKA1", 1).getBusStationId());
	}

}
