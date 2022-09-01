import 'package:examplebasepj/core/api/api_result.dart';
import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/data/remote/client/post_api_client.dart';
import 'package:examplebasepj/data/remote/model/post_remote.dart';
import 'package:injectable/injectable.dart';

abstract class PostRemoteDataSource {
  Future<ApiResult<List<PostRemote>>> getListPostByUser(int userId);
}

@Injectable(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource{

  PostApiClient _client;

  PostRemoteDataSourceImpl(this._client);

  @override
  Future<ApiResult<List<PostRemote>>> getListPostByUser(int userId) async {
    try{
      final response = await _client.fetch(userId);
      return ApiResult.success(data: response);
    }catch(e){
      return ApiResult.failure(networkException: NetworkException.getException(e));
    }
  }

}