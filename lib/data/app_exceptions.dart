class AppExceptions implements Exception {
  String? prefix;
  String? messsage;
  AppExceptions([this.messsage, this.prefix]);

  @override
  String toString() {
    return '$prefix$messsage';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'FetchDataException: ');
}

class BadNetworkException extends AppExceptions {
  BadNetworkException([String? message]) : super(message, 'BadNetworkException: ');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'InvalidInputException: ');
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException([String? message]) : super(message, 'UnAuthorisedException: ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'BadRequestException: ');
}

class NotFoundException extends AppExceptions {
  NotFoundException([String? message]) : super(message, 'NotFoundException: ');
}

class InternalServerException extends AppExceptions {
  InternalServerException([String? message]) : super(message, 'InternalServerException: ');
}

class LocationNotEnabledException extends AppExceptions {
  LocationNotEnabledException([String? message]) : super(message, 'LocationNotEnabledException: ');
}

class IOException extends AppExceptions {
  IOException([String? message]) : super(message, 'No Internet : ');
}
