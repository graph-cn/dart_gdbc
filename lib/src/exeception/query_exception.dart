part of dart_gdbc;

class GdbcQueryException extends GdbcException {
  GdbcQueryException({String? message, Error? cause})
      : super(message: message, cause: cause);
}
