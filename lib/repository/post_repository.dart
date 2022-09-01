import 'package:examplebasepj/core/api/network_exception.dart';
import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/data/local/mapper/post_data_mapper.dart';
import 'package:examplebasepj/data/local/source/post_dao.dart';
import 'package:examplebasepj/data/remote/mapper/post_remote_mapper.dart';
import 'package:examplebasepj/data/remote/source/post_remote_source.dart';
import 'package:examplebasepj/domain/entities/post_entity.dart';
import 'package:injectable/injectable.dart';

abstract class PostRepository {

  Future<List<PostEntity>> fetchPost({required int userId});

}

@Injectable(as: PostRepository)
class PostRepositoryImpl  extends PostRepository {

  final PostDao _postLocal;
  final PostRemoteDataSource _postRemote;

  PostRepositoryImpl(this._postLocal,this._postRemote);

  @override
  Future<List<PostEntity>> fetchPost({required int userId}) async {

    final hasDataInLocal = await _postLocal.hasDataByUser(userId);

    if(!hasDataInLocal){

      final postApiResult = await _postRemote.getListPostByUser(userId);

      return await postApiResult.when(success: (data) async {

        final postListEntity = data.map((e) => e.toEntity()).toList();
        final postListLocal = data.map((e) => e.toData()).toList();

        await Future.forEach(postListLocal, (PostData element) async {
          await _postLocal.insertPost(element);
        });

        return postListEntity;

      }, failure: (NetworkException networkException){
        throw networkException;
      });

    }


    final postListLocal = await _postLocal.getPostsByUser(userId);
    return postListLocal.map((e) => e.toEntity()).toList();

  }

}