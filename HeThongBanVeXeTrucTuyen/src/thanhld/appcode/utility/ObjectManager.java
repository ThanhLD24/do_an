package thanhld.appcode.utility;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class ObjectManager {

	public static List listObject(Class object) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		List list = session.createCriteria(object).list();
		return list;
	}
	public static Object getObjectById(int id, Class clas) {
		Session session =HibernateUtils.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		Object obj = session.get(clas, id);
		trans.commit();
		session.flush();
		return obj;

	}
	
	public static Object getObjectById(String id, Class clas) {
		Session session =HibernateUtils.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		Object obj = session.get(clas, id);
		trans.commit();
		session.flush();
		return obj;

	} 
	public static void update(Object obj) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		session.merge(obj);
		trans.commit();
		session.flush();
	}

	
	public static void addObject(Object dt) throws Exception {

		try {
			Session session = HibernateUtils.getSessionFactory().openSession();
			Transaction trans = session.beginTransaction();
			session.save(dt);
			trans.commit();
			session.flush();

		} catch (Exception e) {
			throw e;
		}
	}

	
	public static void deleteObject(int id, Class clas) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		Transaction trans = session.beginTransaction();
		Object obj = session.get(clas, id);
		session.delete(obj);
		trans.commit();
		session.flush();
	}

}
