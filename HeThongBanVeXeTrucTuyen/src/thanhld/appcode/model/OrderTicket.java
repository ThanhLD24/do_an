package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ORDER_TICKET")
public class OrderTicket implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ORDER_TICKET_ID")
	private String orderTicketId;
	
	@Column(name = "TICKET_ID")
	private String ticketId;
	
	@Column(name = "PASSENGER_NAME_TITLE")
	private String passengerNameTitle;
	
	@Column(name = "PASSENGER_NAME")
	private String passengerName;
	
	@Column(name = "PASSENGER_EMAIL")
	private String passengerEmail;
	
	@Column(name = "PASSENGER_ADDRESS")
	private String passengerAddress;
	
	@Column(name = "PASSENGER_GENDER")
	private String passengerGender;
	
	@Column(name = "PASSENGER_PHONE")
	private String passengerPhone;
	
	@Column(name = "ORDER_TICKET_SEAT")
	private String orderTicketSeat;
	
	@Column(name = "ORDER_TICKET_TOTAL_SEAT")
	private Integer orderTicketTotalSeat;
	
	@Column(name = "ORDER_TICKET_TOTAL_PRICE")
	private String orderTicketTotalPrice;
	
	@Column(name = "ORDER_TICKET_TIME")
	private String orderTicketTime;
	
	@Column(name = "ORDER_TICKET_EXPIRED_TIME")
	private String orderTicketExpiredTime;
	
	@Column(name = "ORDER_TICKET_PAIDDATE")
	private String orderTicketPaidDate;
	
	@Column(name = "ORDER_TICKET_STATUS")
	private Boolean orderTicketStatus;
	
	@Column(name = "ORDER_TICKET_OTHER")
	private String orderTicketOther;

	public String getOrderTicketId() {
		return orderTicketId;
	}

	public void setOrderTicketId(String orderTicketId) {
		this.orderTicketId = orderTicketId;
	}

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	public String getPassengerNameTitle() {
		return passengerNameTitle;
	}

	public void setPassengerNameTitle(String passengerNameTitle) {
		this.passengerNameTitle = passengerNameTitle;
	}

	public String getPassengerName() {
		return passengerName;
	}

	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}

	public String getPassengerEmail() {
		return passengerEmail;
	}

	public void setPassengerEmail(String passengerEmail) {
		this.passengerEmail = passengerEmail;
	}

	public String getPassengerAddress() {
		return passengerAddress;
	}

	public void setPassengerAddress(String passengerAddress) {
		this.passengerAddress = passengerAddress;
	}

	public String getPassengerGender() {
		return passengerGender;
	}

	public void setPassengerGender(String passengerGender) {
		this.passengerGender = passengerGender;
	}

	public String getPassengerPhone() {
		return passengerPhone;
	}

	public void setPassengerPhone(String passengerPhone) {
		this.passengerPhone = passengerPhone;
	}

	public String getOrderTicketSeat() {
		return orderTicketSeat;
	}

	public void setOrderTicketSeat(String orderTicketSeat) {
		this.orderTicketSeat = orderTicketSeat;
	}

	public Integer getOrderTicketTotalSeat() {
		return orderTicketTotalSeat;
	}

	public void setOrderTicketTotalSeat(Integer orderTicketTotalSeat) {
		this.orderTicketTotalSeat = orderTicketTotalSeat;
	}

	public String getOrderTicketTotalPrice() {
		return orderTicketTotalPrice;
	}

	public void setOrderTicketTotalPrice(String orderTicketTotalPrice) {
		this.orderTicketTotalPrice = orderTicketTotalPrice;
	}

	public String getOrderTicketTime() {
		return orderTicketTime;
	}

	public void setOrderTicketTime(String orderTicketTime) {
		this.orderTicketTime = orderTicketTime;
	}

	public String getOrderTicketExpiredTime() {
		return orderTicketExpiredTime;
	}

	public void setOrderTicketExpiredTime(String orderTicketExpiredTime) {
		this.orderTicketExpiredTime = orderTicketExpiredTime;
	}

	public String getOrderTicketPaidDate() {
		return orderTicketPaidDate;
	}

	public void setOrderTicketPaidDate(String orderTicketPaidDate) {
		this.orderTicketPaidDate = orderTicketPaidDate;
	}

	public Boolean getOrderTicketStatus() {
		return orderTicketStatus;
	}

	public void setOrderTicketStatus(Boolean orderTicketStatus) {
		this.orderTicketStatus = orderTicketStatus;
	}

	public String getOrderTicketOther() {
		return orderTicketOther;
	}

	public void setOrderTicketOther(String orderTicketOther) {
		this.orderTicketOther = orderTicketOther;
	}

	public OrderTicket(String orderTicketId, String ticketId, String passengerNameTitle, String passengerName,
			String passengerEmail, String passengerAddress, String passengerGender, String passengerPhone,
			String orderTicketSeat, Integer orderTicketTotalSeat, String orderTicketTotalPrice, String orderTicketTime,
			String orderTicketExpiredTime, String orderTicketPaidDate, Boolean orderTicketStatus,
			String orderTicketOther) {
		super();
		this.orderTicketId = orderTicketId;
		this.ticketId = ticketId;
		this.passengerNameTitle = passengerNameTitle;
		this.passengerName = passengerName;
		this.passengerEmail = passengerEmail;
		this.passengerAddress = passengerAddress;
		this.passengerGender = passengerGender;
		this.passengerPhone = passengerPhone;
		this.orderTicketSeat = orderTicketSeat;
		this.orderTicketTotalSeat = orderTicketTotalSeat;
		this.orderTicketTotalPrice = orderTicketTotalPrice;
		this.orderTicketTime = orderTicketTime;
		this.orderTicketExpiredTime = orderTicketExpiredTime;
		this.orderTicketPaidDate = orderTicketPaidDate;
		this.orderTicketStatus = orderTicketStatus;
		this.orderTicketOther = orderTicketOther;
	}

	public OrderTicket() {
		super();
	}

	
}
