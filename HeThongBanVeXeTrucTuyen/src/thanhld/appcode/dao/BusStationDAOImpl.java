package thanhld.appcode.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.BusStation;
import thanhld.appcode.utility.HibernateUtils;

public class BusStationDAOImpl implements BusStationDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;
	@Override
	public List<BusStation> getListStationByProvince(int provinceId) {
		// TODO Auto-generated method stub
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from BUS_STATION where PROVINCE_ID="+provinceId+"");
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(BusStation.class);
		List<BusStation> busStation = (List<BusStation>) query.list();
		transaction.commit();
		return busStation;

	}
	
	/*public static void main(String[] args) {
		BusStationDAOImpl b = new BusStationDAOImpl();
		for(BusStation bu : b.getListStationByProvince("2")){
			System.out.println(bu.getBusStationName());
		}
	}*/
	

}
