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
		Session session = null;
		Transaction trans = null;
		Object obj = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			trans = session.beginTransaction();
			obj = session.get(clas, id);
			session.flush();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			session.close();
		}
		return obj;

	}

	public static Object getObjectById(String id, Class clas) {
		Session session = null;
		Transaction trans = null;
		Object obj = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			trans = session.beginTransaction();
			obj = session.get(clas, id);
			session.flush();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			session.close();
		}
		return obj;

	}

	public static void update(Object obj) {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			trans = session.beginTransaction();
			session.merge(obj);
			session.flush();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			session.close();
		}
	}

	public static void addObject(Object dt) throws Exception {
		Session session = null;
		Transaction trans = null;
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			trans = session.beginTransaction();
			session.save(dt);
			session.flush();
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			session.close();
		}
	}

	public static void deleteObject(int id, Class clas) {
		Session session = null;
		Transaction trans = null;
		Object obj =null;
		try {
		session = HibernateUtils.getSessionFactory().openSession();
		trans = session.beginTransaction();
		obj = session.get(clas, id);
		session.delete(obj);
		session.flush();
		trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
		} finally {
			session.close();
		}
	}

}
