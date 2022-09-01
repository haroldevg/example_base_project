import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_remote.g.dart';

@JsonSerializable()
class PostRemote extends Equatable {

  final int userId;
  final int id;
  final String title;
  final String body;

  const PostRemote({required this.userId,required this.id,required this.title,required this.body});

  @override
  List<Object?> get props => [userId,id,title,body];

  factory PostRemote.fromJson(Map<String, dynamic> json) => _$PostRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$PostRemoteToJson(this);


}