import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ model/product_model.dart';
import '../../core/constants/enum.dart';
import '../services/error_service.dart';
import '../services/product_services.dart';
import 'base_controller.dart';

final allProductsController =
    ChangeNotifierProvider<ProfileController>((ref) => ProfileController());

class ProfileController extends BaseChangeNotifier {
  final GetProducts getProjects = GetProducts();
  late Product product = Product();

  Future<void> toGetAllProducts() async {
    loadingState = LoadingState.loading;
    try {
      debugPrint('To Get All Products');
      final res = await getProjects.getAllProducts();
      if (res.statusCode == 200) {
        log('Response data: ${res.data}');
        product = Product.fromJson(res.data);
        loadingState = LoadingState.idle;
      } else {
        debugPrint(res.toString());
        loadingState = LoadingState.idle;
        throw Error();
      }
    } on DioException catch (e) {
      loadingState = LoadingState.idle;
      ErrorService.handleErrors(e);
    } catch (e) {
      loadingState = LoadingState.idle;
      ErrorService.handleErrors(e);
    }
    notifyListeners();
  }
}
