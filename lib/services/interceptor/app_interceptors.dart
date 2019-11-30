import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_app/utils/jwt_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");
      final tokenDecoded = JwtHelper.parseJwt(token);
      final expiredAt = tokenDecoded['expired_at'];
      final parsedDate = DateTime.parse(expiredAt);
      final now = new DateTime.now();
      final difference = parsedDate.difference(now).inSeconds;
      if (difference > 0) {
        options.headers.addAll({"Authorization": "Bearer $token"});
      }
      return super.onRequest(options);
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(response);
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(err);

    navigatorKey.currentState
        .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);

    return super.onError(err);
  }
}
