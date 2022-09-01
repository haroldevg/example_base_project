import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException {

  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.requestTimeout() = RequestTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.receiveTimeout() = ReceiveTimeout;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.notFound() = NotFound;

  const factory NetworkException.internalServerError() = InternalServerError;

  const factory NetworkException.unexpectedError() = UnexpectedError;

  const factory NetworkException.formatException() = FormatException;

  const factory NetworkException.unableToProcess() = UnableToProcess;

  const factory NetworkException.defaultError(String messageError) =
      DefaultError;

  static NetworkException getException(error) {
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.connectTimeout:
              return const NetworkException.requestTimeout();
            case DioErrorType.sendTimeout:
              return const NetworkException.sendTimeout();
            case DioErrorType.receiveTimeout:
              return const NetworkException.receiveTimeout();
            case DioErrorType.response:
              if (error.response != null) {
                switch (error.response!.statusCode) {
                  case 404:
                    return const NetworkException.notFound();
                  case 408:
                    return const NetworkException.requestTimeout();
                  case 500:
                    return const NetworkException.internalServerError();
                  default:
                    var responseCode = error.response!.statusCode;
                    return NetworkException.defaultError(
                        'Invalid status: $responseCode');
                }
              }
              return const NetworkException.defaultError('no error');
            case DioErrorType.cancel:
              return const NetworkException.requestCancelled();
            case DioErrorType.other:
              if(error.error is SocketException){
                return const NetworkException.noInternetConnection();
              }
              return const NetworkException.defaultError('no error');
          }
        } else if (error is SocketException) {
          return const NetworkException.noInternetConnection();
        } else {
          return const NetworkException.unexpectedError();
        }
      } on FormatException catch (e) {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkException.unableToProcess();
      } else {
        return const NetworkException.unexpectedError();
      }
    }
  }

  static String aa() {
    return getErrorMessage(NetworkException.sendTimeout());
  }

  static String getErrorMessage(NetworkException exception) {
   return exception.when(
        requestCancelled: (){
          return 'Request Cancelled';
        },
        badRequest: (){
          return 'Bad Request';
        },
        requestTimeout: (){
          return 'Request Timeout';
        },
        sendTimeout: (){
          return 'Send Timeout';
        },
        receiveTimeout: (){
          return 'Receive Timeout';
        },
        noInternetConnection: (){
          return 'No Internet Connection';
        },
        notFound: (){
          return 'Not Found';
        },
        internalServerError: (){
          return 'Internal Server Error';
        },
        unexpectedError: (){
          return 'Unexpected Error';
        },
        formatException: (){
          return 'Format Exception';
        },
        unableToProcess: (){
          return 'Unable to Process';
        },
        defaultError: (message){
          return message;
        });
  }
}
