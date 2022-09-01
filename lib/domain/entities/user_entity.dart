import 'package:examplebasepj/domain/entities/address_entity.dart';
import 'package:examplebasepj/domain/entities/company_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressEntity? address;
  final String phone;
  final String website;
  final CompanyEntity? company;

  const UserEntity(
      {required this.phone,required this.website,this.company,
        required this.id,
      required this.name,
      required this.username,
      required this.email,
      this.address});

  @override
  List<Object?> get props => [id,name,username,email,address];

}
