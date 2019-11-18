import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/database/login_dao.dart';
import 'package:login_app/database/moor_database.dart';
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/services/error_handler/error_handler.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPageViewModel extends Model {
  Token _tokens;
  Token get tokens => _tokens;
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

  BuildContext _context;
  set context(BuildContext value) {
    _context = value;
  }

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
      _saveUser(_tokens.token);
    } else if (decodedResponse is ErrorHandler) {
      _error = decodedResponse;
    }

    return _tokens != null;
  }

  Future<void> saveToken() async {
    final database = Provider.of<LoginDao>(_context);
    await database.insertToken(new LoginToken(
        id: null, token: _tokens.token, refresh_token: _tokens.refreshToken));
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

  _saveUser(String token) {
    Map<String, dynamic> tokenDecoded = parseJwt(token);
    int usuarioId = tokenDecoded['usuarioId'];
  }

  _setUserFromSQLite(int usuarioId) async {
    final database = Provider.of<LoginDao>(_context);
    await database.insertToken(new LoginToken(
        id: null, token: _tokens.token, refresh_token: _tokens.refreshToken));
  }
}
