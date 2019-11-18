import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      options.headers.addAll({"Authorization": "Bearer $token"});

      return super.onRequest(options);
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.message.contains("ERROR_001")) {
      navigatorKey.currentState
          .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
    }

    return super.onError(err);
  }
}
