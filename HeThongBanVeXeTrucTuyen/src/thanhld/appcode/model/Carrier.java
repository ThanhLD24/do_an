package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CARRIER")
public class Carrier implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CARRIER_ID")
	private Integer carrierId;
	
	@Column(name = "CARRIER_NAME")
	private String carrierName;
	
	@Column(name = "CARRIER_IMAGE")
	private String carrierImage;
	
	@Column(name = "CARRIER_OTHER")
	private String carrierOther;

	public Integer getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(Integer carrierId) {
		this.carrierId = carrierId;
	}

	public String getCarrierName() {
		return carrierName;
	}

	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

	public String getCarrierImage() {
		return carrierImage;
	}

	public void setCarrierImage(String carrierImage) {
		this.carrierImage = carrierImage;
	}

	public String getCarrierOther() {
		return carrierOther;
	}

	public void setCarrierOther(String carrierOther) {
		this.carrierOther = carrierOther;
	}

	public Carrier(Integer carrierId, String carrierName, String carrierImage, String carrierOther) {
		super();
		this.carrierId = carrierId;
		this.carrierName = carrierName;
		this.carrierImage = carrierImage;
		this.carrierOther = carrierOther;
	}

	public Carrier(String carrierName, String carrierImage, String carrierOther) {
		super();
		this.carrierName = carrierName;
		this.carrierImage = carrierImage;
		this.carrierOther = carrierOther;
	}

	public Carrier() {
		super();
	}
	
}
