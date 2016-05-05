package thanhld.appcode.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.Ticket;
import thanhld.appcode.utility.HibernateUtils;
import thanhld.appcode.utility.Utility;

public class TicketDAOImpl implements TicketDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;
	List<Ticket> listTicket = null;
	Query query = null;
	String dateTimeNow = null;
	@Override
	public List<Ticket> getTicketByCondition(String startPlace, String endPlace, String timeStart) {
		// TODO Auto-generated method stub
		dateTimeNow = Utility.getDateTimeNow();
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			String date = Utility.parseFormatDate(timeStart);
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from TICKET t ");
			sqlQuery.append(" WHERE t.ROUTE_ID IN (SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID ="
					+ endPlace + ") ");
			sqlQuery.append(" AND t.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID ="
					+ startPlace + ") ");
			sqlQuery.append(" AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3 ");
			sqlQuery.append(" WHERE rd3.ROUTE_ID =t.ROUTE_ID AND rd3.PROVINCE_ID =" + endPlace
					+ ")>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID ="
					+ startPlace + ")");
			/*
			 * sqlQuery.append(" and date(t.TICKET_ORIGIN_TIME)= '"+date+"'");
			 */
			sqlQuery.append(
					" AND (SELECT DETAIL_DATE FROM TICKET_DETAIL td WHERE t.TICKET_ID=td.TICKET_ID AND td.PROVINCE_ID= "
							+ startPlace + " )= '" + date + "'");
			sqlQuery.append(" AND t.TICKET_START_SELL_DATE<='"+dateTimeNow+"' AND t.TICKET_END_SELL_DATE>='"+dateTimeNow+"' ");
			System.out.println(sqlQuery.toString());
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(Ticket.class);
			listTicket = new ArrayList<Ticket>();
			listTicket = query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}

		return listTicket;
	}

	public List<Ticket> getTicketByConditionOnePath(String startPlace, String endPlace, String timeStart) {
		dateTimeNow = Utility.getDateTimeNow();
		try{
		session = HibernateUtils.getSessionFactory().openSession();
		String date = Utility.parseFormatDate(timeStart);
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from TICKET t ");
		sqlQuery.append(" WHERE t.ROUTE_ID IN (SELECT rd1.ROUTE_ID FROM ROUTE_DETAIL rd1 WHERE rd1.PROVINCE_ID ="
				+ endPlace + ") ");
		sqlQuery.append(" AND t.ROUTE_ID IN (SELECT rd2.ROUTE_ID FROM ROUTE_DETAIL rd2 WHERE rd2.PROVINCE_ID ="
				+ startPlace + ") ");
		sqlQuery.append(" AND (SELECT rd3.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd3 ");
		sqlQuery.append(" WHERE rd3.ROUTE_ID =t.ROUTE_ID AND rd3.PROVINCE_ID =" + endPlace
				+ ")>(SELECT rd4.NUMBERCIAL_ORDER FROM ROUTE_DETAIL rd4 WHERE  rd4.ROUTE_ID =t.ROUTE_ID AND rd4.PROVINCE_ID ="
				+ startPlace + ")");
		/* sqlQuery.append(" and date(t.TICKET_ORIGIN_TIME)= '"+date+"'"); */
		sqlQuery.append(" AND (SELECT COUNT(*) FROM ROUTE_DETAIL rd5 WHERE rd5.ROUTE_ID=t.ROUTE_ID)=2 ");
		sqlQuery.append(
				" AND (SELECT DETAIL_DATE FROM TICKET_DETAIL td WHERE t.TICKET_ID=td.TICKET_ID AND td.PROVINCE_ID= "
						+ startPlace + " )= '" + date + "'");
		sqlQuery.append(" AND t.TICKET_START_SELL_DATE<='"+dateTimeNow+"' AND t.TICKET_END_SELL_DATE>='"+dateTimeNow+"' ");
		System.out.println(sqlQuery.toString());
		query = session.createSQLQuery(sqlQuery.toString()).addEntity(Ticket.class);
		listTicket = new ArrayList<Ticket>();
		listTicket = query.list();
		transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listTicket;

	}

	public List<Ticket> getListTicket() {
		List<Ticket> listTicket = null;
		transaction = session.beginTransaction();

		return listTicket;
	}

}
