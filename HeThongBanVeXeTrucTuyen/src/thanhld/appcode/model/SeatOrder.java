package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SEAT_ORDER")
public class SeatOrder implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SEAT_ORDER_ID")
	private Integer seatOrderId;

	@Column(name = "TICKET_ID")
	private Integer ticketId;

	@Column(name = "ORDER_TICKET_ID")
	private String orderTicketId;

	@Column(name = "SEAT")
	private String seat;

	@Column(name = "ROUTES")
	private String routes;

	public Integer getSeatOrderId() {
		return seatOrderId;
	}

	public void setSeatOrderId(Integer seatOrderId) {
		this.seatOrderId = seatOrderId;
	}

	public Integer getTicketId() {
		return ticketId;
	}

	public void setTicketId(Integer ticketId) {
		this.ticketId = ticketId;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getRoutes() {
		return routes;
	}

	public void setRoutes(String routes) {
		this.routes = routes;
	}

	public String getOrderTicketId() {
		return orderTicketId;
	}

	public void setOrderTicketId(String orderTicketId) {
		this.orderTicketId = orderTicketId;
	}

	public SeatOrder(Integer ticketId, String orderTicketId, String seat, String routes) {
		super();
		this.ticketId = ticketId;
		this.orderTicketId = orderTicketId;
		this.seat = seat;
		this.routes = routes;
	}

	public SeatOrder(Integer seatOrderId, Integer ticketId, String orderTicketId, String seat, String routes) {
		super();
		this.seatOrderId = seatOrderId;
		this.ticketId = ticketId;
		this.orderTicketId = orderTicketId;
		this.seat = seat;
		this.routes = routes;
	}

	public SeatOrder() {
		super();
	}

}
