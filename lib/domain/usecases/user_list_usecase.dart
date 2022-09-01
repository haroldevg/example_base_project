import 'package:examplebasepj/domain/entities/user_entity.dart';
import 'package:examplebasepj/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserListUserCase {

  final UserRepository _repository;

  UserListUserCase(this._repository);

  Future<List<UserEntity>> getUsers(String search) => _repository.fetchUsers(search: search);

}