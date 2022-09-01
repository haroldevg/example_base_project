import 'package:examplebasepj/domain/entities/post_entity.dart';
import 'package:examplebasepj/domain/entities/user_entity.dart';
import 'package:examplebasepj/repository/post_repository.dart';
import 'package:examplebasepj/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostListUseCase {

  final PostRepository _repository;

  PostListUseCase(this._repository);

  Future<List<PostEntity>> getPosts(int userId) => _repository.fetchPost(userId: userId);

}