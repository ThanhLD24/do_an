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
	@Override
	public List<Employee> getListEmployeeByJob(int jobId) {
		session = HibernateUtils.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		sqlQuery = new StringBuilder();
		sqlQuery.append(" select * from EMPLOYEE where EMPLOYEE_JOB_ID=" + jobId + "");
		Query query = session.createSQLQuery(sqlQuery.toString()).addEntity(Employee.class);
		List<Employee> listEmployee = (List<Employee>) query.list();
		transaction.commit();
		return listEmployee;
	}

}
