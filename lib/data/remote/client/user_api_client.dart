import 'package:examplebasepj/data/remote/model/user_remote.dart';
import 'package:examplebasepj/globals/api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'user_api_client.g.dart';


@singleton
@RestApi()
abstract class UserApiClient {

  @factoryMethod
  factory UserApiClient(Dio dio,{@Named('baseUrl') String? baseUrl}) = _UserApiClient;

  @GET('/users')
  Future<List<UserRemote>> fetch();

}