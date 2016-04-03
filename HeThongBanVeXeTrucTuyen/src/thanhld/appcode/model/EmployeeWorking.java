package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE_WORKING")
public class EmployeeWorking implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "EMPLOYEE_WORKING_ID")
	private Integer employeeWorkingId;
	@Column(name = "TICKET_ID")
	private String ticketId;
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	@Column(name = "START_RUN_DATE")
	private String startRunDate;
	@Column(name = "END_RUN_DATE")
	private String endRunDate;

	public Integer getEmployeeWorkingId() {
		return employeeWorkingId;
	}

	public void setEmployeeWorkingId(Integer employeeWorkingId) {
		this.employeeWorkingId = employeeWorkingId;
	}

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getStartRunDate() {
		return startRunDate;
	}

	public void setStartRunDate(String startRunDate) {
		this.startRunDate = startRunDate;
	}

	public String getEndRunDate() {
		return endRunDate;
	}

	public void setEndRunDate(String endRunDate) {
		this.endRunDate = endRunDate;
	}

	public EmployeeWorking(Integer employeeWorkingId, String ticketId, Integer employeeId, String startRunDate,
			String endRunDate) {
		super();
		this.employeeWorkingId = employeeWorkingId;
		this.ticketId = ticketId;
		this.employeeId = employeeId;
		this.startRunDate = startRunDate;
		this.endRunDate = endRunDate;
	}

	public EmployeeWorking(String ticketId, Integer employeeId, String startRunDate, String endRunDate) {
		super();
		this.ticketId = ticketId;
		this.employeeId = employeeId;
		this.startRunDate = startRunDate;
		this.endRunDate = endRunDate;
	}

	public EmployeeWorking() {
		super();
	}

}
