part of dart_gdbc;

class ConnectException extends GdbcException {
  ConnectException({String? message, Error? cause})
      : super(message: message, cause: cause);
}
