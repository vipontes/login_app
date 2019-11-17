import 'package:moor_flutter/moor_flutter.dart';

import 'moor_database.dart';

part 'login_dao.g.dart';

class LoginTokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get token => text()();
  TextColumn get refresh_token => text()();
}

@UseDao(tables: [LoginTokens])
class LoginDao extends DatabaseAccessor<AppDatabase> with _$LoginDaoMixin {
  LoginDao(AppDatabase db) : super(db);

  Future<List<LoginToken>> getToken() => select(loginTokens).get();
  Stream<List<LoginToken>> watchToken() => select(loginTokens).watch();
  Future insertToken(LoginToken token) => into(loginTokens).insert(token);
  Future updateToken(LoginToken token) => update(loginTokens).replace(token);
  Future deleteToken(LoginToken token) => delete(loginTokens).delete(token);
}
