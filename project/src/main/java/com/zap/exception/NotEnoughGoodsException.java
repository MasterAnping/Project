package com.zap.exception;

public class NotEnoughGoodsException extends RuntimeException{
	
	public NotEnoughGoodsException(){
		super();
		
	}

	public NotEnoughGoodsException(String message) {
		super(message);
	}
	
	

}
