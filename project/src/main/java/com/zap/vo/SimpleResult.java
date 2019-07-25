package com.zap.vo;

public class SimpleResult {
	
	private Boolean isSuccess;
	private String message;
	
	public SimpleResult(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public SimpleResult(Boolean isSuccess, String message) {
		this.isSuccess = isSuccess;
		this.message = message;
	}

	public Boolean getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(Boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "SimpleResult [isSuccess=" + isSuccess + ", message=" + message
				+ "]";
	}
	
	
	

}
