package com.kota.stratagem.ejbserviceclient.exception;

public class ServiceException extends Exception {

	private static final long serialVersionUID = 6791823269155412515L;

	public ServiceException(String message) {
		super(message);
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
	}

}