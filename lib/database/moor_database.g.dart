// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class LoginToken extends DataClass implements Insertable<LoginToken> {
  final int id;
  final String token;
  final String refresh_token;
  LoginToken(
      {@required this.id, @required this.token, @required this.refresh_token});
  factory LoginToken.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return LoginToken(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
      refresh_token: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}refresh_token']),
    );
  }
  factory LoginToken.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return LoginToken(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
      refresh_token: serializer.fromJson<String>(json['refresh_token']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
      'refresh_token': serializer.toJson<String>(refresh_token),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<LoginToken>>(bool nullToAbsent) {
    return LoginTokensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
      refresh_token: refresh_token == null && nullToAbsent
          ? const Value.absent()
          : Value(refresh_token),
    ) as T;
  }

  LoginToken copyWith({int id, String token, String refresh_token}) =>
      LoginToken(
        id: id ?? this.id,
        token: token ?? this.token,
        refresh_token: refresh_token ?? this.refresh_token,
      );
  @override
  String toString() {
    return (StringBuffer('LoginToken(')
          ..write('id: $id, ')
          ..write('token: $token, ')
          ..write('refresh_token: $refresh_token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(token.hashCode, refresh_token.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is LoginToken &&
          other.id == id &&
          other.token == token &&
          other.refresh_token == refresh_token);
}

class LoginTokensCompanion extends UpdateCompanion<LoginToken> {
  final Value<int> id;
  final Value<String> token;
  final Value<String> refresh_token;
  const LoginTokensCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
    this.refresh_token = const Value.absent(),
  });
  LoginTokensCompanion copyWith(
      {Value<int> id, Value<String> token, Value<String> refresh_token}) {
    return LoginTokensCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }
}

class $LoginTokensTable extends LoginTokens
    with TableInfo<$LoginTokensTable, LoginToken> {
  final GeneratedDatabase _db;
  final String _alias;
  $LoginTokensTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      false,
    );
  }

  final VerificationMeta _refresh_tokenMeta =
      const VerificationMeta('refresh_token');
  GeneratedTextColumn _refresh_token;
  @override
  GeneratedTextColumn get refresh_token =>
      _refresh_token ??= _constructRefreshToken();
  GeneratedTextColumn _constructRefreshToken() {
    return GeneratedTextColumn(
      'refresh_token',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, token, refresh_token];
  @override
  $LoginTokensTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'login_tokens';
  @override
  final String actualTableName = 'login_tokens';
  @override
  VerificationContext validateIntegrity(LoginTokensCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.token.present) {
      context.handle(
          _tokenMeta, token.isAcceptableValue(d.token.value, _tokenMeta));
    } else if (token.isRequired && isInserting) {
      context.missing(_tokenMeta);
    }
    if (d.refresh_token.present) {
      context.handle(
          _refresh_tokenMeta,
          refresh_token.isAcceptableValue(
              d.refresh_token.value, _refresh_tokenMeta));
    } else if (refresh_token.isRequired && isInserting) {
      context.missing(_refresh_tokenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoginToken map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return LoginToken.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(LoginTokensCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.token.present) {
      map['token'] = Variable<String, StringType>(d.token.value);
    }
    if (d.refresh_token.present) {
      map['refresh_token'] =
          Variable<String, StringType>(d.refresh_token.value);
    }
    return map;
  }

  @override
  $LoginTokensTable createAlias(String alias) {
    return $LoginTokensTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $LoginTokensTable _loginTokens;
  $LoginTokensTable get loginTokens => _loginTokens ??= $LoginTokensTable(this);
  LoginDao _loginDao;
  LoginDao get loginDao => _loginDao ??= LoginDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [loginTokens];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$LoginDaoMixin on DatabaseAccessor<AppDatabase> {
  $LoginTokensTable get loginTokens => db.loginTokens;
}
