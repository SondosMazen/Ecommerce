import 'package:ecommerce_fav_cart_app/ui/home/models/all_products_response.dart';
import 'package:ecommerce_fav_cart_app/ui/product_details/data/api_helper.dart';
import 'package:flutter/material.dart';

class ProductDetailsProvider extends ChangeNotifier {
  AllProductsResponse product;
  getProductResponse(int id) async {
    product = null;
    product = await ProductDetailsApiHelper.apiHelper.getProductDetails(id);
    notifyListeners();
  }
}
