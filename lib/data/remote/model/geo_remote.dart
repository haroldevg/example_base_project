import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_remote.g.dart';

@JsonSerializable()
class GeoRemote extends Equatable {

  final String lat;
  final String lng;

  const GeoRemote({required this.lat,required this.lng});

  @override
  List<Object?> get props => [lat,lng];

  factory GeoRemote.fromJson(Map<String, dynamic> json) => _$GeoRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$GeoRemoteToJson(this);


}