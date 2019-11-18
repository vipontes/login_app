import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      var header = prefs.get("Header");

      options.headers.addAll({"Authorization": "Bearer "});

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
