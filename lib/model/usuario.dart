import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable()
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

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        usuarioId: int.parse(json['usuarioId']),
        usuarioNome: json['usuarioNome'],
        usuarioEmail: json['usuarioEmail'],
        usuarioSenha: json['usuarioSenha'],
        usuarioAtivo: int.parse(json['usuarioAtivo']),
        usuarioSobre: json['usuarioSobre']);
  }

  Map<String, dynamic> toJson() => {
        'usuarioId': usuarioId,
        'usuarioNome': usuarioNome,
        'usuarioEmail': usuarioEmail,
        'usuarioSenha': usuarioSenha,
        'usuarioAtivo': usuarioAtivo,
        'usuarioSobre': usuarioSobre,
      };
}
