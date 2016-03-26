package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FEEDBACK")
public class Feedback implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "FEEDBACK_ID")
	private Integer feedbackId;
	
	@Column(name = "FEEDBACK_TITLE")
	private String feedbackTitle;
	
	@Column(name = "FEEDBACK_CONTENT")
	private String feedbackContent;
	
	@Column(name = "FEEDBACK_PERSON_NAME")
	private String feedbackPersonName;
	
	@Column(name = "FEEDBACK_PERSON_EMAIL")
	private String feedbackPersonEmail;
	
	@Column(name = "FEEDBACK_PERSON_PHONE")
	private String feedbackPersonPhone;

	public Integer getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackTitle() {
		return feedbackTitle;
	}

	public void setFeedbackTitle(String feedbackTitle) {
		this.feedbackTitle = feedbackTitle;
	}

	public String getFeedbackContent() {
		return feedbackContent;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}

	public String getFeedbackPersonName() {
		return feedbackPersonName;
	}

	public void setFeedbackPersonName(String feedbackPersonName) {
		this.feedbackPersonName = feedbackPersonName;
	}

	public String getFeedbackPersonEmail() {
		return feedbackPersonEmail;
	}

	public void setFeedbackPersonEmail(String feedbackPersonEmail) {
		this.feedbackPersonEmail = feedbackPersonEmail;
	}

	public String getFeedbackPersonPhone() {
		return feedbackPersonPhone;
	}

	public void setFeedbackPersonPhone(String feedbackPersonPhone) {
		this.feedbackPersonPhone = feedbackPersonPhone;
	}

	public Feedback(Integer feedbackId, String feedbackTitle, String feedbackContent, String feedbackPersonName,
			String feedbackPersonEmail, String feedbackPersonPhone) {
		super();
		this.feedbackId = feedbackId;
		this.feedbackTitle = feedbackTitle;
		this.feedbackContent = feedbackContent;
		this.feedbackPersonName = feedbackPersonName;
		this.feedbackPersonEmail = feedbackPersonEmail;
		this.feedbackPersonPhone = feedbackPersonPhone;
	}

	public Feedback(String feedbackTitle, String feedbackContent, String feedbackPersonName, String feedbackPersonEmail,
			String feedbackPersonPhone) {
		super();
		this.feedbackTitle = feedbackTitle;
		this.feedbackContent = feedbackContent;
		this.feedbackPersonName = feedbackPersonName;
		this.feedbackPersonEmail = feedbackPersonEmail;
		this.feedbackPersonPhone = feedbackPersonPhone;
	}

	public Feedback() {
		super();
	}
	
	
}
