package myBean.article;

import java.sql.*;

public class Article {
	private int id;
	private String title;
	private String content;
	private boolean isImportant;
	private boolean isSecret;
	private int articleboardId;
	private String bgColor;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private int viewCount;

	public Article() {
	}

	public Article(int id, String title, String content, boolean isImportant, boolean isSecret, int articleboardId, String bgColor) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.isImportant = isImportant;
		this.isSecret = isSecret;
		this.articleboardId = articleboardId;
		this.bgColor = bgColor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean isImportant() {
		return isImportant;
	}

	public void setImportant(boolean isImportant) {
		this.isImportant = isImportant;
	}

	public boolean isSecret() {
		return isSecret;
	}

	public void setSecret(boolean isSecret) {
		this.isSecret = isSecret;
	}

	public int getArticleboardId() {
		return articleboardId;
	}

	public void setArticleboardId(int articleboardId) {
		this.articleboardId = articleboardId;
	}

	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
}