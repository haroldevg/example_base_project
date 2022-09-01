import 'package:examplebasepj/domain/entities/geo_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AddressEntity extends Equatable {

  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final GeoEntity? geo;

  const AddressEntity(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipCode,
      this.geo});

  @override
  List<Object?> get props => [street,suite,city,zipCode,geo];

}
