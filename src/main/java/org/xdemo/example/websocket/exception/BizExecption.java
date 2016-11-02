package org.xdemo.example.websocket.exception;
@SuppressWarnings("serial")
public class BizExecption extends RuntimeException {

	public BizExecption() {
		super();
	}

	public BizExecption(String message, Throwable cause) {
		super(message, cause);
	}

	public BizExecption(String message) {
		super(message);
	}

	public BizExecption(Throwable cause) {
		super(cause);
	}

}
