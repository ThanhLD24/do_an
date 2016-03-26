package thanhld.appcode.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.Job;
import thanhld.appcode.utility.HibernateUtils;


public class JobDAOImpl {
	Session session = null;
    Transaction transaction = null;
    public static List listObject(Class object) {
		Session session = HibernateUtils.getSessionFactory().openSession();
		List list = session.createCriteria(object).list();
		return list;
	}
    public static void main(String[] args) {
		JobDAOImpl jDao = new JobDAOImpl();
		List<Job> lj = new ArrayList<Job>(); 
		lj = jDao.listObject(Job.class);
		System.out.println(lj.get(0).getJobName());
	}
}
