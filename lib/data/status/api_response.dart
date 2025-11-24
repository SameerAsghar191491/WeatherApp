import 'package:weatherapp_starter_project/data/status/status.dart';

class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status \n Data: $data \n Message: $message';
  }
}
