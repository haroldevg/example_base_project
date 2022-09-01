import 'package:examplebasepj/data/remote/model/post_remote.dart';
import 'package:examplebasepj/data/remote/model/user_remote.dart';
import 'package:examplebasepj/globals/api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'post_api_client.g.dart';


@singleton
@RestApi()
abstract class PostApiClient {

  @factoryMethod
  factory PostApiClient(Dio dio,{@Named('baseUrl') String? baseUrl}) = _PostApiClient;

  @GET('/posts?userId={userId}')
  Future<List<PostRemote>> fetch(@Path() int userId);

}