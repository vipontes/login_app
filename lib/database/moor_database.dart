import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'login_dao.dart';
import 'usuario_logado_dao.dart';

part 'moor_database.g.dart';

@UseMoor(
    tables: [LoginTokens, UsuarioLogado], daos: [LoginDao, UsuarioLogadoDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'login-app.sqlite',
          logStatements: true,
        )));

  @override
  int get schemaVersion => 1;
}
