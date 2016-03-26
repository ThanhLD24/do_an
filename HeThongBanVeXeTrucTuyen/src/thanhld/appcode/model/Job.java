package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "JOB")
public class Job implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "JOB_ID")
	private Integer jobId;
	
	@Column(name = "JOB_NAME")
	private String jobName;
	
	@Column(name = "JOB_DESCRIPTION")
	private String jobDescription;

	public Integer getJobId() {
		return jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public Job() {
		super();
	}

	public Job(Integer jobId, String jobName, String jobDescription) {
		super();
		this.jobId = jobId;
		this.jobName = jobName;
		this.jobDescription = jobDescription;
	}

	public Job(String jobName, String jobDescription) {
		super();
		this.jobName = jobName;
		this.jobDescription = jobDescription;
	}

}
