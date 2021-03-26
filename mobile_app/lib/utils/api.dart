import 'dart:async';
import 'dart:io';

import 'package:birdablo_mobile/config/application.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class API {
  static String baseUrl = "";

  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: 30000,
      sendTimeout: 60000,
      receiveTimeout: 30000,
      contentType: 'application/json; charset=utf-8',
      baseUrl: baseUrl,
    ),
  );

  API() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    // dio.interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          Application.sharePreference.hasKey("token")
              ? options.headers["Authorization"] = "Bearer ${Application.sharePreference.getString("token")}"
              : {};
          print(options.uri);
          return options; //continue
        },
        onResponse: (Response response) async {
          return response; // continue
        },
        onError: (DioError e) async {
          handleTimeOutException(e.type);
          // Refresh Token
          print(e.message);
          return e.response; //continue
        },
      ),
    );
  }

  void handleTimeOutException(DioErrorType type) {
    switch (type) {
      case DioErrorType.CONNECT_TIMEOUT:
        Application.toast.showToastFailed("Failed connect to server");
        break;
      case DioErrorType.SEND_TIMEOUT:
        Application.toast.showToastFailed("Failed sending data to server");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        Application.toast.showToastFailed("Failed receiving data from server");
        break;
      default:
        Application.toast.showToastFailed("No Network");
        break;
    }
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    return dio.get(url, queryParameters: params);
  }

  Future post(String url, Map<String, dynamic> params) async {
    return dio.post(url, data: params);
  }

  Future put(String url, [Map<String, dynamic> params]) async {
    return dio.put(url, data: params);
  }

  Future delete(String url, [Map<String, dynamic> params]) async {
    return dio.delete(url, queryParameters: params);
  }
}
