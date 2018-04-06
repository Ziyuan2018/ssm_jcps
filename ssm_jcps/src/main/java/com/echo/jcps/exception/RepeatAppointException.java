package com.echo.jcps.exception;

/**
 * 重复预约异常
 */
@SuppressWarnings("serial")
public class RepeatAppointException extends RuntimeException {

	public RepeatAppointException(String message) {
        super(message);
    }

    public RepeatAppointException(String message, Throwable cause) {
        super(message, cause);
    }
}
