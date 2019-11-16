import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_app/database/moor_database.dart';
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/services/error_handler/error_handler.dart';
import 'package:meta/meta.dart';
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
    } else if (decodedResponse is ErrorHandler) {
      _error = decodedResponse;
    }

    return _tokens != null;
  }

  Future<void> saveToken(LoginDao database) async {
    await database.insertToken(new LoginToken(
        id: null, token: _tokens.token, refresh_token: _tokens.refreshToken));
  }
}
