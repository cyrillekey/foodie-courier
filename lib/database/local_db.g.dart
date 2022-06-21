// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserTableCompanion extends UpdateCompanion<User> {
  final Value<int> customer_id;
  final Value<String> user_mail;
  final Value<String> user_name;
  final Value<String> user_phone;
  final Value<String> accountType;
  final Value<String> dateJoined;
  final Value<String> accountStatus;
  const UserTableCompanion({
    this.customer_id = const Value.absent(),
    this.user_mail = const Value.absent(),
    this.user_name = const Value.absent(),
    this.user_phone = const Value.absent(),
    this.accountType = const Value.absent(),
    this.dateJoined = const Value.absent(),
    this.accountStatus = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.customer_id = const Value.absent(),
    required String user_mail,
    required String user_name,
    required String user_phone,
    required String accountType,
    required String dateJoined,
    required String accountStatus,
  })  : user_mail = Value(user_mail),
        user_name = Value(user_name),
        user_phone = Value(user_phone),
        accountType = Value(accountType),
        dateJoined = Value(dateJoined),
        accountStatus = Value(accountStatus);
  static Insertable<User> custom({
    Expression<int>? customer_id,
    Expression<String>? user_mail,
    Expression<String>? user_name,
    Expression<String>? user_phone,
    Expression<String>? accountType,
    Expression<String>? dateJoined,
    Expression<String>? accountStatus,
  }) {
    return RawValuesInsertable({
      if (customer_id != null) 'customer_id': customer_id,
      if (user_mail != null) 'user_mail': user_mail,
      if (user_name != null) 'user_name': user_name,
      if (user_phone != null) 'user_phone': user_phone,
      if (accountType != null) 'account_type': accountType,
      if (dateJoined != null) 'date_joined': dateJoined,
      if (accountStatus != null) 'account_status': accountStatus,
    });
  }

  UserTableCompanion copyWith(
      {Value<int>? customer_id,
      Value<String>? user_mail,
      Value<String>? user_name,
      Value<String>? user_phone,
      Value<String>? accountType,
      Value<String>? dateJoined,
      Value<String>? accountStatus}) {
    return UserTableCompanion(
      customer_id: customer_id ?? this.customer_id,
      user_mail: user_mail ?? this.user_mail,
      user_name: user_name ?? this.user_name,
      user_phone: user_phone ?? this.user_phone,
      accountType: accountType ?? this.accountType,
      dateJoined: dateJoined ?? this.dateJoined,
      accountStatus: accountStatus ?? this.accountStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (customer_id.present) {
      map['customer_id'] = Variable<int>(customer_id.value);
    }
    if (user_mail.present) {
      map['user_mail'] = Variable<String>(user_mail.value);
    }
    if (user_name.present) {
      map['user_name'] = Variable<String>(user_name.value);
    }
    if (user_phone.present) {
      map['user_phone'] = Variable<String>(user_phone.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (dateJoined.present) {
      map['date_joined'] = Variable<String>(dateJoined.value);
    }
    if (accountStatus.present) {
      map['account_status'] = Variable<String>(accountStatus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('customer_id: $customer_id, ')
          ..write('user_mail: $user_mail, ')
          ..write('user_name: $user_name, ')
          ..write('user_phone: $user_phone, ')
          ..write('accountType: $accountType, ')
          ..write('dateJoined: $dateJoined, ')
          ..write('accountStatus: $accountStatus')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable with TableInfo<$UserTableTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _customer_idMeta =
      const VerificationMeta('customer_id');
  @override
  late final GeneratedColumn<int?> customer_id = GeneratedColumn<int?>(
      'customer_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _user_mailMeta = const VerificationMeta('user_mail');
  @override
  late final GeneratedColumn<String?> user_mail = GeneratedColumn<String?>(
      'user_mail', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _user_nameMeta = const VerificationMeta('user_name');
  @override
  late final GeneratedColumn<String?> user_name = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _user_phoneMeta = const VerificationMeta('user_phone');
  @override
  late final GeneratedColumn<String?> user_phone = GeneratedColumn<String?>(
      'user_phone', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String?> accountType = GeneratedColumn<String?>(
      'account_type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateJoinedMeta = const VerificationMeta('dateJoined');
  @override
  late final GeneratedColumn<String?> dateJoined = GeneratedColumn<String?>(
      'date_joined', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _accountStatusMeta =
      const VerificationMeta('accountStatus');
  @override
  late final GeneratedColumn<String?> accountStatus = GeneratedColumn<String?>(
      'account_status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        customer_id,
        user_mail,
        user_name,
        user_phone,
        accountType,
        dateJoined,
        accountStatus
      ];
  @override
  String get aliasedName => _alias ?? 'user_table';
  @override
  String get actualTableName => 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('customer_id')) {
      context.handle(
          _customer_idMeta,
          customer_id.isAcceptableOrUnknown(
              data['customer_id']!, _customer_idMeta));
    }
    if (data.containsKey('user_mail')) {
      context.handle(_user_mailMeta,
          user_mail.isAcceptableOrUnknown(data['user_mail']!, _user_mailMeta));
    } else if (isInserting) {
      context.missing(_user_mailMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_user_nameMeta,
          user_name.isAcceptableOrUnknown(data['user_name']!, _user_nameMeta));
    } else if (isInserting) {
      context.missing(_user_nameMeta);
    }
    if (data.containsKey('user_phone')) {
      context.handle(
          _user_phoneMeta,
          user_phone.isAcceptableOrUnknown(
              data['user_phone']!, _user_phoneMeta));
    } else if (isInserting) {
      context.missing(_user_phoneMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeMeta);
    }
    if (data.containsKey('date_joined')) {
      context.handle(
          _dateJoinedMeta,
          dateJoined.isAcceptableOrUnknown(
              data['date_joined']!, _dateJoinedMeta));
    } else if (isInserting) {
      context.missing(_dateJoinedMeta);
    }
    if (data.containsKey('account_status')) {
      context.handle(
          _accountStatusMeta,
          accountStatus.isAcceptableOrUnknown(
              data['account_status']!, _accountStatusMeta));
    } else if (isInserting) {
      context.missing(_accountStatusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {customer_id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      customer_id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}customer_id'])!,
      user_mail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_mail'])!,
      user_name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      user_phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_phone'])!,
      accountType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account_type'])!,
      dateJoined: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_joined'])!,
      accountStatus: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account_status'])!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class CourierTableCompanion extends UpdateCompanion<Courier> {
  final Value<int> courier_id;
  final Value<String> id_number;
  final Value<String> phone_number1;
  final Value<String> phone_number2;
  final Value<double> currentLatitude;
  final Value<double> currentLongitude;
  final Value<double> account_balance;
  final Value<double> rating;
  final Value<bool> onAssingment;
  final Value<bool> currentStatus;
  final Value<String> vehicle_registration;
  const CourierTableCompanion({
    this.courier_id = const Value.absent(),
    this.id_number = const Value.absent(),
    this.phone_number1 = const Value.absent(),
    this.phone_number2 = const Value.absent(),
    this.currentLatitude = const Value.absent(),
    this.currentLongitude = const Value.absent(),
    this.account_balance = const Value.absent(),
    this.rating = const Value.absent(),
    this.onAssingment = const Value.absent(),
    this.currentStatus = const Value.absent(),
    this.vehicle_registration = const Value.absent(),
  });
  CourierTableCompanion.insert({
    required int courier_id,
    required String id_number,
    required String phone_number1,
    required String phone_number2,
    required double currentLatitude,
    required double currentLongitude,
    required double account_balance,
    required double rating,
    required bool onAssingment,
    required bool currentStatus,
    required String vehicle_registration,
  })  : courier_id = Value(courier_id),
        id_number = Value(id_number),
        phone_number1 = Value(phone_number1),
        phone_number2 = Value(phone_number2),
        currentLatitude = Value(currentLatitude),
        currentLongitude = Value(currentLongitude),
        account_balance = Value(account_balance),
        rating = Value(rating),
        onAssingment = Value(onAssingment),
        currentStatus = Value(currentStatus),
        vehicle_registration = Value(vehicle_registration);
  static Insertable<Courier> custom({
    Expression<int>? courier_id,
    Expression<String>? id_number,
    Expression<String>? phone_number1,
    Expression<String>? phone_number2,
    Expression<double>? currentLatitude,
    Expression<double>? currentLongitude,
    Expression<double>? account_balance,
    Expression<double>? rating,
    Expression<bool>? onAssingment,
    Expression<bool>? currentStatus,
    Expression<String>? vehicle_registration,
  }) {
    return RawValuesInsertable({
      if (courier_id != null) 'courier_id': courier_id,
      if (id_number != null) 'id_number': id_number,
      if (phone_number1 != null) 'phone_number1': phone_number1,
      if (phone_number2 != null) 'phone_number2': phone_number2,
      if (currentLatitude != null) 'current_latitude': currentLatitude,
      if (currentLongitude != null) 'current_longitude': currentLongitude,
      if (account_balance != null) 'account_balance': account_balance,
      if (rating != null) 'rating': rating,
      if (onAssingment != null) 'on_assingment': onAssingment,
      if (currentStatus != null) 'current_status': currentStatus,
      if (vehicle_registration != null)
        'vehicle_registration': vehicle_registration,
    });
  }

  CourierTableCompanion copyWith(
      {Value<int>? courier_id,
      Value<String>? id_number,
      Value<String>? phone_number1,
      Value<String>? phone_number2,
      Value<double>? currentLatitude,
      Value<double>? currentLongitude,
      Value<double>? account_balance,
      Value<double>? rating,
      Value<bool>? onAssingment,
      Value<bool>? currentStatus,
      Value<String>? vehicle_registration}) {
    return CourierTableCompanion(
      courier_id: courier_id ?? this.courier_id,
      id_number: id_number ?? this.id_number,
      phone_number1: phone_number1 ?? this.phone_number1,
      phone_number2: phone_number2 ?? this.phone_number2,
      currentLatitude: currentLatitude ?? this.currentLatitude,
      currentLongitude: currentLongitude ?? this.currentLongitude,
      account_balance: account_balance ?? this.account_balance,
      rating: rating ?? this.rating,
      onAssingment: onAssingment ?? this.onAssingment,
      currentStatus: currentStatus ?? this.currentStatus,
      vehicle_registration: vehicle_registration ?? this.vehicle_registration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (courier_id.present) {
      map['courier_id'] = Variable<int>(courier_id.value);
    }
    if (id_number.present) {
      map['id_number'] = Variable<String>(id_number.value);
    }
    if (phone_number1.present) {
      map['phone_number1'] = Variable<String>(phone_number1.value);
    }
    if (phone_number2.present) {
      map['phone_number2'] = Variable<String>(phone_number2.value);
    }
    if (currentLatitude.present) {
      map['current_latitude'] = Variable<double>(currentLatitude.value);
    }
    if (currentLongitude.present) {
      map['current_longitude'] = Variable<double>(currentLongitude.value);
    }
    if (account_balance.present) {
      map['account_balance'] = Variable<double>(account_balance.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (onAssingment.present) {
      map['on_assingment'] = Variable<bool>(onAssingment.value);
    }
    if (currentStatus.present) {
      map['current_status'] = Variable<bool>(currentStatus.value);
    }
    if (vehicle_registration.present) {
      map['vehicle_registration'] =
          Variable<String>(vehicle_registration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourierTableCompanion(')
          ..write('courier_id: $courier_id, ')
          ..write('id_number: $id_number, ')
          ..write('phone_number1: $phone_number1, ')
          ..write('phone_number2: $phone_number2, ')
          ..write('currentLatitude: $currentLatitude, ')
          ..write('currentLongitude: $currentLongitude, ')
          ..write('account_balance: $account_balance, ')
          ..write('rating: $rating, ')
          ..write('onAssingment: $onAssingment, ')
          ..write('currentStatus: $currentStatus, ')
          ..write('vehicle_registration: $vehicle_registration')
          ..write(')'))
        .toString();
  }
}

class $CourierTableTable extends CourierTable
    with TableInfo<$CourierTableTable, Courier> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourierTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _courier_idMeta = const VerificationMeta('courier_id');
  @override
  late final GeneratedColumn<int?> courier_id = GeneratedColumn<int?>(
      'courier_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _id_numberMeta = const VerificationMeta('id_number');
  @override
  late final GeneratedColumn<String?> id_number = GeneratedColumn<String?>(
      'id_number', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _phone_number1Meta =
      const VerificationMeta('phone_number1');
  @override
  late final GeneratedColumn<String?> phone_number1 = GeneratedColumn<String?>(
      'phone_number1', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _phone_number2Meta =
      const VerificationMeta('phone_number2');
  @override
  late final GeneratedColumn<String?> phone_number2 = GeneratedColumn<String?>(
      'phone_number2', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _currentLatitudeMeta =
      const VerificationMeta('currentLatitude');
  @override
  late final GeneratedColumn<double?> currentLatitude =
      GeneratedColumn<double?>('current_latitude', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _currentLongitudeMeta =
      const VerificationMeta('currentLongitude');
  @override
  late final GeneratedColumn<double?> currentLongitude =
      GeneratedColumn<double?>('current_longitude', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _account_balanceMeta =
      const VerificationMeta('account_balance');
  @override
  late final GeneratedColumn<double?> account_balance =
      GeneratedColumn<double?>('account_balance', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double?> rating = GeneratedColumn<double?>(
      'rating', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _onAssingmentMeta =
      const VerificationMeta('onAssingment');
  @override
  late final GeneratedColumn<bool?> onAssingment = GeneratedColumn<bool?>(
      'on_assingment', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (on_assingment IN (0, 1))');
  final VerificationMeta _currentStatusMeta =
      const VerificationMeta('currentStatus');
  @override
  late final GeneratedColumn<bool?> currentStatus = GeneratedColumn<bool?>(
      'current_status', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (current_status IN (0, 1))');
  final VerificationMeta _vehicle_registrationMeta =
      const VerificationMeta('vehicle_registration');
  @override
  late final GeneratedColumn<String?> vehicle_registration =
      GeneratedColumn<String?>('vehicle_registration', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        courier_id,
        id_number,
        phone_number1,
        phone_number2,
        currentLatitude,
        currentLongitude,
        account_balance,
        rating,
        onAssingment,
        currentStatus,
        vehicle_registration
      ];
  @override
  String get aliasedName => _alias ?? 'courier_table';
  @override
  String get actualTableName => 'courier_table';
  @override
  VerificationContext validateIntegrity(Insertable<Courier> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('courier_id')) {
      context.handle(
          _courier_idMeta,
          courier_id.isAcceptableOrUnknown(
              data['courier_id']!, _courier_idMeta));
    } else if (isInserting) {
      context.missing(_courier_idMeta);
    }
    if (data.containsKey('id_number')) {
      context.handle(_id_numberMeta,
          id_number.isAcceptableOrUnknown(data['id_number']!, _id_numberMeta));
    } else if (isInserting) {
      context.missing(_id_numberMeta);
    }
    if (data.containsKey('phone_number1')) {
      context.handle(
          _phone_number1Meta,
          phone_number1.isAcceptableOrUnknown(
              data['phone_number1']!, _phone_number1Meta));
    } else if (isInserting) {
      context.missing(_phone_number1Meta);
    }
    if (data.containsKey('phone_number2')) {
      context.handle(
          _phone_number2Meta,
          phone_number2.isAcceptableOrUnknown(
              data['phone_number2']!, _phone_number2Meta));
    } else if (isInserting) {
      context.missing(_phone_number2Meta);
    }
    if (data.containsKey('current_latitude')) {
      context.handle(
          _currentLatitudeMeta,
          currentLatitude.isAcceptableOrUnknown(
              data['current_latitude']!, _currentLatitudeMeta));
    } else if (isInserting) {
      context.missing(_currentLatitudeMeta);
    }
    if (data.containsKey('current_longitude')) {
      context.handle(
          _currentLongitudeMeta,
          currentLongitude.isAcceptableOrUnknown(
              data['current_longitude']!, _currentLongitudeMeta));
    } else if (isInserting) {
      context.missing(_currentLongitudeMeta);
    }
    if (data.containsKey('account_balance')) {
      context.handle(
          _account_balanceMeta,
          account_balance.isAcceptableOrUnknown(
              data['account_balance']!, _account_balanceMeta));
    } else if (isInserting) {
      context.missing(_account_balanceMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('on_assingment')) {
      context.handle(
          _onAssingmentMeta,
          onAssingment.isAcceptableOrUnknown(
              data['on_assingment']!, _onAssingmentMeta));
    } else if (isInserting) {
      context.missing(_onAssingmentMeta);
    }
    if (data.containsKey('current_status')) {
      context.handle(
          _currentStatusMeta,
          currentStatus.isAcceptableOrUnknown(
              data['current_status']!, _currentStatusMeta));
    } else if (isInserting) {
      context.missing(_currentStatusMeta);
    }
    if (data.containsKey('vehicle_registration')) {
      context.handle(
          _vehicle_registrationMeta,
          vehicle_registration.isAcceptableOrUnknown(
              data['vehicle_registration']!, _vehicle_registrationMeta));
    } else if (isInserting) {
      context.missing(_vehicle_registrationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Courier map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Courier(
      courier_id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}courier_id'])!,
      id_number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_number'])!,
      phone_number1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number1'])!,
      phone_number2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number2'])!,
      currentLatitude: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_latitude'])!,
      currentLongitude: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}current_longitude'])!,
      account_balance: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}account_balance'])!,
      rating: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rating'])!,
      onAssingment: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}on_assingment'])!,
      currentStatus: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_status'])!,
      vehicle_registration: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}vehicle_registration'])!,
    );
  }

  @override
  $CourierTableTable createAlias(String alias) {
    return $CourierTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $CourierTableTable courierTable = $CourierTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userTable, courierTable];
}
