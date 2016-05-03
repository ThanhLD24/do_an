package thanhld.appcode.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.Employee;
import thanhld.appcode.utility.HibernateUtils;

public class EmployeeDAOImpl implements EmployeeDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;
	Query query = null;
	List<Employee> listEmployee = null;

	@Override
	public List<Employee> getListEmployeeByJob(int jobId) {
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from EMPLOYEE where EMPLOYEE_JOB_ID=" + jobId + "");
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(Employee.class);
			listEmployee = (List<Employee>) query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listEmployee;
	}
	
	@Override
	public List<Employee> getListEmployeeByDriver(int jobDriverId, int jobExtraDriverId) {
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(" select * from EMPLOYEE where EMPLOYEE_JOB_ID=" + jobDriverId + " or EMPLOYEE_JOB_ID=" + jobExtraDriverId+"");
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(Employee.class);
			listEmployee = (List<Employee>) query.list();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return listEmployee;
	}

}
