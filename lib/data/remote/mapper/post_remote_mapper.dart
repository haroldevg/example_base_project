import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/data/remote/model/post_remote.dart';
import 'package:examplebasepj/domain/entities/post_entity.dart';

extension PostRemoteMapper on PostRemote {

  PostEntity toEntity() => PostEntity(id: id, title: title, body: body,userId: userId);

  PostData toData() => PostData(id: id, title: title, body: body,userId: userId);

}