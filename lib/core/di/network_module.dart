import 'dart:convert';

import 'package:examplebasepj/globals/api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  Dio dio (Interceptor interceptor){
    var dio = Dio(BaseOptions(
      connectTimeout: 3000,
      receiveTimeout: 3000,
    ));
    dio.interceptors.add(interceptor);
    return dio;
  }

  @lazySingleton
  Interceptor interceptor (Logger logger){
    return InterceptorsWrapper(
        onRequest: (options,handler){
          var headers = const JsonEncoder.withIndent('\n').convert(options.headers);
          var params = const JsonEncoder.withIndent('\n').convert(options.queryParameters);
          var body = const JsonEncoder.withIndent('\n').convert(options.data);
          logger.i(
              'REQUEST: ${options.method.toUpperCase() + options.baseUrl + options.path} \n'+
              (headers.isNotEmpty && headers != '{}' ? 'HEADERS: \n'+ headers  : '') +
              (params.isNotEmpty && params != '{}' ? 'PARAMS: \n'+ params  : '') +
              (body.isNotEmpty && body != '{}' ? 'BODY: \n'+ body  : '')
          );
          return handler.next(options);
        }
    );
  }

  @Named('baseUrl')
  String get baseUrl => Api.baseUrl;

}
