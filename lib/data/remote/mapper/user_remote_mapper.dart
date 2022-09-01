import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/data/remote/model/address_remote.dart';
import 'package:examplebasepj/data/remote/model/company_remote.dart';
import 'package:examplebasepj/data/remote/model/geo_remote.dart';
import 'package:examplebasepj/data/remote/model/user_remote.dart';
import 'package:examplebasepj/domain/entities/company_entity.dart';
import 'package:examplebasepj/domain/entities/entities.dart';

extension UserRemoteMapper on UserRemote {
  UserEntity toEntity() => UserEntity(phone: phone,website: website,company: company.toEntity(),
      id: id, name: name, username: username, email: email, address: address.toEntity());

  UserData toData() => UserData(id: id, name: name, username: username,
      email: email, phone: phone, website: website);

}

extension AddressRemoteMapper on AddressRemote {

  AddressEntity toEntity() => AddressEntity(street: street, suite: suite, city: city, zipCode: zipcode, geo: geo.toEntity());

}

extension GeoRemoteMapper on GeoRemote {

  GeoEntity toEntity() => GeoEntity(lat: lat, lng: lng);

}

extension CompanyRemoteMapper on CompanyRemote{

  CompanyEntity toEntity() => CompanyEntity(name: name, catchPhrase: catchPhrase, bs: bs);

}