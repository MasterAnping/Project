package com.zap.exception;

public class SameUsernameException extends RuntimeException{

	public SameUsernameException() {
		super();
	}

	public SameUsernameException(String message) {
		super(message);
	}
	
	

}
