package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "TICKET")
public class Ticket implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "TICKET_ID")
	private String ticketId;
	
	@Column(name = "TICKET_STATE")
	private String ticketState;
	
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name = "ROUTE_ID")
	private Integer routeId;
	
	@Column(name = "BUS_ID")
	private Integer busId;
	
	
	@Column(name = "TICKET_PRICE")
	private String ticketPrice;
	
	@Column(name = "TICKET_TAX")
	private String ticketTax;
	
	@Column(name = "TICKET_SALE")
	private String ticketSale;
	
	@Column(name = "TICKET_FITMENT_PRICE")
	private String ticketFitmentPrice;
	
	@Column(name = "TICKET_CURRENCY")
	private String ticketCurrency;
	
	@Column(name = "TICKET_AVAILABLE")
	private Boolean ticketAvailable;
	
	@Column(name = "TICKET_COUNT")
	private Integer ticketCount;
	
	@Column(name = "TICKET_START_SELL_DATE")
	private String ticketStartSellDate;
	
	@Column(name = "TICKET_END_SELL_DATE")
	private String ticketEndSellDate;

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	public String getTicketState() {
		return ticketState;
	}

	public void setTicketState(String ticketState) {
		this.ticketState = ticketState;
	}

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}

	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	

	public String getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(String ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getTicketTax() {
		return ticketTax;
	}

	public void setTicketTax(String ticketTax) {
		this.ticketTax = ticketTax;
	}

	public String getTicketSale() {
		return ticketSale;
	}

	public void setTicketSale(String ticketSale) {
		this.ticketSale = ticketSale;
	}

	public String getTicketFitmentPrice() {
		return ticketFitmentPrice;
	}

	public void setTicketFitmentPrice(String ticketFitmentPrice) {
		this.ticketFitmentPrice = ticketFitmentPrice;
	}

	public String getTicketCurrency() {
		return ticketCurrency;
	}

	public void setTicketCurrency(String ticketCurrency) {
		this.ticketCurrency = ticketCurrency;
	}

	public Boolean getTicketAvailable() {
		return ticketAvailable;
	}

	public void setTicketAvailable(Boolean ticketAvailable) {
		this.ticketAvailable = ticketAvailable;
	}

	public Integer getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(Integer ticketCount) {
		this.ticketCount = ticketCount;
	}

	public String getTicketStartSellDate() {
		return ticketStartSellDate;
	}

	public void setTicketStartSellDate(String ticketStartSellDate) {
		this.ticketStartSellDate = ticketStartSellDate;
	}

	public String getTicketEndSellDate() {
		return ticketEndSellDate;
	}

	public void setTicketEndSellDate(String ticketEndSellDate) {
		this.ticketEndSellDate = ticketEndSellDate;
	}

	public Ticket(String ticketId, String ticketState, Integer employeeId, Integer routeId, Integer busId,
			String ticketPrice, String ticketTax, String ticketSale, String ticketFitmentPrice, String ticketCurrency,
			Boolean ticketAvailable, Integer ticketCount, String ticketStartSellDate, String ticketEndSellDate) {
		super();
		this.ticketId = ticketId;
		this.ticketState = ticketState;
		this.employeeId = employeeId;
		this.routeId = routeId;
		this.busId = busId;
		this.ticketPrice = ticketPrice;
		this.ticketTax = ticketTax;
		this.ticketSale = ticketSale;
		this.ticketFitmentPrice = ticketFitmentPrice;
		this.ticketCurrency = ticketCurrency;
		this.ticketAvailable = ticketAvailable;
		this.ticketCount = ticketCount;
		this.ticketStartSellDate = ticketStartSellDate;
		this.ticketEndSellDate = ticketEndSellDate;
	}

	public Ticket() {
		super();
	}

	
	
	
}
