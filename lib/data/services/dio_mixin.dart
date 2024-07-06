// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String API_KEY = "c894c8e1a2194691a47635173a03906920240705033108285886";
const String APP_ID = "TYI7GQKMA05DXRM";
const String organization_id = "fd07a934a2904e4abd71fcfeabff74a4";

const String url =
    "https://api.timbu.cloud/products?organization_id=$organization_id&reverse_sort=false&page=1&size=10&Appid=$APP_ID&Apikey=$API_KEY";

mixin DioMixin {
  Dio connect({Map<String, dynamic>? customHeaders}) {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (customHeaders != null) {
            options.headers.addAll(Map<String, dynamic>.from(customHeaders));
          }
          return handler.next(options);
        },
        onError: (DioError e, handler) {
          debugPrint('DioError Type: $e');
          String errorMessage = _extractErrorMessage(e);
          debugPrint('DioError Type: $errorMessage');
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  Future<Response<dynamic>> sendRequest(
      Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      return response;
    } on DioError catch (e) {
      // Handle Dio errors (e.g., network issues, non-200 status codes)
      String message = e.message.toString();
      message = _extractErrorMessage(e);
      if (message == '') {
      } else if (message.toLowerCase() == 'unauthenticated') {
        debugPrint('User is unauthenticated');
      } else {
        debugPrint('User is unauthenticated 002 => $message');
      }
      log('Dio Error 01: $e', error: e);

      rethrow;
    } catch (e) {
      // Handle other errors
      log('Dio Error 02: $e', error: e);
      rethrow;
    }
  }
}

String _extractErrorMessage(DioError e) {
  String errorMessage = '';

  try {
    Map<String, dynamic>? responseData =
        e.response?.data as Map<String, dynamic>?;

    if (responseData != null && responseData.containsKey('message')) {
      errorMessage = responseData['message'].toString();
    } else {
      debugPrint('Response Data Structure: $responseData');
    }
  } catch (error) {
    log('Error extracting error message: $error');
  }

  return errorMessage;
}
