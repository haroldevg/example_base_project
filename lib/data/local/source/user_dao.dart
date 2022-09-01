import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'user_dao.g.dart';

@injectable
@DriftAccessor(tables: [User,Company,Address,Geo])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {

  final AppDatabase _database;

  UserDao(this._database) : super(_database);

  Future<List<UserData>> getUsers(String search){
    if(search.isNotEmpty){
      return (select(user)..where((tbl) => tbl.name.contains(search))).get();
    }
    return select(user).get();
  }

  Future<bool> hasData() => select(user).get().then((value) => value.isNotEmpty);

  Future insertUser(UserData userLocal) => into(user).insert(userLocal);

}