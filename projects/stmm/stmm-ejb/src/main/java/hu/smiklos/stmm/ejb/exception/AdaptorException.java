package hu.smiklos.stmm.ejb.exception;


import hu.smiklos.stmm.ejb.domain.ErrorStub;
import hu.smiklos.stmm.ejb.util.ApplicationError;

public class AdaptorException extends Exception {

	private static final long serialVersionUID = 8830269357818978996L;

	private final ApplicationError error;
	private final String field;

	public AdaptorException(ApplicationError error, String message) {
		this(error, message, null);
	}

	public AdaptorException(ApplicationError error, String message, String field) {
		this(error, message, null, field);
	}

	public AdaptorException(ApplicationError error, String message, Throwable cause, String field) {
		super(message, cause);
		this.error = error;
		this.field = field;
	}

	public ApplicationError getErrorCode() {
		return this.error;
	}

	public ErrorStub build() {
		return this.error.build(this.field);
	}

}
