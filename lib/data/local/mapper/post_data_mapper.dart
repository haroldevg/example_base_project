import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/domain/entities/post_entity.dart';

extension PostDataMapper on PostData {

  PostEntity toEntity() => PostEntity(userId: userId, id: id, title: title, body: body);

}