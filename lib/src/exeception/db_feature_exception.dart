part of dart_gdbc;

/// A [GdbcException] thrown when a feature is not supported by the database.
class DbFeatureException extends GdbcException {
  /// Creates a [DbFeatureException] with the given [message] and [cause].
  DbFeatureException(String message, {Error? cause})
      : super(message: message, cause: cause);
}
