package org.xdemo.example.websocket.exception;
public class TokenExecption extends RuntimeException {

	public TokenExecption() {
		super();
	}

	public TokenExecption(String message, Throwable cause) {
		super(message, cause);
	}

	public TokenExecption(String message) {
		super(message);
	}

	public TokenExecption(Throwable cause) {
		super(cause);
	}

}
