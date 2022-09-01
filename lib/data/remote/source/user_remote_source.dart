import 'package:examplebasepj/core/api/api_result.dart';
import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/data/remote/client/user_api_client.dart';
import 'package:examplebasepj/data/remote/model/user_remote.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<ApiResult<List<UserRemote>>> getListUser();
}


@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource{

  UserApiClient _client;

  UserRemoteDataSourceImpl(this._client);

  @override
  Future<ApiResult<List<UserRemote>>> getListUser() async {
    try{
      final response = await _client.fetch();
      return ApiResult.success(data: response);
    }catch(e){
      return ApiResult.failure(networkException: NetworkException.getException(e));
    }
  }

}