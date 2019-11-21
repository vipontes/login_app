import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable()
class Token extends Equatable {
  String token, refreshToken;

  Token({
    @required this.token,
    @required this.refreshToken,
  });

  Token.fromMap(Map<String, dynamic> map) {
    token = map['token'];
    refreshToken = map['refresh_token'];
  }

  Token.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        refreshToken = json['refresh_token'];

  Map<String, dynamic> toJson() => {
        'token': token,
        'refreshToken': refreshToken,
      };
}
