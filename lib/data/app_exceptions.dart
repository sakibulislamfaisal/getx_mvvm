class AppExceptions implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  //create constructor
  AppExceptions([this._message, this._prefix]);
  String toStringMessage() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'No Internet!');
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message, 'Request Timeout!');
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super(message, 'Internal Server Error!');
}

class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? message]) : super(message, 'Invalid Url !');
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super(message, 'Error While Communication!');
}