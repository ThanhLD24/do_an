package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "BUS")
public class Bus implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "BUS_ID")
	private Integer busId;
	
	@Column(name = "BUS_NAME")
	private String busName;
	
	@Column(name = "BUS_TYPE")
	private String busType;
	
	@Column(name = "BUS_CAPACITY")
	private Integer busCapacity;
	
	@Column(name = "BUS_MAP")
	private String busMap;
	
	@Column(name = "BUS_FEATURE")
	private String busFeature;
	
	@Column(name = "BUS_LICENSE_PLATE")
	private String busLicensePlate;
	
	@Column(name = "BUS_MANUFACTURER")
	private String busManufacturer;
	
	@Column(name = "CARRIER_ID")
	private Integer carrierId;
	
	@Column(name = "BUS_STATE")
	private Integer busState;

	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getBusType() {
		return busType;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}

	public Integer getBusCapacity() {
		return busCapacity;
	}

	public void setBusCapacity(Integer busCapacity) {
		this.busCapacity = busCapacity;
	}

	public String getBusMap() {
		return busMap;
	}

	public void setBusMap(String busMap) {
		this.busMap = busMap;
	}

	public String getBusFeature() {
		return busFeature;
	}

	public void setBusFeature(String busFeature) {
		this.busFeature = busFeature;
	}

	public String getBusLicensePlate() {
		return busLicensePlate;
	}

	public void setBusLicensePlate(String busLicensePlate) {
		this.busLicensePlate = busLicensePlate;
	}

	public String getBusManufacturer() {
		return busManufacturer;
	}

	public void setBusManufacturer(String busManufacturer) {
		this.busManufacturer = busManufacturer;
	}

	public Integer getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(Integer carrierId) {
		this.carrierId = carrierId;
	}

	public Integer getBusState() {
		return busState;
	}

	public void setBusState(Integer busState) {
		this.busState = busState;
	}

	public Bus(Integer busId, String busName, String busType, Integer busCapacity, String busMap, String busFeature,
			String busLicensePlate, String busManufacturer, Integer carrierId, Integer busState) {
		super();
		this.busId = busId;
		this.busName = busName;
		this.busType = busType;
		this.busCapacity = busCapacity;
		this.busMap = busMap;
		this.busFeature = busFeature;
		this.busLicensePlate = busLicensePlate;
		this.busManufacturer = busManufacturer;
		this.carrierId = carrierId;
		this.busState = busState;
	}

	public Bus(String busName, String busType, Integer busCapacity, String busMap, String busFeature,
			String busLicensePlate, String busManufacturer, Integer carrierId, Integer busState) {
		super();
		this.busName = busName;
		this.busType = busType;
		this.busCapacity = busCapacity;
		this.busMap = busMap;
		this.busFeature = busFeature;
		this.busLicensePlate = busLicensePlate;
		this.busManufacturer = busManufacturer;
		this.carrierId = carrierId;
		this.busState = busState;
	}

	public Bus() {
		super();
	}

	
}
