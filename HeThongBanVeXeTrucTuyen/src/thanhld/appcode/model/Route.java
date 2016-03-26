package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ROUTE")
public class Route implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ROUTE_ID")
	private Integer routeId;

	@Column(name = "ROUTE_ORIGIN_ID")
	private Integer routeOriginId;

	@Column(name = "ROUTE_DESTINATION_ID")
	private Integer routeDestinationId;

	@Column(name = "ROUTE_DESCRIPTION")
	private String routeDescription;

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}

	public Integer getRouteOriginId() {
		return routeOriginId;
	}

	public void setRouteOriginId(Integer routeOriginId) {
		this.routeOriginId = routeOriginId;
	}

	public Integer getRouteDestinationId() {
		return routeDestinationId;
	}

	public void setRouteDestinationId(Integer routeDestinationId) {
		this.routeDestinationId = routeDestinationId;
	}

	public String getRouteDescription() {
		return routeDescription;
	}

	public void setRouteDescription(String routeDescription) {
		this.routeDescription = routeDescription;
	}

	public Route(Integer routeOriginId, Integer routeDestinationId, String routeDescription) {
		super();
		this.routeOriginId = routeOriginId;
		this.routeDestinationId = routeDestinationId;
		this.routeDescription = routeDescription;
	}

	public Route(Integer routeId, Integer routeOriginId, Integer routeDestinationId, String routeDescription) {
		super();
		this.routeId = routeId;
		this.routeOriginId = routeOriginId;

		this.routeDestinationId = routeDestinationId;

		this.routeDescription = routeDescription;
	}

	public Route() {
		super();
	}

}
