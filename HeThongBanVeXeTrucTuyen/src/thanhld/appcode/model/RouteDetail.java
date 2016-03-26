package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "ROUTE_DETAIL")
public class RouteDetail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ROUTE_DETAIL_ID")
	private Integer routeDetailId;
	
	@Column(name = "ROUTE_ID")
	private Integer routeId;
	
	@Column(name = "PROVINCE_ID")
	private Integer provinceId;
	
	@Column(name = "NUMBERCIAL_ORDER")
	private Integer numbercialOrder;

	public Integer getRouteDetailId() {
		return routeDetailId;
	}

	public void setRouteDetailId(Integer routeDetailId) {
		this.routeDetailId = routeDetailId;
	}

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public Integer getNumbercialOrder() {
		return numbercialOrder;
	}

	public void setNumbercialOrder(Integer numbercialOrder) {
		this.numbercialOrder = numbercialOrder;
	}

	public RouteDetail(Integer routeDetailId, Integer routeId, Integer provinceId, Integer numbercialOrder) {
		super();
		this.routeDetailId = routeDetailId;
		this.routeId = routeId;
		this.provinceId = provinceId;
		this.numbercialOrder = numbercialOrder;
	}

	public RouteDetail(Integer routeId, Integer provinceId, Integer numbercialOrder) {
		super();
		this.routeId = routeId;
		this.provinceId = provinceId;
		this.numbercialOrder = numbercialOrder;
	}

	public RouteDetail() {
		super();
	}

}
