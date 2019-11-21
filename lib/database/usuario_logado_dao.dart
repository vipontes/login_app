import 'package:moor_flutter/moor_flutter.dart';

import 'moor_database.dart';

part 'usuario_logado_dao.g.dart';

class UsuarioLogados extends Table {
  IntColumn get usuarioId => integer()();
  TextColumn get usuarioNome => text()();
  TextColumn get usuarioEmail => text()();
  TextColumn get usuarioSenha => text()();
  IntColumn get usuarioAtivo => integer()();
  TextColumn get usuarioSobre => text()();

  @override
  Set<Column> get primaryKey => {usuarioId};
}

@UseDao(tables: [UsuarioLogados])
class UsuarioLogadoDao extends DatabaseAccessor<AppDatabase>
    with _$UsuarioLogadoDaoMixin {
  UsuarioLogadoDao(AppDatabase db) : super(db);

  Future<UsuarioLogado> getLoggedUser() => select(usuarioLogados).getSingle();
  Future insertUser(UsuarioLogado user) => into(usuarioLogados).insert(user);
  Future updateUser(UsuarioLogado user) => update(usuarioLogados).replace(user);
  Future deleteUser(UsuarioLogado user) => delete(usuarioLogados).delete(user);
}
