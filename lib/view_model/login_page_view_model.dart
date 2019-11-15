import 'dart:async';

import 'package:dartz/dartz.dart';
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

  Future<bool> login(String email, String password, String device) async {
    _tokens = null;

    Either<ErrorHandler, Token> res =
        await apiSvc?.login(email, password, device);

    var tokens = res.fold((error) => error, (val) => val);

    if (tokens is Token) {
      _tokens = tokens;
    } else if (tokens is ErrorHandler) {
      _error = tokens;
    }

    return _tokens != null;
  }
}
