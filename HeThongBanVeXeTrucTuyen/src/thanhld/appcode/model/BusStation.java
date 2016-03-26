package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "BUS_STATION")
public class BusStation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BUS_STATION_ID")
	private Integer busStationId;
	
	@Column(name = "PROVINCE_ID")
	private Integer provinceId;
	
	@Column(name = "BUS_STATION_NAME")
	private String busStationName;
	
	@Column(name = "BUS_STATION_NOTES")
	private String busStationNotes;

	public Integer getBusStationId() {
		return busStationId;
	}

	public void setBusStationId(Integer busStationId) {
		this.busStationId = busStationId;
	}

	public String getBusStationName() {
		return busStationName;
	}

	public void setBusStationName(String busStationName) {
		this.busStationName = busStationName;
	}

	public String getBusStationNotes() {
		return busStationNotes;
	}

	public void setBusStationNotes(String busStationNotes) {
		this.busStationNotes = busStationNotes;
	}


	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public BusStation(Integer provinceId, String busStationName, String busStationNotes) {
		super();
		this.provinceId = provinceId;
		this.busStationName = busStationName;
		this.busStationNotes = busStationNotes;
	}

	public BusStation(Integer busStationId, Integer provinceId, String busStationName, String busStationNotes) {
		super();
		this.busStationId = busStationId;
		this.provinceId = provinceId;
		this.busStationName = busStationName;
		this.busStationNotes = busStationNotes;
	}

	public BusStation() {
		super();
	}
	
}
