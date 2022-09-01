// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class GeoData extends DataClass implements Insertable<GeoData> {
  final int id;
  final String lat;
  final String lng;
  GeoData({required this.id, required this.lat, required this.lng});
  factory GeoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GeoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      lat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      lng: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lng'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<String>(lat);
    map['lng'] = Variable<String>(lng);
    return map;
  }

  GeoCompanion toCompanion(bool nullToAbsent) {
    return GeoCompanion(
      id: Value(id),
      lat: Value(lat),
      lng: Value(lng),
    );
  }

  factory GeoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeoData(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<String>(json['lat']),
      lng: serializer.fromJson<String>(json['lng']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<String>(lat),
      'lng': serializer.toJson<String>(lng),
    };
  }

  GeoData copyWith({int? id, String? lat, String? lng}) => GeoData(
        id: id ?? this.id,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );
  @override
  String toString() {
    return (StringBuffer('GeoData(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lat, lng);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeoData &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.lng == this.lng);
}

class GeoCompanion extends UpdateCompanion<GeoData> {
  final Value<int> id;
  final Value<String> lat;
  final Value<String> lng;
  const GeoCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
  });
  GeoCompanion.insert({
    this.id = const Value.absent(),
    required String lat,
    required String lng,
  })  : lat = Value(lat),
        lng = Value(lng);
  static Insertable<GeoData> custom({
    Expression<int>? id,
    Expression<String>? lat,
    Expression<String>? lng,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
    });
  }

  GeoCompanion copyWith(
      {Value<int>? id, Value<String>? lat, Value<String>? lng}) {
    return GeoCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<String>(lng.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeoCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng')
          ..write(')'))
        .toString();
  }
}

class $GeoTable extends Geo with TableInfo<$GeoTable, GeoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String?> lat = GeneratedColumn<String?>(
      'lat', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<String?> lng = GeneratedColumn<String?>(
      'lng', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, lat, lng];
  @override
  String get aliasedName => _alias ?? 'geo';
  @override
  String get actualTableName => 'geo';
  @override
  VerificationContext validateIntegrity(Insertable<GeoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
          _lngMeta, lng.isAcceptableOrUnknown(data['lng']!, _lngMeta));
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GeoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GeoTable createAlias(String alias) {
    return $GeoTable(attachedDatabase, alias);
  }
}

class Addres extends DataClass implements Insertable<Addres> {
  final int id;
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final int? geo;
  Addres(
      {required this.id,
      required this.street,
      required this.suite,
      required this.city,
      required this.zipCode,
      this.geo});
  factory Addres.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Addres(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      street: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}street'])!,
      suite: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}suite'])!,
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city'])!,
      zipCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}zip_code'])!,
      geo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}geo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['street'] = Variable<String>(street);
    map['suite'] = Variable<String>(suite);
    map['city'] = Variable<String>(city);
    map['zip_code'] = Variable<String>(zipCode);
    if (!nullToAbsent || geo != null) {
      map['geo'] = Variable<int?>(geo);
    }
    return map;
  }

  AddressCompanion toCompanion(bool nullToAbsent) {
    return AddressCompanion(
      id: Value(id),
      street: Value(street),
      suite: Value(suite),
      city: Value(city),
      zipCode: Value(zipCode),
      geo: geo == null && nullToAbsent ? const Value.absent() : Value(geo),
    );
  }

  factory Addres.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Addres(
      id: serializer.fromJson<int>(json['id']),
      street: serializer.fromJson<String>(json['street']),
      suite: serializer.fromJson<String>(json['suite']),
      city: serializer.fromJson<String>(json['city']),
      zipCode: serializer.fromJson<String>(json['zipCode']),
      geo: serializer.fromJson<int?>(json['geo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'street': serializer.toJson<String>(street),
      'suite': serializer.toJson<String>(suite),
      'city': serializer.toJson<String>(city),
      'zipCode': serializer.toJson<String>(zipCode),
      'geo': serializer.toJson<int?>(geo),
    };
  }

  Addres copyWith(
          {int? id,
          String? street,
          String? suite,
          String? city,
          String? zipCode,
          int? geo}) =>
      Addres(
        id: id ?? this.id,
        street: street ?? this.street,
        suite: suite ?? this.suite,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        geo: geo ?? this.geo,
      );
  @override
  String toString() {
    return (StringBuffer('Addres(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('geo: $geo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, street, suite, city, zipCode, geo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Addres &&
          other.id == this.id &&
          other.street == this.street &&
          other.suite == this.suite &&
          other.city == this.city &&
          other.zipCode == this.zipCode &&
          other.geo == this.geo);
}

class AddressCompanion extends UpdateCompanion<Addres> {
  final Value<int> id;
  final Value<String> street;
  final Value<String> suite;
  final Value<String> city;
  final Value<String> zipCode;
  final Value<int?> geo;
  const AddressCompanion({
    this.id = const Value.absent(),
    this.street = const Value.absent(),
    this.suite = const Value.absent(),
    this.city = const Value.absent(),
    this.zipCode = const Value.absent(),
    this.geo = const Value.absent(),
  });
  AddressCompanion.insert({
    this.id = const Value.absent(),
    required String street,
    required String suite,
    required String city,
    required String zipCode,
    this.geo = const Value.absent(),
  })  : street = Value(street),
        suite = Value(suite),
        city = Value(city),
        zipCode = Value(zipCode);
  static Insertable<Addres> custom({
    Expression<int>? id,
    Expression<String>? street,
    Expression<String>? suite,
    Expression<String>? city,
    Expression<String>? zipCode,
    Expression<int?>? geo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (street != null) 'street': street,
      if (suite != null) 'suite': suite,
      if (city != null) 'city': city,
      if (zipCode != null) 'zip_code': zipCode,
      if (geo != null) 'geo': geo,
    });
  }

  AddressCompanion copyWith(
      {Value<int>? id,
      Value<String>? street,
      Value<String>? suite,
      Value<String>? city,
      Value<String>? zipCode,
      Value<int?>? geo}) {
    return AddressCompanion(
      id: id ?? this.id,
      street: street ?? this.street,
      suite: suite ?? this.suite,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      geo: geo ?? this.geo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (suite.present) {
      map['suite'] = Variable<String>(suite.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<String>(zipCode.value);
    }
    if (geo.present) {
      map['geo'] = Variable<int?>(geo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressCompanion(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('suite: $suite, ')
          ..write('city: $city, ')
          ..write('zipCode: $zipCode, ')
          ..write('geo: $geo')
          ..write(')'))
        .toString();
  }
}

class $AddressTable extends Address with TableInfo<$AddressTable, Addres> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String?> street = GeneratedColumn<String?>(
      'street', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _suiteMeta = const VerificationMeta('suite');
  @override
  late final GeneratedColumn<String?> suite = GeneratedColumn<String?>(
      'suite', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _zipCodeMeta = const VerificationMeta('zipCode');
  @override
  late final GeneratedColumn<String?> zipCode = GeneratedColumn<String?>(
      'zip_code', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _geoMeta = const VerificationMeta('geo');
  @override
  late final GeneratedColumn<int?> geo = GeneratedColumn<int?>(
      'geo', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES geo (id)');
  @override
  List<GeneratedColumn> get $columns => [id, street, suite, city, zipCode, geo];
  @override
  String get aliasedName => _alias ?? 'address';
  @override
  String get actualTableName => 'address';
  @override
  VerificationContext validateIntegrity(Insertable<Addres> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('suite')) {
      context.handle(
          _suiteMeta, suite.isAcceptableOrUnknown(data['suite']!, _suiteMeta));
    } else if (isInserting) {
      context.missing(_suiteMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('zip_code')) {
      context.handle(_zipCodeMeta,
          zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta));
    } else if (isInserting) {
      context.missing(_zipCodeMeta);
    }
    if (data.containsKey('geo')) {
      context.handle(
          _geoMeta, geo.isAcceptableOrUnknown(data['geo']!, _geoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Addres map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Addres.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AddressTable createAlias(String alias) {
    return $AddressTable(attachedDatabase, alias);
  }
}

class CompanyData extends DataClass implements Insertable<CompanyData> {
  final int id;
  final String name;
  final String catchPhrase;
  final String bs;
  CompanyData(
      {required this.id,
      required this.name,
      required this.catchPhrase,
      required this.bs});
  factory CompanyData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CompanyData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      catchPhrase: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}catch_phrase'])!,
      bs: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bs'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['catch_phrase'] = Variable<String>(catchPhrase);
    map['bs'] = Variable<String>(bs);
    return map;
  }

  CompanyCompanion toCompanion(bool nullToAbsent) {
    return CompanyCompanion(
      id: Value(id),
      name: Value(name),
      catchPhrase: Value(catchPhrase),
      bs: Value(bs),
    );
  }

  factory CompanyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      catchPhrase: serializer.fromJson<String>(json['catchPhrase']),
      bs: serializer.fromJson<String>(json['bs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'catchPhrase': serializer.toJson<String>(catchPhrase),
      'bs': serializer.toJson<String>(bs),
    };
  }

  CompanyData copyWith(
          {int? id, String? name, String? catchPhrase, String? bs}) =>
      CompanyData(
        id: id ?? this.id,
        name: name ?? this.name,
        catchPhrase: catchPhrase ?? this.catchPhrase,
        bs: bs ?? this.bs,
      );
  @override
  String toString() {
    return (StringBuffer('CompanyData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, catchPhrase, bs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyData &&
          other.id == this.id &&
          other.name == this.name &&
          other.catchPhrase == this.catchPhrase &&
          other.bs == this.bs);
}

class CompanyCompanion extends UpdateCompanion<CompanyData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> catchPhrase;
  final Value<String> bs;
  const CompanyCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.catchPhrase = const Value.absent(),
    this.bs = const Value.absent(),
  });
  CompanyCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String catchPhrase,
    required String bs,
  })  : name = Value(name),
        catchPhrase = Value(catchPhrase),
        bs = Value(bs);
  static Insertable<CompanyData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? catchPhrase,
    Expression<String>? bs,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (catchPhrase != null) 'catch_phrase': catchPhrase,
      if (bs != null) 'bs': bs,
    });
  }

  CompanyCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? catchPhrase,
      Value<String>? bs}) {
    return CompanyCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      catchPhrase: catchPhrase ?? this.catchPhrase,
      bs: bs ?? this.bs,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (catchPhrase.present) {
      map['catch_phrase'] = Variable<String>(catchPhrase.value);
    }
    if (bs.present) {
      map['bs'] = Variable<String>(bs.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('catchPhrase: $catchPhrase, ')
          ..write('bs: $bs')
          ..write(')'))
        .toString();
  }
}

class $CompanyTable extends Company with TableInfo<$CompanyTable, CompanyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _catchPhraseMeta =
      const VerificationMeta('catchPhrase');
  @override
  late final GeneratedColumn<String?> catchPhrase = GeneratedColumn<String?>(
      'catch_phrase', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bsMeta = const VerificationMeta('bs');
  @override
  late final GeneratedColumn<String?> bs = GeneratedColumn<String?>(
      'bs', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, catchPhrase, bs];
  @override
  String get aliasedName => _alias ?? 'company';
  @override
  String get actualTableName => 'company';
  @override
  VerificationContext validateIntegrity(Insertable<CompanyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('catch_phrase')) {
      context.handle(
          _catchPhraseMeta,
          catchPhrase.isAcceptableOrUnknown(
              data['catch_phrase']!, _catchPhraseMeta));
    } else if (isInserting) {
      context.missing(_catchPhraseMeta);
    }
    if (data.containsKey('bs')) {
      context.handle(_bsMeta, bs.isAcceptableOrUnknown(data['bs']!, _bsMeta));
    } else if (isInserting) {
      context.missing(_bsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CompanyData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CompanyTable createAlias(String alias) {
    return $CompanyTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String username;
  final String email;
  final int? address;
  final String phone;
  final String website;
  final int? company;
  UserData(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      this.address,
      required this.phone,
      required this.website,
      this.company});
  factory UserData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      address: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address']),
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      website: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}website'])!,
      company: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<int?>(address);
    }
    map['phone'] = Variable<String>(phone);
    map['website'] = Variable<String>(website);
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<int?>(company);
    }
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      email: Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone: Value(phone),
      website: Value(website),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      address: serializer.fromJson<int?>(json['address']),
      phone: serializer.fromJson<String>(json['phone']),
      website: serializer.fromJson<String>(json['website']),
      company: serializer.fromJson<int?>(json['company']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'address': serializer.toJson<int?>(address),
      'phone': serializer.toJson<String>(phone),
      'website': serializer.toJson<String>(website),
      'company': serializer.toJson<int?>(company),
    };
  }

  UserData copyWith(
          {int? id,
          String? name,
          String? username,
          String? email,
          int? address,
          String? phone,
          String? website,
          int? company}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        website: website ?? this.website,
        company: company ?? this.company,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('company: $company')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, username, email, address, phone, website, company);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.email == this.email &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.website == this.website &&
          other.company == this.company);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> email;
  final Value<int?> address;
  final Value<String> phone;
  final Value<String> website;
  final Value<int?> company;
  const UserCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.company = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String username,
    required String email,
    this.address = const Value.absent(),
    required String phone,
    required String website,
    this.company = const Value.absent(),
  })  : name = Value(name),
        username = Value(username),
        email = Value(email),
        phone = Value(phone),
        website = Value(website);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? email,
    Expression<int?>? address,
    Expression<String>? phone,
    Expression<String>? website,
    Expression<int?>? company,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (website != null) 'website': website,
      if (company != null) 'company': company,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? username,
      Value<String>? email,
      Value<int?>? address,
      Value<String>? phone,
      Value<String>? website,
      Value<int?>? company}) {
    return UserCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<int?>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (company.present) {
      map['company'] = Variable<int?>(company.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('company: $company')
          ..write(')'))
        .toString();
  }
}

class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<int?> address = GeneratedColumn<int?>(
      'address', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES address (id)');
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _websiteMeta = const VerificationMeta('website');
  @override
  late final GeneratedColumn<String?> website = GeneratedColumn<String?>(
      'website', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _companyMeta = const VerificationMeta('company');
  @override
  late final GeneratedColumn<int?> company = GeneratedColumn<int?>(
      'company', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES company (id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, username, email, address, phone, website, company];
  @override
  String get aliasedName => _alias ?? 'user';
  @override
  String get actualTableName => 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    } else if (isInserting) {
      context.missing(_websiteMeta);
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class PostData extends DataClass implements Insertable<PostData> {
  final int id;
  final int? userId;
  final String title;
  final String body;
  PostData(
      {required this.id, this.userId, required this.title, required this.body});
  factory PostData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PostData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int?>(userId);
    }
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    return map;
  }

  PostCompanion toCompanion(bool nullToAbsent) {
    return PostCompanion(
      id: Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      title: Value(title),
      body: Value(body),
    );
  }

  factory PostData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
    };
  }

  PostData copyWith({int? id, int? userId, String? title, String? body}) =>
      PostData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        body: body ?? this.body,
      );
  @override
  String toString() {
    return (StringBuffer('PostData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.body == this.body);
}

class PostCompanion extends UpdateCompanion<PostData> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String> title;
  final Value<String> body;
  const PostCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
  });
  PostCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String title,
    required String body,
  })  : title = Value(title),
        body = Value(body);
  static Insertable<PostData> custom({
    Expression<int>? id,
    Expression<int?>? userId,
    Expression<String>? title,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
    });
  }

  PostCompanion copyWith(
      {Value<int>? id,
      Value<int?>? userId,
      Value<String>? title,
      Value<String>? body}) {
    return PostCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int?>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $PostTable extends Post with TableInfo<$PostTable, PostData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES user (id)');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, body];
  @override
  String get aliasedName => _alias ?? 'post';
  @override
  String get actualTableName => 'post';
  @override
  VerificationContext validateIntegrity(Insertable<PostData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PostData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostTable createAlias(String alias) {
    return $PostTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GeoTable geo = $GeoTable(this);
  late final $AddressTable address = $AddressTable(this);
  late final $CompanyTable company = $CompanyTable(this);
  late final $UserTable user = $UserTable(this);
  late final $PostTable post = $PostTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [geo, address, company, user, post];
}
