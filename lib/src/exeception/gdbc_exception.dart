part of dart_gdbc;

class GdbcException implements Error {
  final String? message;

  final Error? cause;

  GdbcException({this.message, this.cause});

  @override
  StackTrace? get stackTrace => cause?.stackTrace;

  @override
  String toString() {
    var buffer = StringBuffer();
    buffer.write('GdbcException');
    if (message != null) {
      buffer.write(': $message');
    }
    if (cause != null) {
      buffer.write('\nCause: $cause');
    }
    return buffer.toString();
  }
}
