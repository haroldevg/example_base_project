// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRemote _$CompanyRemoteFromJson(Map<String, dynamic> json) =>
    CompanyRemote(
      name: json['name'] as String,
      catchPhrase: json['catchPhrase'] as String,
      bs: json['bs'] as String,
    );

Map<String, dynamic> _$CompanyRemoteToJson(CompanyRemote instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
