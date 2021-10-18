import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';

class HomeApiHelper {
  HomeApiHelper._() {
    dio = Dio();
  }
  static HomeApiHelper apiHelper = HomeApiHelper._();
  Dio dio;

  Future<List<AllProductsResponse>> getAllProducts(
      [int limit = 20, sort = 'desc']) async {
    try {
      String url = 'https://fakestoreapi.com/products?limit=$limit';
      Response response = await dio.get(url);

      List responses = response.data;
      List<AllProductsResponse> allProductsResponses =
          responses.map((e) => AllProductsResponse.fromJson(e)).toList();
      return allProductsResponses;
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<List<dynamic>> getAllCategories() async {
    try {
      String url = 'https://fakestoreapi.com/products/categories';
      Response response = await dio.get(url);
      return response.data;
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<List<AllProductsResponse>> getAllProductsInCategory(
      String categoryName) async {
    try {
      String url = 'https://fakestoreapi.com/products/category/$categoryName';
      Response response = await dio.get(url);
      List responses = response.data;
      List<AllProductsResponse> allProductsResponses =
          responses.map((e) => AllProductsResponse.fromJson(e)).toList();
      return allProductsResponses;
    } on Exception catch (e) {
      // TODO
    }
  }
}
