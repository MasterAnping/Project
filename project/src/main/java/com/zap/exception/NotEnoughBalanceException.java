package com.zap.exception;

public class NotEnoughBalanceException extends RuntimeException{

	public NotEnoughBalanceException() {
		super();
	}

	public NotEnoughBalanceException(String message) {
		super(message);
	}
	

}
