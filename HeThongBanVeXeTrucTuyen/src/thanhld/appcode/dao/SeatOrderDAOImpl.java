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
	StringBuilder sqlQuery= null;
	@Override
	public List<SeatOrder> getSeatOrderByCondition(int ticketId, int numberOriginPlace, int numberDestinationPlace) {
		// TODO Auto-generated method stub
		session = HibernateUtils.getSessionFactory().openSession();
		ArrayList<String> listChang = new ArrayList<String>();
		listChang = Utility.phanChangDuongRaMang(numberOriginPlace, numberDestinationPlace);
        transaction = session.beginTransaction();
        sqlQuery = new StringBuilder();
        sqlQuery.append(" select * from SEAT_ORDER s ");
        sqlQuery.append(" WHERE s.TICKET_ID ="+ticketId+" AND ");
        sqlQuery.append(" (ROUTES LIKE '%"+listChang.get(0)+"%' ");
        for(int i=1; i<listChang.size();i++){
        	sqlQuery.append(" OR ROUTES LIKE '%"+listChang.get(i)+"%' ");
        }
        sqlQuery.append(" ) ");
        System.out.println(sqlQuery.toString());
        Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(SeatOrder.class);
        List<SeatOrder> listSeatOrder = query.list();
        transaction.commit();
        return listSeatOrder;
	}
	
	/*public static void main(String[] args) {
		SeatOrderDAOImpl sc = new SeatOrderDAOImpl();
		for(SeatOrder so : sc.getSeatOrderByCondition(9,1, 2)){
			System.out.println(so.getSeat());
		}
	}*/

}
