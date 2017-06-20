package com.qiuzhi.entity;

public class BaseResult {
	private int status;
	private String message;
	
	public BaseResult(){
		
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "BaseResult [status=" + status + ", message=" + message + "]";
	}

}
