package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEE")
public class Employee implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "EMPLOYEE_ID")
	private Integer employeeId;
	
	@Column(name = "EMPLOYEE_NAME_TITLE")
	private String employeeNameTitle;
	
	@Column(name = "EMPLOYEE_NAME")
	private String employeeName;
	
	@Column(name = "EMPLOYEE_BIRTHDAY")
	private String employeeBirthday;
	
	@Column(name = "EMPLOYEE_EMAIL")
	private String employeeEmail;
	
	@Column(name = "EMPLOYEE_IMAGE")
	private String employeeImage;
	
	@Column(name = "EMPLOYEE_ADDRESS")
	private String employeeAddress;
	
	@Column(name = "EMPLOYEE_NATIONALITY")
	private String employeeNationality;
	
	@Column(name = "EMPLOYEE_GENDER")
	private String employeeGender;
	
	@Column(name = "EMPLOYEE_PHONE")
	private String employeePhone;
	
	@Column(name = "EMPLOYEE_HOMEPHONE")
	private String employeeHomePhone;
	
	@Column(name = "EMPLOYEE_OFFICEPHONE")
	private String employeeOfficePhone;
	
	@Column(name = "EMPLOYEE_JOB_ID")
	private Integer employeeJobId;
	
	@Column(name = "EMPLOYEE_APPLYYEAR")
	private String employeeApplyYear;
	
	@Column(name = "EMPLOYEE_IDENTITY_NUMBER")
	private String employeeIdentityNumber;
	
	@Column(name = "EMPLOYEE_NOTES")
	private String employeeNotes;
	
	@Column(name = "EMPLOYEE_STATE")
	private Boolean employeeState;

	public Integer getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeNameTitle() {
		return employeeNameTitle;
	}

	public void setEmployeeNameTitle(String employeeNameTitle) {
		this.employeeNameTitle = employeeNameTitle;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeBirthday() {
		return employeeBirthday;
	}

	public void setEmployeeBirthday(String employeeBirthday) {
		this.employeeBirthday = employeeBirthday;
	}

	public String getEmployeeEmail() {
		return employeeEmail;
	}

	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}

	public String getEmployeeImage() {
		return employeeImage;
	}

	public void setEmployeeImage(String employeeImage) {
		this.employeeImage = employeeImage;
	}

	public String getEmployeeAddress() {
		return employeeAddress;
	}

	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}

	public String getEmployeeNationality() {
		return employeeNationality;
	}

	public void setEmployeeNationality(String employeeNationality) {
		this.employeeNationality = employeeNationality;
	}

	public String getEmployeeGender() {
		return employeeGender;
	}

	public void setEmployeeGender(String employeeGender) {
		this.employeeGender = employeeGender;
	}

	public String getEmployeePhone() {
		return employeePhone;
	}

	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}

	public String getEmployeeHomePhone() {
		return employeeHomePhone;
	}

	public void setEmployeeHomePhone(String employeeHomePhone) {
		this.employeeHomePhone = employeeHomePhone;
	}

	public String getEmployeeOfficePhone() {
		return employeeOfficePhone;
	}

	public void setEmployeeOfficePhone(String employeeOfficePhone) {
		this.employeeOfficePhone = employeeOfficePhone;
	}

	public Integer getEmployeeJobId() {
		return employeeJobId;
	}

	public void setEmployeeJobId(Integer employeeJobId) {
		this.employeeJobId = employeeJobId;
	}

	public String getEmployeeApplyYear() {
		return employeeApplyYear;
	}

	public void setEmployeeApplyYear(String employeeApplyYear) {
		this.employeeApplyYear = employeeApplyYear;
	}

	public String getEmployeeIdentityNumber() {
		return employeeIdentityNumber;
	}

	public void setEmployeeIdentityNumber(String employeeIdentityNumber) {
		this.employeeIdentityNumber = employeeIdentityNumber;
	}

	public String getEmployeeNotes() {
		return employeeNotes;
	}

	public void setEmployeeNotes(String employeeNotes) {
		this.employeeNotes = employeeNotes;
	}

	public Boolean getEmployeeState() {
		return employeeState;
	}

	public void setEmployeeState(Boolean employeeState) {
		this.employeeState = employeeState;
	}

	public Employee(Integer employeeId, String employeeNameTitle, String employeeName, String employeeBirthday,
			String employeeEmail, String employeeImage, String employeeAddress, String employeeNationality,
			String employeeGender, String employeePhone, String employeeHomePhone, String employeeOfficePhone,
			Integer employeeJobId, String employeeApplyYear, String employeeIdentityNumber, String employeeNotes,
			Boolean employeeState) {
		super();
		this.employeeId = employeeId;
		this.employeeNameTitle = employeeNameTitle;
		this.employeeName = employeeName;
		this.employeeBirthday = employeeBirthday;
		this.employeeEmail = employeeEmail;
		this.employeeImage = employeeImage;
		this.employeeAddress = employeeAddress;
		this.employeeNationality = employeeNationality;
		this.employeeGender = employeeGender;
		this.employeePhone = employeePhone;
		this.employeeHomePhone = employeeHomePhone;
		this.employeeOfficePhone = employeeOfficePhone;
		this.employeeJobId = employeeJobId;
		this.employeeApplyYear = employeeApplyYear;
		this.employeeIdentityNumber = employeeIdentityNumber;
		this.employeeNotes = employeeNotes;
		this.employeeState = employeeState;
	}

	public Employee(String employeeNameTitle, String employeeName, String employeeBirthday, String employeeEmail,
			String employeeImage, String employeeAddress, String employeeNationality, String employeeGender,
			String employeePhone, String employeeHomePhone, String employeeOfficePhone, Integer employeeJobId,
			String employeeApplyYear, String employeeIdentityNumber, String employeeNotes, Boolean employeeState) {
		super();
		this.employeeNameTitle = employeeNameTitle;
		this.employeeName = employeeName;
		this.employeeBirthday = employeeBirthday;
		this.employeeEmail = employeeEmail;
		this.employeeImage = employeeImage;
		this.employeeAddress = employeeAddress;
		this.employeeNationality = employeeNationality;
		this.employeeGender = employeeGender;
		this.employeePhone = employeePhone;
		this.employeeHomePhone = employeeHomePhone;
		this.employeeOfficePhone = employeeOfficePhone;
		this.employeeJobId = employeeJobId;
		this.employeeApplyYear = employeeApplyYear;
		this.employeeIdentityNumber = employeeIdentityNumber;
		this.employeeNotes = employeeNotes;
		this.employeeState = employeeState;
	}

	public Employee() {
		super();
	}

	
}
