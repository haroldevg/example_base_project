import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/data/local/mapper/user_data_mapper.dart';
import 'package:examplebasepj/data/local/source/user_dao.dart';
import 'package:examplebasepj/data/remote/mapper/user_remote_mapper.dart';
import 'package:examplebasepj/data/remote/model/user_remote.dart';
import 'package:examplebasepj/data/remote/source/user_remote_source.dart';
import 'package:examplebasepj/domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

abstract class UserRepository {

  Future<List<UserEntity>> fetchUsers({String search = ''});

}

@Injectable(as: UserRepository)
class UserRepositoryImpl extends UserRepository {

  final UserDao _userLocal;
  final UserRemoteDataSource _userRemote;

  UserRepositoryImpl(this._userLocal,this._userRemote);

  @override
  Future<List<UserEntity>> fetchUsers({String search = ''}) async {

    final hasDataInLocal = await _userLocal.hasData();

    if(!hasDataInLocal){

      final userApiResult = await _userRemote.getListUser();

      await userApiResult.when(success: (List<UserRemote> data) async{

        final userListEntity = data.map((e) => e.toEntity()).toList();
        final userListLocal = data.map((e) => e.toData()).toList();

        await Future.forEach(userListLocal, (UserData element) async {
          await _userLocal.insertUser(element);
        });

        return userListEntity.where((element) => element.name.contains(search));

      }, failure: (NetworkException networkException){
        throw networkException;
      });
    }

    final userListLocal = await _userLocal.getUsers(search);

    return userListLocal.map((e) => e.toEntity()).toList();
  }

}