//用户表类
package com.sh.model;

public class UserBean {

	public static int Id = 0;
	private int userId=35;
    private String username;
    private String password;
    
    public UserBean (String username,String password) {
    	this.username = username;
    	this.password = password;
    	this.userId = ++Id;   	
    }
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
