package thanhld.appcode.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NEWS")
public class News implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NEWS_ID")
	private Integer newsId;
	
	@Column(name = "NEWS_TITLE")
	private String newsTitle;
	
	@Column(name = "NEWS_BRIEF_CONTENT")
	private String newsBriefContent;
	
	@Column(name = "NEWS_CONTENT")
	private String newsContent;
	
	@Column(name = "NEWS_POST_DATE")
	private String newsPostDate;
	
	@Column(name = "NEWS_AUTHOR_ID")
	private String newsAuthorId;

	public Integer getNewsId() {
		return newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsBriefContent() {
		return newsBriefContent;
	}

	public void setNewsBriefContent(String newsBriefContent) {
		this.newsBriefContent = newsBriefContent;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public String getNewsPostDate() {
		return newsPostDate;
	}

	public void setNewsPostDate(String newsPostDate) {
		this.newsPostDate = newsPostDate;
	}

	public String getNewsAuthorId() {
		return newsAuthorId;
	}

	public void setNewsAuthorId(String newsAuthorId) {
		this.newsAuthorId = newsAuthorId;
	}

	public News(Integer newsId, String newsTitle, String newsBriefContent, String newsContent, String newsPostDate,
			String newsAuthorId) {
		super();
		this.newsId = newsId;
		this.newsTitle = newsTitle;
		this.newsBriefContent = newsBriefContent;
		this.newsContent = newsContent;
		this.newsPostDate = newsPostDate;
		this.newsAuthorId = newsAuthorId;
	}

	public News(String newsTitle, String newsBriefContent, String newsContent, String newsPostDate,
			String newsAuthorId) {
		super();
		this.newsTitle = newsTitle;
		this.newsBriefContent = newsBriefContent;
		this.newsContent = newsContent;
		this.newsPostDate = newsPostDate;
		this.newsAuthorId = newsAuthorId;
	}

	public News() {
		super();
	}
	
	
}
