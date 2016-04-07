package thanhld.appcode.dao;

import thanhld.appcode.model.Account;

public interface AccountDAO {
	public Account checkLogin(String account, String password);
}
