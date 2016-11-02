package org.xdemo.example.websocket.exception;

@SuppressWarnings("serial")
public class LogicException extends RuntimeException {
	
	private Integer errorCode=-99; // 默认值

	public Integer getErrorCode() {
		return errorCode;
	}
	
	public LogicException() {
		super();
	}

	public LogicException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public LogicException(String message, Throwable cause) {
		super(message, cause);
	}

	public LogicException(String message) {
		super(message);
	}
	
	public LogicException(String message,Integer errorCode) {
		super(message);
		this.errorCode = errorCode;
	}

	public LogicException(Throwable cause) {
		super(cause);
	}
}
