class AppExceptions implements Exception {
  final _prefix;
  final _message;

  AppExceptions(this._message, this._prefix);

  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorizzed Request');
}

class InvalidInpputException extends AppExceptions {
  InvalidInpputException([String? message]) : super(message, 'Invalid Input');
}
