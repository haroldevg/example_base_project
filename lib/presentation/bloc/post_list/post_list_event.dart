import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_event.freezed.dart';

@freezed
class PostListEvent with _$PostListEvent {

  const factory PostListEvent.loadPost(int userId) = LoadPosts;

}