package com.echo.jcps.exception;

/**
 * 预约业务异常
 */
@SuppressWarnings("serial")
public class AppointException extends RuntimeException {

	public AppointException(String message) {
        super(message);
    }

    public AppointException(String message, Throwable cause) {
        super(message, cause);
    }
}
