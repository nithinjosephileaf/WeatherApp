class AppException implements Exception {
  final String? message;
  final String? _prefix;
  final int? code;

  AppException([this.message, this._prefix, this.code]);

  @override
  String toString() {
    return "$_prefix $message";
    // return "$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, int? code]) : super(message, "", code);
}

class BadRequestException extends AppException {
  BadRequestException([message, code])
      : super(message, "Invalid Request. ", code);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised. ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input. ");
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, "Not Found. ");
}

class InternalServerException extends AppException {
  InternalServerException([String? message])
      : super(message, "Internal Server Error. ");
}
