import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_remote.g.dart';

@JsonSerializable()
class CompanyRemote extends Equatable {

  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyRemote(
      {required this.name, required this.catchPhrase, required this.bs});

  @override
  List<Object?> get props => [name, catchPhrase, bs];

  factory CompanyRemote.fromJson(Map<String, dynamic> json) => _$CompanyRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRemoteToJson(this);

}
