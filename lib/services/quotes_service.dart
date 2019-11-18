import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:login_app/interfaces/i_quotes_api.dart';
import 'package:login_app/model/token.dart';
import 'package:login_app/model/usuario.dart';
import 'package:login_app/services/error_handler/error_handler.dart';

import 'interceptor/app_interceptors.dart';

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
        validateStatus: (status) {
          return status < 500;
        }),
  );

  Dio addInterceptors(Dio dio) {
    dio.interceptors.add(AppInterceptors());
  }

  // ignore: slash_for_doc_comments
  /**
   * @brief Implementação do Singleton
   */
  static final QuotesApiService _singleton = new QuotesApiService._internal();
  factory QuotesApiService() {
    return _singleton;
  }
  QuotesApiService._internal() {
    dio = addInterceptors(dio);
  }

  // ignore: slash_for_doc_comments
  /**
   * @brief Login na API
   * @return Retorna os tokens de acesso
   */
  @override
  Future<Either<ErrorHandler, Token>> login(
      String email, String password, String device) async {
    try {
      Response response = await dio.post("/login", data: {
        'email': email,
        'password': password,
        'device': device,
      });
      if (response.statusCode == 200) {
        Token tokens = Token.fromJson(response.data);
        return Right(tokens);
      } else {
        final Map<String, dynamic> decodedMessage =
            json.decode(response.toString());
        return Left(
            new ErrorHandler(response.statusCode, decodedMessage['message']));
      }
    } on DioError catch (error) {
      final Map<String, dynamic> decodedMessage =
          json.decode(error.response.toString());
      return Left(new ErrorHandler(
          error.response.statusCode, decodedMessage['message']));
    }
  }

  @override
  Future<Either<ErrorHandler, Usuario>> usuario(int usuarioId) async {
    try {
      Response response = await dio.get("/usuario/$usuarioId",
          options: Options(headers: {"requiresToken": true}));

      if (response.statusCode == 200) {
        Usuario usuario = Usuario.fromJson(response.data);
        return Right(usuario);
      } else {
        final Map<String, dynamic> decodedMessage =
            json.decode(response.toString());
        return Left(
            new ErrorHandler(response.statusCode, decodedMessage['message']));
      }
    } on DioError catch (error) {
      final Map<String, dynamic> decodedMessage =
          json.decode(error.response.toString());
      return Left(new ErrorHandler(
          error.response.statusCode, decodedMessage['message']));
    }
  }
}
