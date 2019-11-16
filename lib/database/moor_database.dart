import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class LoginTokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get token => text()();
  TextColumn get refresh_token => text()();
}

@UseMoor(tables: [LoginTokens], daos: [LoginDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'login-app.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [LoginTokens])
class LoginDao extends DatabaseAccessor<AppDatabase> with _$LoginDaoMixin {
  LoginDao(AppDatabase db) : super(db);
  // Tabela Token
  Future<List<LoginToken>> getToken() => select(loginTokens).get();
  Stream<List<LoginToken>> watchToken() => select(loginTokens).watch();
  Future insertToken(LoginToken token) => into(loginTokens).insert(token);
  Future updateToken(LoginToken token) => update(loginTokens).replace(token);
  Future deleteToken(LoginToken token) => delete(loginTokens).delete(token);
}
