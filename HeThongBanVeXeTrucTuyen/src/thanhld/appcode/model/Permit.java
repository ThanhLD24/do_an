package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PERMIT")
public class Permit implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PERMIT_ID")
	private Integer permitId;

	@Column(name = "PERMIT_NAME")
	private String permitName;

	public Integer getPermitId() {
		return permitId;
	}

	public void setPermitId(Integer permitId) {
		this.permitId = permitId;
	}

	public String getPermitName() {
		return permitName;
	}

	public void setPermitName(String permitName) {
		this.permitName = permitName;
	}

	public Permit(Integer permitId, String permitName) {
		super();
		this.permitId = permitId;
		this.permitName = permitName;
	}

	public Permit(String permitName) {
		super();
		this.permitName = permitName;
	}

	public Permit() {
		super();
	}

}
