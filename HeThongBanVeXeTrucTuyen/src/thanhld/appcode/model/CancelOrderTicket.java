package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CANCEL_ORDER_TICKET")
public class CancelOrderTicket implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CANCEL_ORDER_TICKET_ID")
	private Integer cancelOrderTicketId;

	@Column(name = "ORDER_TICKET_ID")
	private String orderTicketId;

	@Column(name = "CANCEL_ORDER_TICKET_CANCEL_TIME")
	private String cancelOrderTicketCancelTime;

	@Column(name = "CANCEL_ORDER_TICKET_REFUND")
	private String cancelOrderTicketRefund;

	@Column(name = "CANCEL_ORDER_TICKET_INTEREST")
	private String cancelOrderTickerInterest;

	@Column(name = "CANCEL_ORDER_TICKET_STATUS")
	private Boolean cancelOrderTickerStatus;

	@Column(name = "CANCEL_ORDER_TICKET_NOTES")
	private String cancelOrderTickerNotes;

	public Integer getCancelOrderTicketId() {
		return cancelOrderTicketId;
	}

	public void setCancelOrderTicketId(Integer cancelOrderTicketId) {
		this.cancelOrderTicketId = cancelOrderTicketId;
	}


	public String getOrderTicketId() {
		return orderTicketId;
	}

	public void setOrderTicketId(String orderTicketId) {
		this.orderTicketId = orderTicketId;
	}

	public String getCancelOrderTicketCancelTime() {
		return cancelOrderTicketCancelTime;
	}

	public void setCancelOrderTicketCancelTime(String cancelOrderTicketCancelTime) {
		this.cancelOrderTicketCancelTime = cancelOrderTicketCancelTime;
	}

	public String getCancelOrderTicketRefund() {
		return cancelOrderTicketRefund;
	}

	public void setCancelOrderTicketRefund(String cancelOrderTicketRefund) {
		this.cancelOrderTicketRefund = cancelOrderTicketRefund;
	}

	public String getCancelOrderTickerInterest() {
		return cancelOrderTickerInterest;
	}

	public void setCancelOrderTickerInterest(String cancelOrderTickerInterest) {
		this.cancelOrderTickerInterest = cancelOrderTickerInterest;
	}

	public Boolean getCancelOrderTickerStatus() {
		return cancelOrderTickerStatus;
	}

	public void setCancelOrderTickerStatus(Boolean cancelOrderTickerStatus) {
		this.cancelOrderTickerStatus = cancelOrderTickerStatus;
	}

	public String getCancelOrderTickerNotes() {
		return cancelOrderTickerNotes;
	}

	public void setCancelOrderTickerNotes(String cancelOrderTickerNotes) {
		this.cancelOrderTickerNotes = cancelOrderTickerNotes;
	}

	public CancelOrderTicket(Integer cancelOrderTicketId,  String orderTicketId,
			String cancelOrderTicketCancelTime, String cancelOrderTicketRefund, String cancelOrderTickerInterest,
			Boolean cancelOrderTickerStatus, String cancelOrderTickerNotes) {
		super();
		this.cancelOrderTicketId = cancelOrderTicketId;
		this.orderTicketId = orderTicketId;
		this.cancelOrderTicketCancelTime = cancelOrderTicketCancelTime;
		this.cancelOrderTicketRefund = cancelOrderTicketRefund;
		this.cancelOrderTickerInterest = cancelOrderTickerInterest;
		this.cancelOrderTickerStatus = cancelOrderTickerStatus;
		this.cancelOrderTickerNotes = cancelOrderTickerNotes;
	}

	public CancelOrderTicket( String orderTicketId, String cancelOrderTicketCancelTime,
			String cancelOrderTicketRefund, String cancelOrderTickerInterest, Boolean cancelOrderTickerStatus,
			String cancelOrderTickerNotes) {
		super();
		this.orderTicketId = orderTicketId;
		this.cancelOrderTicketCancelTime = cancelOrderTicketCancelTime;
		this.cancelOrderTicketRefund = cancelOrderTicketRefund;
		this.cancelOrderTickerInterest = cancelOrderTickerInterest;
		this.cancelOrderTickerStatus = cancelOrderTickerStatus;
		this.cancelOrderTickerNotes = cancelOrderTickerNotes;
	}

	public CancelOrderTicket() {
		super();
	}

}
