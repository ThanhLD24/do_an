package thanhld.appcode.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import thanhld.appcode.model.Account;
import thanhld.appcode.model.BusStation;
import thanhld.appcode.utility.HibernateUtils;

public class AccountDAOImpl implements AccountDAO {
	Session session = null;
	Transaction transaction = null;
	StringBuilder sqlQuery = null;
	Query query = null;
	Account account = null;

	@Override
	public Account checkLogin(String name, String password) {
		// TODO Auto-generated method stub
		try {
			session = HibernateUtils.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			sqlQuery = new StringBuilder();
			sqlQuery.append(
					" select * from ACCOUNT where ACCOUNT_NAME='" + name + "' AND ACCOUNT_PASSWORD='" + password + "'");
			query = session.createSQLQuery(sqlQuery.toString()).addEntity(Account.class);
			account = (Account) query.uniqueResult();
			transaction.commit();
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return account;
	}

}
