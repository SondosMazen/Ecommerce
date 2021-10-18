import 'package:dio/dio.dart';
import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';

class ProductDetailsApiHelper {
  ProductDetailsApiHelper._() {
    dio = Dio();
  }
  static ProductDetailsApiHelper apiHelper = ProductDetailsApiHelper._();
  Dio dio;
  Future<AllProductsResponse> getProductDetails(int id) async {
    String url = 'https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    AllProductsResponse allProductsResponse =
        AllProductsResponse.fromJson(response.data);
    return allProductsResponse;
  }
}
