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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserTableTable userTable = $UserTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userTable];
}
