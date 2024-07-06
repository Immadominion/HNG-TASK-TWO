import 'package:dio/dio.dart' show Response;

import 'dio_mixin.dart';

class GetProducts with DioMixin {
  Future<Response<dynamic>> getAllProducts() async {
    final customHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    final response = await connect(customHeaders: customHeaders).get(
      "",
    );
    return response;
  }
}
