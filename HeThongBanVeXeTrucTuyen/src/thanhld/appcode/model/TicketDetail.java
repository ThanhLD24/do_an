package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TICKET_DETAIL")
public class TicketDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "TICKET_DETAIL_ID")
	private Integer ticketDetailId;
	
	@Column(name = "TICKET_ID")
	private String ticketId;
	
	@Column(name = "PROVINCE_ID")
	private Integer provinceId;
	
	@Column(name = "BUS_STATION_ID")
	private Integer busStationId;
	
	@Column(name = "DETAIL_DATE")
	private String detailDate;
	
	@Column(name = "DETAIL_TIME")
	private String detailTime;

	public Integer getTicketDetailId() {
		return ticketDetailId;
	}

	public void setTicketDetailId(Integer ticketDetailId) {
		this.ticketDetailId = ticketDetailId;
	}

	public String getTicketId() {
		return ticketId;
	}

	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public Integer getBusStationId() {
		return busStationId;
	}

	public void setBusStationId(Integer busStationId) {
		this.busStationId = busStationId;
	}

	public String getDetailDate() {
		return detailDate;
	}

	public void setDetailDate(String detailDate) {
		this.detailDate = detailDate;
	}

	public String getDetailTime() {
		return detailTime;
	}

	public void setDetailTime(String detailTime) {
		this.detailTime = detailTime;
	}

	public TicketDetail(Integer ticketDetailId, String ticketId, Integer provinceId, Integer busStationId,
			String detailDate, String detailTime) {
		super();
		this.ticketDetailId = ticketDetailId;
		this.ticketId = ticketId;
		this.provinceId = provinceId;
		this.busStationId = busStationId;
		this.detailDate = detailDate;
		this.detailTime = detailTime;
	}

	public TicketDetail(String ticketId, Integer provinceId, Integer busStationId, String detailDate,
			String detailTime) {
		super();
		this.ticketId = ticketId;
		this.provinceId = provinceId;
		this.busStationId = busStationId;
		this.detailDate = detailDate;
		this.detailTime = detailTime;
	}

	public TicketDetail() {
		super();
	}
	
	
}
