package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ACCOUNT")
public class Account implements Serializable {
	/**
		 * 
		 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ACCOUNT_ID")
	private Integer accountId;
	
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name = "ACCOUNT_NAME")
	private String accountName;
	
	@Column(name = "ACCOUNT_PASSWORD")
	private String accountPassword;
	
	@Column(name = "ACCOUNT_PERMIT")
	private Integer accountPermit;

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountPassword() {
		return accountPassword;
	}

	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}

	public Integer getAccountPermit() {
		return accountPermit;
	}

	public void setAccountPermit(Integer accountPermit) {
		this.accountPermit = accountPermit;
	}

	public Account(Integer accountId, Integer employeeId, String accountName, String accountPassword,
			Integer accountPermit) {
		super();
		this.accountId = accountId;
		this.employeeId = employeeId;
		this.accountName = accountName;
		this.accountPassword = accountPassword;
		this.accountPermit = accountPermit;
	}

	public Account(Integer employeeId, String accountName, String accountPassword, Integer accountPermit) {
		super();
		this.employeeId = employeeId;
		this.accountName = accountName;
		this.accountPassword = accountPassword;
		this.accountPermit = accountPermit;
	}

	public Account() {
		super();
	}
	
	
}
