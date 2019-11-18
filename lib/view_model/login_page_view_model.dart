import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/database/login_dao.dart';
import 'package:login_app/database/moor_database.dart';
import 'package:login_app/database/usuario_logado_dao.dart';
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:login_app/main.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/model/usuario.dart';
import 'package:login_app/services/error_handler/error_handler.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageViewModel extends Model {
  Token _tokens;
  Token get tokens => _tokens;
  Usuario _loggedUser;
  set tokens(Token value) {
    _tokens = value;
    notifyListeners();
  }

  ErrorHandler _error;
  ErrorHandler get error => _error;
  set error(ErrorHandler value) {
    _error = value;
    notifyListeners();
  }

  final IQuotesApi apiSvc;

  LoginPageViewModel({@required this.apiSvc});

  Future<bool> login(String email, String password) async {
    _tokens = null;
    _error = null;

    // Obtem a informação sobre o dispositivo para enviar a API
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String device = "unknown";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.device;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    Either<ErrorHandler, Token> response =
        await apiSvc?.login(email, password, device);

    var decodedResponse = response.fold((error) => error, (val) => val);

    if (decodedResponse is Token) {
      _tokens = decodedResponse;
      _saveToken();
    } else if (decodedResponse is ErrorHandler) {
      _error = decodedResponse;
    }

    return _tokens != null;
  }

  Future<bool> getUsuarioFromServer(int usuarioId) async {
    _loggedUser = null;
    _error = null;

    Either<ErrorHandler, Usuario> response = await apiSvc?.usuario(usuarioId);

    var decodedResponse = response.fold((error) => error, (val) => val);

    if (decodedResponse is Usuario) {
      _loggedUser = decodedResponse;
    } else if (decodedResponse is ErrorHandler) {
      _error = decodedResponse;
    }

    return _loggedUser != null;
  }

  Future<void> _saveToken() async {
    final database = Provider.of<LoginDao>(navigatorKey.currentContext);
    await database.insertToken(LoginToken(
        id: null, token: _tokens.token, refresh_token: _tokens.refreshToken));

    final prefs = await SharedPreferences.getInstance();
    final key = "token";
    prefs.setString(key, _tokens.token);

    var usuarioId = _getUserFromToken(_tokens.token);
    var userGet = await getUsuarioFromServer(usuarioId);

//    if (userGet) {
//      await saveUsuarioLogado(_loggedUser);
//    }
  }

  Future<void> saveUsuarioLogado(Usuario usuario) async {
    final database = Provider.of<UsuarioLogadoDao>(navigatorKey.currentContext);
    await database.insertUser(UsuarioLogado(
        usuarioId: usuario.usuarioId,
        usuarioNome: usuario.usuarioNome,
        usuarioEmail: usuario.usuarioEmail,
        usuarioAtivo: usuario.usuarioAtivo,
        usuarioSobre: usuario.usuarioSobre));
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  int _getUserFromToken(String token) {
    Map<String, dynamic> tokenDecoded = parseJwt(token);
    int usuarioId = tokenDecoded['usuarioId'];
    return usuarioId;
  }

  _setUserFromSQLite(int usuarioId) async {
    final database = Provider.of<LoginDao>(navigatorKey.currentContext);
    await database.insertToken(LoginToken(
        id: null, token: _tokens.token, refresh_token: _tokens.refreshToken));
  }
}
