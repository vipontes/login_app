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

class UsuarioLogado extends DataClass implements Insertable<UsuarioLogado> {
  final int usuarioId;
  final String usuarioNome;
  final String usuarioEmail;
  final int usuarioAtivo;
  final String usuarioSobre;
  UsuarioLogado(
      {@required this.usuarioId,
      @required this.usuarioNome,
      @required this.usuarioEmail,
      @required this.usuarioAtivo,
      @required this.usuarioSobre});
  factory UsuarioLogado.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return UsuarioLogado(
      usuarioId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}usuario_id']),
      usuarioNome: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}usuario_nome']),
      usuarioEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}usuario_email']),
      usuarioAtivo: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}usuario_ativo']),
      usuarioSobre: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}usuario_sobre']),
    );
  }
  factory UsuarioLogado.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return UsuarioLogado(
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      usuarioNome: serializer.fromJson<String>(json['usuarioNome']),
      usuarioEmail: serializer.fromJson<String>(json['usuarioEmail']),
      usuarioAtivo: serializer.fromJson<int>(json['usuarioAtivo']),
      usuarioSobre: serializer.fromJson<String>(json['usuarioSobre']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'usuarioId': serializer.toJson<int>(usuarioId),
      'usuarioNome': serializer.toJson<String>(usuarioNome),
      'usuarioEmail': serializer.toJson<String>(usuarioEmail),
      'usuarioAtivo': serializer.toJson<int>(usuarioAtivo),
      'usuarioSobre': serializer.toJson<String>(usuarioSobre),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<UsuarioLogado>>(
      bool nullToAbsent) {
    return UsuarioLogadosCompanion(
      usuarioId: usuarioId == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioId),
      usuarioNome: usuarioNome == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioNome),
      usuarioEmail: usuarioEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioEmail),
      usuarioAtivo: usuarioAtivo == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioAtivo),
      usuarioSobre: usuarioSobre == null && nullToAbsent
          ? const Value.absent()
          : Value(usuarioSobre),
    ) as T;
  }

  UsuarioLogado copyWith(
          {int usuarioId,
          String usuarioNome,
          String usuarioEmail,
          int usuarioAtivo,
          String usuarioSobre}) =>
      UsuarioLogado(
        usuarioId: usuarioId ?? this.usuarioId,
        usuarioNome: usuarioNome ?? this.usuarioNome,
        usuarioEmail: usuarioEmail ?? this.usuarioEmail,
        usuarioAtivo: usuarioAtivo ?? this.usuarioAtivo,
        usuarioSobre: usuarioSobre ?? this.usuarioSobre,
      );
  @override
  String toString() {
    return (StringBuffer('UsuarioLogado(')
          ..write('usuarioId: $usuarioId, ')
          ..write('usuarioNome: $usuarioNome, ')
          ..write('usuarioEmail: $usuarioEmail, ')
          ..write('usuarioAtivo: $usuarioAtivo, ')
          ..write('usuarioSobre: $usuarioSobre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      usuarioId.hashCode,
      $mrjc(
          usuarioNome.hashCode,
          $mrjc(usuarioEmail.hashCode,
              $mrjc(usuarioAtivo.hashCode, usuarioSobre.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is UsuarioLogado &&
          other.usuarioId == usuarioId &&
          other.usuarioNome == usuarioNome &&
          other.usuarioEmail == usuarioEmail &&
          other.usuarioAtivo == usuarioAtivo &&
          other.usuarioSobre == usuarioSobre);
}

class UsuarioLogadosCompanion extends UpdateCompanion<UsuarioLogado> {
  final Value<int> usuarioId;
  final Value<String> usuarioNome;
  final Value<String> usuarioEmail;
  final Value<int> usuarioAtivo;
  final Value<String> usuarioSobre;
  const UsuarioLogadosCompanion({
    this.usuarioId = const Value.absent(),
    this.usuarioNome = const Value.absent(),
    this.usuarioEmail = const Value.absent(),
    this.usuarioAtivo = const Value.absent(),
    this.usuarioSobre = const Value.absent(),
  });
  UsuarioLogadosCompanion copyWith(
      {Value<int> usuarioId,
      Value<String> usuarioNome,
      Value<String> usuarioEmail,
      Value<int> usuarioAtivo,
      Value<String> usuarioSobre}) {
    return UsuarioLogadosCompanion(
      usuarioId: usuarioId ?? this.usuarioId,
      usuarioNome: usuarioNome ?? this.usuarioNome,
      usuarioEmail: usuarioEmail ?? this.usuarioEmail,
      usuarioAtivo: usuarioAtivo ?? this.usuarioAtivo,
      usuarioSobre: usuarioSobre ?? this.usuarioSobre,
    );
  }
}

class $UsuarioLogadosTable extends UsuarioLogados
    with TableInfo<$UsuarioLogadosTable, UsuarioLogado> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsuarioLogadosTable(this._db, [this._alias]);
  final VerificationMeta _usuarioIdMeta = const VerificationMeta('usuarioId');
  GeneratedIntColumn _usuarioId;
  @override
  GeneratedIntColumn get usuarioId => _usuarioId ??= _constructUsuarioId();
  GeneratedIntColumn _constructUsuarioId() {
    return GeneratedIntColumn(
      'usuario_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioNomeMeta =
      const VerificationMeta('usuarioNome');
  GeneratedTextColumn _usuarioNome;
  @override
  GeneratedTextColumn get usuarioNome =>
      _usuarioNome ??= _constructUsuarioNome();
  GeneratedTextColumn _constructUsuarioNome() {
    return GeneratedTextColumn(
      'usuario_nome',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioEmailMeta =
      const VerificationMeta('usuarioEmail');
  GeneratedTextColumn _usuarioEmail;
  @override
  GeneratedTextColumn get usuarioEmail =>
      _usuarioEmail ??= _constructUsuarioEmail();
  GeneratedTextColumn _constructUsuarioEmail() {
    return GeneratedTextColumn(
      'usuario_email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioAtivoMeta =
      const VerificationMeta('usuarioAtivo');
  GeneratedIntColumn _usuarioAtivo;
  @override
  GeneratedIntColumn get usuarioAtivo =>
      _usuarioAtivo ??= _constructUsuarioAtivo();
  GeneratedIntColumn _constructUsuarioAtivo() {
    return GeneratedIntColumn(
      'usuario_ativo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioSobreMeta =
      const VerificationMeta('usuarioSobre');
  GeneratedTextColumn _usuarioSobre;
  @override
  GeneratedTextColumn get usuarioSobre =>
      _usuarioSobre ??= _constructUsuarioSobre();
  GeneratedTextColumn _constructUsuarioSobre() {
    return GeneratedTextColumn(
      'usuario_sobre',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [usuarioId, usuarioNome, usuarioEmail, usuarioAtivo, usuarioSobre];
  @override
  $UsuarioLogadosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'usuario_logados';
  @override
  final String actualTableName = 'usuario_logados';
  @override
  VerificationContext validateIntegrity(UsuarioLogadosCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.usuarioId.present) {
      context.handle(_usuarioIdMeta,
          usuarioId.isAcceptableValue(d.usuarioId.value, _usuarioIdMeta));
    } else if (usuarioId.isRequired && isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (d.usuarioNome.present) {
      context.handle(_usuarioNomeMeta,
          usuarioNome.isAcceptableValue(d.usuarioNome.value, _usuarioNomeMeta));
    } else if (usuarioNome.isRequired && isInserting) {
      context.missing(_usuarioNomeMeta);
    }
    if (d.usuarioEmail.present) {
      context.handle(
          _usuarioEmailMeta,
          usuarioEmail.isAcceptableValue(
              d.usuarioEmail.value, _usuarioEmailMeta));
    } else if (usuarioEmail.isRequired && isInserting) {
      context.missing(_usuarioEmailMeta);
    }
    if (d.usuarioAtivo.present) {
      context.handle(
          _usuarioAtivoMeta,
          usuarioAtivo.isAcceptableValue(
              d.usuarioAtivo.value, _usuarioAtivoMeta));
    } else if (usuarioAtivo.isRequired && isInserting) {
      context.missing(_usuarioAtivoMeta);
    }
    if (d.usuarioSobre.present) {
      context.handle(
          _usuarioSobreMeta,
          usuarioSobre.isAcceptableValue(
              d.usuarioSobre.value, _usuarioSobreMeta));
    } else if (usuarioSobre.isRequired && isInserting) {
      context.missing(_usuarioSobreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {usuarioId};
  @override
  UsuarioLogado map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UsuarioLogado.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UsuarioLogadosCompanion d) {
    final map = <String, Variable>{};
    if (d.usuarioId.present) {
      map['usuario_id'] = Variable<int, IntType>(d.usuarioId.value);
    }
    if (d.usuarioNome.present) {
      map['usuario_nome'] = Variable<String, StringType>(d.usuarioNome.value);
    }
    if (d.usuarioEmail.present) {
      map['usuario_email'] = Variable<String, StringType>(d.usuarioEmail.value);
    }
    if (d.usuarioAtivo.present) {
      map['usuario_ativo'] = Variable<int, IntType>(d.usuarioAtivo.value);
    }
    if (d.usuarioSobre.present) {
      map['usuario_sobre'] = Variable<String, StringType>(d.usuarioSobre.value);
    }
    return map;
  }

  @override
  $UsuarioLogadosTable createAlias(String alias) {
    return $UsuarioLogadosTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $LoginTokensTable _loginTokens;
  $LoginTokensTable get loginTokens => _loginTokens ??= $LoginTokensTable(this);
  $UsuarioLogadosTable _usuarioLogados;
  $UsuarioLogadosTable get usuarioLogados =>
      _usuarioLogados ??= $UsuarioLogadosTable(this);
  LoginDao _loginDao;
  LoginDao get loginDao => _loginDao ??= LoginDao(this as AppDatabase);
  UsuarioLogadoDao _usuarioLogadoDao;
  UsuarioLogadoDao get usuarioLogadoDao =>
      _usuarioLogadoDao ??= UsuarioLogadoDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [loginTokens, usuarioLogados];
}
