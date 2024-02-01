package com.marondal.spring.test.lifecycle;

public class Post {
	
	// 제목, 사용자, 내용
	private String title;
	private String user;
	private String content;
	
	public Post(String title, String user, String content) {
		
		this.title = title;
		this.user = user;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	

}
