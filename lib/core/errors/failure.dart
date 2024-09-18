import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errorMessage: " connection time out with api server");

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: " send time out with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: " receive time out with api server");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: " badCertificate with api server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException: e);
      case DioExceptionType.cancel:
        return ServerFailure(
            errorMessage: "request to Api server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "No internet connection");
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: " Opps!! There was an error ,please try again");
    }
  }

  factory ServerFailure.fromResponse({required DioException dioException}) {
    int statusCode = dioException.response!.statusCode!;
    dynamic response = dioException.response!.data;

    if (statusCode == 404) {
      return ServerFailure(
          errorMessage: "Your request was not found, please try later");
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: "There is a problem with server, please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response["error"]["message"]);
    }
    else{
            return ServerFailure(
          errorMessage: "There was an error , please try again");
    }
  }
}

// class CacheFailure extends Failure {}

// class NetWorkFailure extends Failure {}
