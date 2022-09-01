import 'address_remote.dart';
import 'company_remote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRemote {

  final int id;
  final String name;
  final String username;
  final String email;
  final AddressRemote address;
  final String phone;
  final String website;
  final CompanyRemote company;

  const UserRemote(this.phone, this.website, this.company,
      {required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address});

  @override
  List<Object?> get props => [id,name,username,email,address,phone,website,company];

  factory UserRemote.fromJson(Map<String, dynamic> json) => _$UserRemoteFromJson(json);

  Map<String, dynamic> toJson() => _$UserRemoteToJson(this);

}