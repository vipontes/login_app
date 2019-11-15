import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/services/error_handler/error_handler.dart';

abstract class IQuotesApi {
  Future<Either<ErrorHandler, Token>> login(
      String email, String password, String device);
}
