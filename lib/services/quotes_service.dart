import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/services/error_handler/error_handler.dart';

class QuotesApiService implements IQuotesApi {
  // ignore: slash_for_doc_comments
  /**
   * @brief Inicialização do Dio
   */
  Dio dio = new Dio(
    new BaseOptions(
      baseUrl: "http://quotes.easify.info/v1",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  // ignore: slash_for_doc_comments
  /**
   * @brief Implementação do Singleton
   */
  static final QuotesApiService _singleton = new QuotesApiService._internal();
  factory QuotesApiService() {
    return _singleton;
  }
  QuotesApiService._internal();

  // ignore: slash_for_doc_comments
  /**
   * @brief Login na API
   * @return Retorna os tokens de acesso
   */
  @override
  Future<Either<ErrorHandler, Token>> login(
      String email, String password, String device) async {
    Response response = await dio.post("/login", data: {
      'email': email,
      'password': password,
      'device': device,
    });

    if (response.statusCode == 200) {
      Token tokens = Token.fromJson(response.data);
      return Right(tokens);
    } else {
      return Left(new ErrorHandler(response.statusCode, response.data.message));
    }
  }
}
