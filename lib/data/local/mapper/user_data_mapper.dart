import 'package:examplebasepj/data/local/database/app_database.dart';
import 'package:examplebasepj/domain/entities/company_entity.dart';
import 'package:examplebasepj/domain/entities/entities.dart';

extension UserDataMapper on UserData {

  UserEntity toEntity() => UserEntity(phone: phone,website: website, id: id, name: name, username: username, email: email);

}

extension CompanyDataMapper on CompanyData {

  CompanyEntity toEntity() => CompanyEntity(name: name, catchPhrase: catchPhrase, bs: bs);

}

extension GeoDataMapper on GeoData {

  GeoEntity toEntity() => GeoEntity(lat: lat, lng: lng);

}


extension AddressDataMapper on Addres {

  AddressEntity toEntity() => AddressEntity(street: street, suite: suite, city: city, zipCode: zipCode);

}