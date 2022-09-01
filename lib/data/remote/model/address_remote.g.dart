// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressRemote _$AddressRemoteFromJson(Map<String, dynamic> json) =>
    AddressRemote(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: GeoRemote.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressRemoteToJson(AddressRemote instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo.toJson(),
    };
