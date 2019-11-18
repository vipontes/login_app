import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Usuario extends Equatable {
  int usuarioId, usuarioAtivo;
  String usuarioNome, usuarioEmail, usuarioSenha, usuarioSobre;

  Usuario({
    @required this.usuarioId,
    @required this.usuarioNome,
    @required this.usuarioEmail,
    @required this.usuarioSenha,
    @required this.usuarioAtivo,
    @required this.usuarioSobre,
  });

  Usuario.fromMap(Map<String, dynamic> map) {
    usuarioId = map['usuarioId'];
    usuarioNome = map['usuarioNome'];
    usuarioEmail = map['usuarioEmail'];
    usuarioSenha = map['usuarioSenha'];
    usuarioAtivo = map['usuarioAtivo'];
    usuarioSobre = map['usuarioSobre'];
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : usuarioId = json['usuarioId'],
        usuarioNome = json['usuarioNome'],
        usuarioEmail = json['usuarioEmail'],
        usuarioSenha = json['usuarioSenha'],
        usuarioAtivo = json['usuarioAtivo'],
        usuarioSobre = json['usuarioSobre'];

  Map<String, dynamic> toJson() => {
        'usuarioId': usuarioId,
        'usuarioNome': usuarioNome,
        'usuarioEmail': usuarioEmail,
        'usuarioSenha': usuarioSenha,
        'usuarioAtivo': usuarioAtivo,
        'usuarioSobre': usuarioSobre,
      };
}
