import 'package:examplebasepj/domain/entities/geo_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'geo_remote.dart';

part 'address_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressRemote extends Equatable {

  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoRemote geo;

  const AddressRemote(
      {required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo});

  @override
  List<Object?> get props => [street,suite,city,zipcode,geo];

  factory AddressRemote.fromJson(Map<String, dynamic> json) => _$AddressRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRemoteToJson(this);

}
