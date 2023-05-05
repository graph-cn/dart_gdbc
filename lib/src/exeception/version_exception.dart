part of dart_gdbc;

class VersionException extends GdbcException {
  VersionException({String? message, Error? cause})
      : super(message: message, cause: cause);
}
