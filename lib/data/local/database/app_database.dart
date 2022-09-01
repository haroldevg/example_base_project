import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'examplebasepj.sqlite'));
    return NativeDatabase(file);
  });
}

class Address extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get street => text()();
  TextColumn get suite => text()();
  TextColumn get city => text()();
  TextColumn get zipCode => text()();
  IntColumn get geo => integer().nullable().references(Geo, #id)();

}

class Company extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get catchPhrase => text()();
  TextColumn get bs => text()();

}

class Geo extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get lat => text()();
  TextColumn get lng => text()();

}

class User extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get username => text()();
  TextColumn get email => text()();
  IntColumn get address => integer().nullable().references(Address, #id)();
  TextColumn get phone => text()();
  TextColumn get website => text()();
  IntColumn get company => integer().nullable().references(Company, #id)();

  @override
  Set<Column> get primaryKey => {id};

}

class Post extends Table {

  IntColumn get id => integer()();
  IntColumn get userId => integer().nullable().references(User, #id)();
  TextColumn get title => text()();
  TextColumn get body => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@singleton
@DriftDatabase(tables: [User,Company,Address,Geo,Post])
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

  int get schemaVersion => 1;

}