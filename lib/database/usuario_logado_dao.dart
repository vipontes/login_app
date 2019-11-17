import 'package:moor_flutter/moor_flutter.dart';

import 'moor_database.dart';

part 'usuario_logado_dao.g.dart';

class UsuarioLogado extends Table {
  IntColumn get usuarioId => integer()();
  TextColumn get usuarioNome => text()();
  TextColumn get usuarioEmail => text()();
  IntColumn get usuarioAtivo => integer()();
  TextColumn get usuarioSobre => text()();

  @override
  Set<Column> get primaryKey => {usuarioId};
}

@UseDao(tables: [UsuarioLogado])
class UsuarioLogadoDao extends DatabaseAccessor<AppDatabase>
    with _$UsuarioLogadoDaoMixin {
  UsuarioLogadoDao(AppDatabase db) : super(db);

  Future<UsuarioLogadoData> getLoggedUser() =>
      select(usuarioLogado).getSingle();
  Future insertUser(UsuarioLogadoData user) => into(usuarioLogado).insert(user);
  Future updateUser(UsuarioLogadoData user) =>
      update(usuarioLogado).replace(user);
  Future deleteUser(UsuarioLogadoData user) =>
      delete(usuarioLogado).delete(user);
}
