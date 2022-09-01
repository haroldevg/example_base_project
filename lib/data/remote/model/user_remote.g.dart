// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRemote _$UserRemoteFromJson(Map<String, dynamic> json) => UserRemote(
      json['phone'] as String,
      json['website'] as String,
      CompanyRemote.fromJson(json['company'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      address: AddressRemote.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRemoteToJson(UserRemote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address.toJson(),
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company.toJson(),
    };
