package thanhld.appcode.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import thanhld.appcode.model.SeatOrder;
import thanhld.appcode.model.Ticket;
import thanhld.appcode.utility.HibernateUtils;
import thanhld.appcode.utility.Utility;

public class SeatOrderDAOImpl implements SeatOrderDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;
	List<SeatOrder> listSeatOrder = null;
	SeatOrder seatOrder = null;
	Query query = null;

	@Override
	public List<SeatOrder> getSeatOrderByCondition(String ticketId, int numberOriginPlace, int numberDestinationPlace) {
		// TODO Auto-generated method stub
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			ArrayList<String> listChang = new ArrayList<String>();
			listChang = Utility.phanChangDuongRaMang(numberOriginPlace, numberDestinationPlace);
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from SEAT_ORDER s ");
			sqlQuery.append(" WHERE s.TICKET_ID ='" + ticketId + "' AND ");
			sqlQuery.append(" (ROUTES LIKE '%" + listChang.get(0) + "%' ");
			for (int i = 1; i < listChang.size(); i++) {
				sqlQuery.append(" OR ROUTES LIKE '%" + listChang.get(i) + "%' ");
			}
			sqlQuery.append(" ) ");
			sqlQuery.append(" AND ORDER_TICKET_ID NOT IN (SELECT ORDER_TICKET_ID FROM ORDER_TICKET WHERE ORDER_TICKET_STATUS =0)");//lay nhung ve co trang thai != -> chua huy ve
			System.out.println(sqlQuery.toString());
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(SeatOrder.class);
			listSeatOrder = query.list();
			transaction.commit();
		} catch (Exception e) {

		} finally {
			session.close();

		}
		return listSeatOrder;
	}

	@Override
	public SeatOrder getSeatOrderByOrderTicket(String orderTicketId) {
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			ArrayList<String> listChang = new ArrayList<String>();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from SEAT_ORDER s ");
			sqlQuery.append(" WHERE s.ORDER_TICKET_ID ='" + orderTicketId + "'");
			System.out.println(sqlQuery.toString());
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(SeatOrder.class);
			seatOrder = (SeatOrder) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return seatOrder;
	}

	/*public static void main(String[] args) {
		SeatOrderDAOImpl sc = new SeatOrderDAOImpl();
		for (SeatOrder so : sc.getSeatOrderByCondition("ABCKA1", 1, 2)) {
			System.out.println(so.getSeat());
		}
		System.out.println(sc.getSeatOrderByOrderTicket("0D024B"));
	}*/

}
