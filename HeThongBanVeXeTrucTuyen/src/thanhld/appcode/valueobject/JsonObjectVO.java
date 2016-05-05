package thanhld.appcode.valueobject;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "JSON")
public class JsonObjectVO {
	@Id
	@Column(name = "JSON_NAME")
	public String name;
	@Column(name = "JSON_VALUE")
	public String y;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return  name + "," + y ;
	}

}
